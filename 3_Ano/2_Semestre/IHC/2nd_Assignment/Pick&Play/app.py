from flask import Flask, render_template, redirect, url_for, flash,request, session #  type: ignore
from flask_sqlalchemy import SQLAlchemy#  type: ignore

from flask_migrate import Migrate # type: ignore
from getStats import *
from datetime import datetime
import math
import time
import urllib.parse

app = Flask(__name__)
# Old SQLite database 
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///users.db'
app.config['SECRET_KEY'] = "secretpasswordkey"

#Initialize database
db=SQLAlchemy(app)
migrate = Migrate(app, db)


class Multiplayer(db.Model):
    id = db.Column(db.Integer(), primary_key=True)
    day = db.Column(db.String(10), nullable=False)
    userId = db.Column(db.Integer(), nullable=False)
    gameMode = db.Column(db.Integer(), nullable=False)
 
class MultiplayerPicks(db.Model):
    id = db.Column(db.Integer(),primary_key=True)
    multipId = db.Column(db.String(40), nullable=False)
    gameid =  db.Column(db.String(20), nullable=False)
    winner = db.Column(db.String(10), nullable=False)
    correct = db.Column(db.Integer())
    userId = db.Column(db.Integer(), nullable=False)

class CoinFlip(db.Model):
    id = db.Column(db.String(40), primary_key=True, name='coin_flip_pk')
    day = db.Column(db.String(10), nullable=False)
    userId = db.Column(db.Integer(), nullable=False)
    gameId = db.Column(db.String(20), nullable=False)
    userPick = db.Column(db.String(10), nullable=False)
    price = db.Column(db.Integer(), nullable=False)
    result = db.Column(db.String(10))
    opponentId = db.Column(db.Integer())

class Games(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    team1_id = db.Column(db.Integer, nullable=False)
    team2_id = db.Column(db.Integer, nullable=False)
    game_date = db.Column(db.String(10), nullable=False)
    score1 = db.Column(db.Integer, nullable=False)
    score2 = db.Column(db.Integer, nullable=False)
    timestart = db.Column(db.String(10),nullable=False)

def load_games_to_database():
    months = ["Oct","Nov","Dec","Jan","Feb","Mar","Apr"]
    for month in months:
        with open('static/files/games/games{}.json'.format(month)) as file:
            data = json.load(file)
        for date, games in data.items():
            for game in games:
                team1 = game['Home']
                team2 = game['Visitor']
                start = game['Start']
                team1_query = Teams.query.filter_by(shortTeamName=team1).first()
                id_team1 = team1_query.id
                team1_query.arena = game['Arena']
                db.session.commit()
                team2_query = Teams.query.filter_by(shortTeamName=team2).first()
                id_team2 = team2_query.id
                if Games.query.filter_by(team1_id=id_team1,team2_id=id_team2,game_date=date).first() == None:
                    game_to_add = Games(team1_id=id_team1, team2_id=id_team2, game_date=date, score1=0, score2=0,timestart=start)
                    db.session.add(game_to_add)
        db.session.commit()

def load_players_to_db(team):
    with open('static/files/teams/{}.json'.format(team)) as file:
        data = json.load(file)
    print(data)
    players_data = data["Players"]
    teamPlayers = []
    for player_data in players_data:
        playerName = player_data["Player"].split(" ")
        playerName = playerName[0]+ " "+playerName[1]
        if playerName[0] == "Mo":
            playerName = "Mohamed"+" "+playerName[1]
        teamPlayers.append(playerName)
        player = Player.query.filter_by(name=playerName).first()
        if player is None:  # Player is not on database, gets added
            team_id = Teams.query.filter_by(shortTeamName=team).first().id
            player = Player(name=playerName,link=player_data["Link"],games=0,points=0,rebounds=0,assists=0,steals=0, blocks=0,
                            fouls=0, turnovers=0,total_makes=0,total_shots=0,three_makes=0,three_shots=0,ft_makes=0,ft_shots=0,
                            team_id=team_id)
            db.session.add(player)
        else: # Player is in the database
            player_team = Teams.query.filter_by(id=player.team_id).first()
            if team != Teams.query.filter_by(shortTeamName=player_team.shortTeamName).first().shortTeamName: # Player in the database has been traded(changed teams)
                player_to_delete = Player.query.filter_by(name=player.name,team_id=player.team_id).first()
                db.session.delete(player_to_delete)
                team_id = Teams.query.filter_by(shortTeamName=team).first().id # add the player to his new team, with the stats from the full season
                player_to_new_team = Player(name=player.name,link=player.link,games=player.games,points=player.points,assists=player.assists,rebounds=player.rebounds,team_id=team_id,
                                            steals=player.steals, blocks=player.blocks, fouls=player.fouls, turnovers=player.turnovers,total_makes=player.total_makes,total_shots=player.total_shots,
                                            three_makes=player.three_makes, three_shots=player.three_shots, ft_makes=player.ft_makes, ft_shots=player.ft_shots)
                db.session.add(player_to_new_team)
    db.session.commit()
    team_id = Teams.query.filter_by(shortTeamName=team).first().id
    for db_player in Player.query.filter_by(team_id=team_id): # check if there any players that are not on the team anymore
        if all(db_player.name != playerName for playerName in teamPlayers): # if player from certain team in database does not match
            db.session.delete(db_player)                                   # any other players in team file, player gets removed
    db.session.commit()

def give_positions(team):
    with open('static/files/teams/{}.json'.format(team)) as file:
        data = json.load(file)
    players = data["Players"]
    for player in players:
        db_player = Player.query.filter_by(name=player['Player']).first()
        if db_player is not None:
            db_player.position = player['Pos']
    db.session.commit()

def getPlayerStatistics(player):
    threeFG = 0
    totalFG = 0
    freeThrowPct = 0
    if player.games == 0 :
        return None
    if player.three_shots != 0:
        threeFG = round((player.three_makes/player.three_shots)*100,1)
    if player.total_shots != 0:
        totalFG = round((player.total_makes/player.total_shots)*100,1)
    if player.ft_shots != 0:
        freeThrowPct = round((player.ft_makes/player.ft_shots)*100,1)
    return {"Name":player.name,
            "Link":player.link,
            "Pos":player.position,
            "Games":player.games,
            "PPG":round(player.points/player.games,1),
            "RPG":round(player.rebounds/player.games,1),
            "APG":round(player.assists/player.games,1),
            "SPG":round(player.steals/player.games,1),
            "BPG":round(player.blocks/player.games,1),
            "FPG":round(player.fouls/player.games,1),
            "TPG":round(player.turnovers/player.games,1),
            "FG%":totalFG,
            "3PT%":threeFG,
            "FT%":freeThrowPct
            }

class Player(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    link = db.Column(db.String(250), nullable=False)
    games = db.Column(db.Integer())
    points = db.Column(db.Integer())
    rebounds = db.Column(db.Integer())
    assists = db.Column(db.Integer())
    steals = db.Column(db.Integer())
    blocks = db.Column(db.Integer())
    fouls = db.Column(db.Integer())
    turnovers = db.Column(db.Integer())
    position = db.Column(db.String(10))
    total_makes = db.Column(db.Integer())
    total_shots = db.Column(db.Integer())
    three_makes = db.Column(db.Integer())
    three_shots = db.Column(db.Integer())
    ft_makes = db.Column(db.Integer())
    ft_shots = db.Column(db.Integer())
    team_id = db.Column(db.Integer(), nullable=False)
def updateGameScore(date):
    with open('static/files/games_played/boxscore_{}-{}.json'.format(getDateMonth(date),getDateDay(date))) as file:
        data = json.load(file)
    for game in Games.query.filter_by(game_date=date):
        home_team = Teams.query.filter_by(id=game.team1_id).first()
        away_team = Teams.query.filter_by(id=game.team2_id).first()
        homePlayerStats = data["{} vs {}".format(home_team.shortTeamName,away_team.shortTeamName)][home_team.shortTeamName]
        awayPlayerStats = data["{} vs {}".format(home_team.shortTeamName,away_team.shortTeamName)][away_team.shortTeamName]
        game.score1 = sum([homePlayerStats[player]["PTS"] for player in homePlayerStats.keys()])
        game.score2 = sum([awayPlayerStats[player]["PTS"] for player in awayPlayerStats.keys()])
        db.session.commit()



def update_game_stats(date):
    with open('static/files/games_played/boxscore_{}-{}.json'.format(getDateMonth(date),getDateDay(date))) as file:
        data = json.load(file)
    for game, stats in data.items():
        teams = game.split(" vs ")
        for team in teams:
            if stats["Winner"] == team:
                team_db = Teams.query.filter_by(shortTeamName=team).first()
                team_db.wins += 1
            else: 
                team_db = Teams.query.filter_by(shortTeamName=team).first()
                team_db.losses += 1  
            db.session.commit()
            for player, player_stats in stats[team].items():
                player_db = Player.query.filter_by(name=player).first()
                if not player_db:
                    continue
                player_db.games += 1
                player_db.points +=  player_stats['PTS']
                player_db.assists +=  player_stats['AST']
                player_db.rebounds +=  player_stats['REB']
                player_db.steals +=  player_stats['STL']
                player_db.blocks +=  player_stats['BLK']
                player_db.turnovers +=  player_stats['Tov']
                player_db.fouls +=  player_stats['FLS']
                player_db.total_makes +=  player_stats['FGM']
                player_db.total_shots +=  player_stats['FGA']
                player_db.three_makes +=  player_stats['3PM']
                player_db.three_shots +=  player_stats['3PA']
                player_db.ft_makes +=  player_stats['FTM']
                player_db.ft_shots +=  player_stats['FTA']
                db.session.commit()
    print(f"Game Stats updated on {date}\n")


class Teams(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    shortTeamName = db.Column(db.String(10), unique=True, nullable=False)
    teamName = db.Column(db.String(50), unique=True, nullable=False)
    arena = db.Column(db.String(80))
    wins = db.Column(db.Integer)
    losses = db.Column(db.Integer)

def load_teams_to_database():
    for i in range(len(teams)):
        team_abv= teamsshort[i]
        team_full = teams[i]
        if Teams.query.filter_by(shortTeamName=team_abv).first() is not None:
            continue          
        new_team = Teams(shortTeamName=team_abv, teamName=team_full, wins=0, losses=0, arena="TBD")
        db.session.add(new_team)
    db.session.commit()

def resetTeams_AND_Players_Stats():
    for player in Player.query.all():
        player.games = 0 
        player.points = 0
        player.rebounds = 0
        player.assists = 0
        player.steals = 0
        player.blocks = 0
        player.turnovers = 0
        player.fouls = 0
        player.total_makes = 0
        player.total_shots = 0
        player.three_makes= 0
        player.three_shots = 0
        player.ft_makes = 0
        player.ft_shots = 0
    db.session.commit()
    for team in Teams.query.all():
        team.wins = 0
        team.losses = 0
    db.session.commit()
    


class Users(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False, unique=True)
    password_hash = db.Column(db.String(128))
    wallet = db.Column(db.Float)
    date_added = db.Column(db.DateTime, default=datetime.now)

    @property
    def password(self):
        raise AttributeError('Password is not a readable attribute')

    
@app.route('/')
def index():
    wallet = 0
    if "user" in session:
        userLogged = True
        wallet = Users.query.filter_by(id=session["user"]).first().wallet
    else:
        userLogged = False
    user = Users.query.filter_by(id=5).first()
    user.username = "Test_User"
    db.session.commit()
    return render_template('index.html',userLogged=userLogged,wallet=wallet)

@app.route('/multiplayer')
def multiplayer():
    wallet = 0
    if "user" in session:
        userLogged = True
        wallet = Users.query.filter_by(id=session["user"]).first().wallet
    else:
        userLogged = False
    games = Games.query.filter_by(game_date = "Apr9")
    gamesToday = {}
    for game in games:
        team1 = Teams.query.filter_by(id = game.team1_id).first()
        team2 = Teams.query.filter_by(id = game.team2_id).first()
        gamesToday.update({game.id: {"name1":team1.teamName, "abv1":team1.shortTeamName,"arena":team1.arena,"name2":team2.teamName,"abv2":team2.shortTeamName}})       
    keys = list(gamesToday.keys())
    return render_template('multiplayer.html', games = gamesToday,userLogged=userLogged,wallet=wallet,keys=keys)

@app.route('/bet/<value>/games=<encoded_gamesWinners>',methods=['GET','POST'])
def bet(value, encoded_gamesWinners):
    games = urllib.parse.unquote(encoded_gamesWinners)
    if "user" in session:
        user = session["user"]
    else :
        flash('You must log in to submit your picks')
        return redirect(url_for("login"))
    if games:
        # Decode and parse the JSON string into a dictionary
        gamesWinners = json.loads(games) 
        game1 = gamesWinners.popitem()
        g = Games.query.filter_by(id=int(game1[0])).first()
        day = g.game_date
        userPicks = Multiplayer.query.filter_by(userId=user,day=day,gameMode=value).first()
        if userPicks:
            flash('Your picks have already been submitted! You can view them on your profile page.')
            return redirect(url_for('multiplayer'))
        userData = Users.query.filter_by(id=user).first()
        value = value[:-1]
        if int(userData.wallet) < int(value):
            flash('Insufficient funds! Please add money to your account before placing a wager.')
            return redirect(url_for('multiplayer'))
        else :
            userData.wallet -= float(value)
            db.session.commit()
        mPick = Multiplayer(day=day,userId=user,gameMode=value)
        db.session.add(mPick)
        db.session.commit()
        pick = Multiplayer.query.filter_by(day=day,userId=user,gameMode=value).first()
        id = pick.id
        if game1[1] == 0:
            winner = g.team1_id
        else :
            winner = g.team2_id
        multiPick = MultiplayerPicks(multipId=id,gameid=game1[0],winner=winner,correct=0,userId=user)
        db.session.add(multiPick)
        db.session.commit()
        for game in gamesWinners.keys():
            # add the winner of each game to multiplayer picks, and create a pick for the user, with specific value
            g = Games.query.filter_by(id=game).first()
            if gamesWinners[game] == 0:
                winner = g.team1_id
            else :
                winner = g.team2_id
            multiPick = MultiplayerPicks(multipId=id,gameid=game,winner=winner,correct=0,userId=user)
            db.session.add(multiPick)
            db.session.commit()
        flash('Your bet has been placed in the pool')
        return redirect(url_for('multiplayer'))
    else:
        return 'User information not provided', 400
    
@app.route('/1v1mode')
def coinflipmode():
    wallet = 0
    if "user" in session:
        userLogged = True
        wallet = Users.query.filter_by(id=session["user"]).first().wallet
    else:
        userLogged = False
    games = Games.query.filter_by(game_date = "Apr9")
    date = "April 9th"
    gamesToday = {}
    for game in games:
        team1 = Teams.query.filter_by(id = game.team1_id).first()
        team2 = Teams.query.filter_by(id = game.team2_id).first()
        gamesToday.update({game.id: {"name1":team1.teamName, "abv1":team1.shortTeamName,"arena":team1.arena,"timestart":game.timestart+"m EST","name2":team2.teamName,"abv2":team2.shortTeamName}})       
    return render_template('1v1mode.html', games = gamesToday,userLogged=userLogged,wallet=wallet,date=date)

@app.route('/bet/<game>/<amount>/<team>', methods=['GET','POST'])
def handle_bet(game, amount,team):
    if "user" in session:
        user = session["user"]
    else:
        flash('You must log in to submit your picks')
        return redirect(url_for("login"))
    userData = Users.query.filter_by(id=user).first()
    wallet = int(userData.wallet)
    amount = amount[:-1]
    if wallet - int(amount) < 0:
        flash("Not enough funds")
        return redirect(url_for('coinflipmode'))
    userData.wallet -= float(amount)
    db.session.commit()
    game_info = Games.query.filter_by(id = int(game)).first()
    allPicks = CoinFlip.query.all()
    id = 1
    for pick in allPicks:
        if int(pick.id) >= id:
            id = int(pick.id)+1
    picks = CoinFlip.query.filter_by(userId=user,day=game_info.game_date,gameId=game).first()
    if picks == None:
        gamePicks = CoinFlip.query.filter_by(day=game_info.game_date,gameId=game,price=amount)
        if gamePicks == None:
            newPick = CoinFlip(id=id,day=game_info.game_date,userId=user,gameId=game,userPick=team,price=amount)
            db.session.add(newPick)
            db.session.commit()
            flash("Bet placed! Check your profile", 'success')
            return redirect(url_for('coinflipmode'))
        else: 
            for gamePick in gamePicks:
                if gamePick.opponentId == None and gamePick.userPick != team  and int(gamePick.userId) != int(user):
                    gamePick.opponentId = user
                    newPick = CoinFlip(id=id,day=game_info.game_date,userId=user,gameId=game,userPick=team,price=amount,opponentId=gamePick.userId)
                    db.session.add(newPick)
                    db.session.commit()
                    flash("Your bet has a match! Check your profile")
                    return redirect(url_for('coinflipmode'))
            newPick = CoinFlip(id=id,day=game_info.game_date,userId=user,gameId=game,userPick=team,price=amount)
            db.session.add(newPick)
            db.session.commit()
            flash("Bet placed! Check your profile", 'success')
            return redirect(url_for('coinflipmode'))
    else: 
        flash("You already made a pick for this game")
        return redirect(url_for('coinflipmode'))
    
def checkPlayerMultiplayerPicks():
    picks = MultiplayerPicks.query.all()
    for pick in picks:
        if pick.correct == 0:
            game = Games.query.filter_by(id=pick.gameid).first()
            if game.score1 != 0:
                if game.score1 > game.score2:
                    correct = game.team1_id
                else :
                    correct = game.team2_id
                pick.correct = correct
                db.session.commit()

def checkCoinFlipPicks():
    picks = CoinFlip.query.all()
    for pick in picks:
        if pick.result == None:
            game = Games.query.filter_by(id=pick.gameId).first()
            if game.score1 != 0:
                if game.score1 > game.score2:
                    correct = 1
                else :
                    correct = 2
                pick.result = correct 
                db.session.commit()

@app.route('/multiHistory')
def multiPlayerHistory():
    checkPlayerMultiplayerPicks()
    if "user" in session:
        userLogged = True
    else:
        userLogged = False
    if userLogged:
        user = session['user']
        userData = Users.query.filter_by(id=user).first()
        wallet = userData.wallet
        username = userData.username
        picks = Multiplayer.query.filter_by(userId=user)
        userData = {
            "username": userData.username,
            "balance" : float(userData.wallet),
        }
        MPicks = {}
        for pick in picks:
            MpickGames = MultiplayerPicks.query.filter_by(multipId=pick.id)
            MPicks.setdefault(pick.day,{})
            for mpick in MpickGames:
                game = Games.query.filter_by(id=mpick.gameid).first()
                gameText = Teams.query.filter_by(id=game.team1_id).first().shortTeamName + " vs " + Teams.query.filter_by(id=game.team2_id).first().shortTeamName 
                correct = None
                if game.score1 != 0:
                    if game.score1 > game.score2:
                        correct = Teams.query.filter_by(id=game.team1_id).first().shortTeamName
                    else :
                        correct = Teams.query.filter_by(id=game.team2_id).first().shortTeamName
                winner = Teams.query.filter_by(id=mpick.winner).first().shortTeamName

                MPicks[pick.day].setdefault(mpick.id,{"Winner":winner,"Game":gameText,"Correct":correct,"GameId":game.id})
    return render_template('pickHistory.html',userData=userData,userLogged=userLogged,username=username,wallet=wallet,MPicks=MPicks)
    
@app.route('/profile')
def profile():
    if "user" in session:
        userLogged = True
    else:
        userLogged = False
    if userLogged:
        user = session['user']
        userData = Users.query.filter_by(id=user).first()
        wallet = userData.wallet
        username = userData.username
        picks = CoinFlip.query.filter_by(userId=user).order_by(-CoinFlip.day).all()
        userData = {
            "username": userData.username,
            "balance" : float(userData.wallet),
        }
        MPPicks = {}
        Mpicks = Multiplayer.query.filter_by(userId=user,day="Apr9")
        for pick in Mpicks:
            MpickGames = MultiplayerPicks.query.filter_by(multipId=pick.id)
            MPPicks.setdefault(pick.day,{})
            for mpick in MpickGames:
                game = Games.query.filter_by(id=mpick.gameid).first()
                gameText = Teams.query.filter_by(id=game.team1_id).first().shortTeamName + " vs " + Teams.query.filter_by(id=game.team2_id).first().shortTeamName 
                winner = Teams.query.filter_by(id=mpick.winner).first().shortTeamName
                if mpick.correct == 0:
                    correct = None
                else:
                    if mpick.correct == 1:
                        correct = Teams.query.filter_by(id=game.team1_id).first().shortTeamName
                    else:
                        correct = Teams.query.filter_by(id=game.team2_id).first().shortTeamName

                MPPicks[pick.day].setdefault(mpick.id,{"Winner":winner,"Game":gameText,"Correct":correct})
        CFpicks = {}
        for pick in picks :
            game = Games.query.filter_by(id=pick.gameId).first()
            team1 = Teams.query.filter_by(id=game.team1_id).first()        
            team2 = Teams.query.filter_by(id=game.team2_id).first()
            if int(pick.userPick) == 1:
                choice = team1.shortTeamName
            else : 
                choice = team2.shortTeamName
            if not pick.result:
                checkCoinFlipPicks()
            if pick.result:
                if int(pick.result) == 1:
                    result = team1.shortTeamName
                else: 
                    result = team2.shortTeamName
            else: 
                result = ""
            CFpicks.setdefault(str(pick.gameId),{'day':pick.day,'matchup': str(team1.shortTeamName) + " vs " + str(team2.shortTeamName), 'pick': choice, 'value':pick.price, 'result':result})
        return render_template('profile.html',userData=userData,CFpicks=CFpicks,userLogged=userLogged,username=username,wallet=wallet,MPPicks=MPPicks)
    else: 
        flash("Log in to see your profile")
        return redirect(url_for('login'))
    
@app.route('/deposit', methods=['POST'])
def deposit():
    user = Users.query.filter_by(id=session["user"]).first()
    amount = float(request.form['deposit_amount'])
    if user.wallet + amount > 1000000:
        flash("Too much money deposited!")
        return redirect(url_for('profile'))
    user.wallet += amount
    db.session.commit()
    flash("Deposit successfull!")
    return redirect(url_for('profile'))

@app.route('/withdraw', methods=['POST'])
def withdraw():
    user = Users.query.filter_by(id=session["user"]).first()
    amount = float(request.form['withdraw_amount'])
    if amount <= user.wallet :
        user.wallet -= amount
        db.session.commit()
        flash("Withdraw successfull!")
        return redirect(url_for('profile'))
    else :
        flash("Insufficient funds")
        return redirect(url_for('profile'))
@app.route('/standings')
def standings():
    wallet = 0
    if "user" in session:
        userLogged = True
        wallet = Users.query.filter_by(id=session["user"]).first().wallet
    else:
        userLogged = False
    eastStandings = {}
    westStandings = {}
    winPct = 0
    for team in Teams.query.all():
        team.games = team.wins + team.losses
        if team.games == 0:
            winPct = 0
        else: 
            winPct = round((float)(team.wins)/(float)(team.games)*100,1)
        if team.id <=15:
                eastStandings.update({team.id:{"Name":team.teamName,"ShortName":team.shortTeamName,"Wins":team.wins,"Losses":team.losses,"WinPCT":winPct}})
        else : 
            westStandings.update({team.id:{"Name":team.teamName,"ShortName":team.shortTeamName,"Wins":team.wins,"Losses":team.losses,"WinPCT":winPct}})
    eastStandingsSorted = dict(sorted(eastStandings.items(), key=lambda item: item[1]["WinPCT"], reverse=True))
    westStandingsSorted = dict(sorted(westStandings.items(), key=lambda item: item[1]["WinPCT"], reverse=True))
    return render_template('standings.html',west=westStandingsSorted,east=eastStandingsSorted,userLogged=userLogged,wallet=wallet)

@app.route('/submit-date',methods=["GET","POST"])
def resultsDateChange():
    if request.method == "POST":
        month = int(request.form.get('month'))
        day = int(request.form.get('day'))
        year = int(request.form.get('year'))
        date = months[month-1] + str(day)
        return redirect(url_for('resultsDay',date=date))


@app.route('/results')
def results():
    wallet = 0
    return redirect(url_for('resultsDay',date="Apr7"))

@app.route('/results/<date>')
def resultsDay(date):
    wallet = 0
    if "user" in session:
        userLogged = True
        wallet = Users.query.filter_by(id=session["user"]).first().wallet
    else:
        userLogged = False
    gameResults= {}

    for game in Games.query.filter_by(game_date=date): 
        home_team = Teams.query.filter_by(id=game.team1_id).first()
        away_team = Teams.query.filter_by(id=game.team2_id).first()
        if game.game_date not in gameResults.keys():
            gameResults.update({game.game_date:[{"HomeShort":home_team.shortTeamName,"AwayShort":away_team.shortTeamName,"Home":home_team.teamName,"Away":away_team.teamName,"HomeScore":game.score1,"AwayScore":game.score2,"Id":game.id}]})        
        else :
            gameResults[game.game_date].append({"HomeShort":home_team.shortTeamName,"AwayShort":away_team.shortTeamName,"Home":home_team.teamName,"Away":away_team.teamName,"HomeScore":game.score1,"AwayScore":game.score2,"Id":game.id})  
    dateName = date2Full(date)
    day = getDateDay(date)
    month = getDateMonth(date)
    year = 2023
    if month < 10:
        year = 2024
    return render_template('results.html', results=gameResults, date=date, userLogged=userLogged,dateName=dateName,day=day,month=month,year=year,wallet=wallet)

def updateGameStats(gameStats,team1,team2):
    for player in gameStats[team1].keys():
        if gameStats[team1][player]["FGA"] != 0:
            gameStats[team1][player].setdefault("FG%",round((gameStats[team1][player]["FGM"]/gameStats[team1][player]["FGA"])*100,1))
        else:
            gameStats[team1][player].setdefault("FG%",0.0)
        if gameStats[team1][player]["3PA"] != 0:
            gameStats[team1][player].setdefault("3P%",round((gameStats[team1][player]["3PM"]/gameStats[team1][player]["3PA"])*100,1))
        else:
            gameStats[team1][player].setdefault("3P%",0.0)
        if gameStats[team1][player]["FTA"] != 0:
            gameStats[team1][player].setdefault("FT%",round((gameStats[team1][player]["FTM"]/gameStats[team1][player]["FTA"])*100,1))
        else:
            gameStats[team1][player].setdefault("FT%",0.0)
    for player in gameStats[team2].keys():
        if gameStats[team2][player]["FGA"] != 0:
            gameStats[team2][player].setdefault("FG%",round((gameStats[team2][player]["FGM"]/gameStats[team2][player]["FGA"])*100,1))
        else:
            gameStats[team2][player].setdefault("FG%",0.0)
        if gameStats[team2][player]["3PA"] != 0:
            gameStats[team2][player].setdefault("3P%",round((gameStats[team2][player]["3PM"]/gameStats[team2][player]["3PA"])*100,1))
        else:
            gameStats[team2][player].setdefault("3P%",0.0)
        if gameStats[team2][player]["FTA"] != 0:
            gameStats[team2][player].setdefault("FT%",round((gameStats[team2][player]["FTM"]/gameStats[team2][player]["FTA"])*100,1))
        else:
            gameStats[team2][player].setdefault("FT%",0.0)
    return gameStats

@app.route('/game/<id>', methods=['GET'])
def gameBoxscore(id):
    wallet = 0
    if "user" in session:
        userLogged = True
        wallet = Users.query.filter_by(id=session["user"]).first().wallet
    else:
        userLogged = False
    gameResults= {}
    game = Games.query.filter_by(id=id).first()
    team1 = Teams.query.filter_by(id=game.team1_id).first()
    team2 = Teams.query.filter_by(id=game.team2_id).first()
    day = getDateDay(game.game_date)
    month = getDateMonth(game.game_date)
    with open('static/files/games_played/boxscore_{}-{}.json'.format(month,day)) as f:
        stats = json.load(f)
    key = team1.shortTeamName + " vs " + team2.shortTeamName
    gameStats = stats[key]

    gameStats = updateGameStats(gameStats,team1.shortTeamName,team2.shortTeamName)
    score = [game.score1,game.score2]
    return render_template('boxscore.html', results=gameResults, userLogged=userLogged,game=gameStats,team1=team1.shortTeamName,team2=team2.shortTeamName,score=score,team1Full=team1.teamName, team2Full=team2.teamName,wallet=wallet)


@app.route('/stats')
def stats():
    wallet = 0
    if "user" in session:
        userLogged = True
        wallet = Users.query.filter_by(id=session["user"]).first().wallet
    else:
        userLogged = False

    teamsEast = {
        "Atlantic":[],"Central":[],"Southeast":[]
    }
    teamsWest = {
        "Pacific":[],"Southwest":[],"Northwest":[]
    }
    divs = list(teamsEast.keys())
    for i in range(15):
        val = int(i/5)
        teamsEast[divs[val]].append(teamsshort[i])
    divs = list(teamsWest.keys())
    for i in range(15,30):
        val = int(i/5)-3
        teamsWest[divs[val]].append(teamsshort[i])
    return render_template('team_stats.html',east=teamsEast,west=teamsWest,userLogged=userLogged,wallet=wallet)

@app.route('/stats/<team>', methods=['GET','POST'])
def statsTeam(team):
    wallet = 0
    if "user" in session:
        userLogged = True
        wallet = Users.query.filter_by(id=session["user"]).first().wallet
    else:
        userLogged = False
    teamData = Teams.query.filter_by(shortTeamName=team).first()
    team = {"Name":teamData.teamName, "ShortName":teamData.shortTeamName, 
            "Arena": teamData.arena, "Wins":teamData.wins, "Losses":teamData.losses,
            "Win%": round((teamData.wins/(teamData.wins+teamData.losses))*100,1), 
            }
    
    players = Player.query.filter_by(team_id=teamData.id)
    playerStats = []
    for player in players:
        playerStats.append(getPlayerStatistics(player))
    return render_template('stats.html', team=team, playerStats=playerStats,userLogged=userLogged,wallet=wallet)

# Create Login Page
@app.route('/login',methods=['GET','POST'])
def login():
    if "user" in session:
        userLogged = True
        return redirect(url_for("index"))
    else:
        userLogged = False
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password_hash']
        user = Users.query.filter_by(username=username).first()
        # Check if the username exists and the password matches
        if username:
            # Authentication successful, redirect to a success page
            if password == user.password_hash:
                flash("Login Successful!",'success')
                session["user"] = user.id
                return redirect(url_for('index'))
            else: 
                flash("Incorrect Password! Try Again!")
                return redirect(url_for('login'))    
        else:
            # Authentication failed, redirect back to the login page
            flash("Username does not exist! Please Sign Up or try again.")
            return redirect(url_for('login'))
    return render_template('login.html', userLogged=userLogged)


@app.route('/register',methods = ['GET', 'POST'])
def register():
    if "user" in session:
        userLogged = True
        flash("Log out if you want to register")
        return redirect(url_for("index"))
    else:
        userLogged = False
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        password_check = request.form['password2']
        user = Users.query.filter_by(username=username).first()
        # Check if the username exists        
        if user:
            flash("User already exists!")
            return redirect(url_for('register'))
        else:
            if password==password_check:
                user = Users(username=username, email=email, password_hash=password,wallet=0)
                db.session.add(user)
                db.session.commit()
                flash("Account created! Log in to play our games!" ,'success')
                return redirect(url_for('login'))
            else: 
                flash("Passwords don't match!")
                return redirect(url_for('register'))    
    return render_template('register.html',userLogged=userLogged)

@app.route('/logout', methods = ['GET','POST'])
def logout():
    session.pop('user', None)
    flash('You Have Been Logged Out!')
    return redirect(url_for('index'))