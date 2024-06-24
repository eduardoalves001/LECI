import pandas as pd # type: ignore
import requests # type: ignore
import json
import csv
from bs4 import BeautifulSoup # type: ignore
from dates import *
from datetime import *

teams = ["Philadelphia 76ers","Boston Celtics", "Toronto Raptors", "New York Knicks", "Brooklyn Nets","Indiana Pacers", "Detroit Pistons", "Chicago Bulls", "Milwaukee Bucks", "Cleveland Cavaliers","Atlanta Hawks", "Miami Heat", "Orlando Magic", "Charlotte Hornets", "Washington Wizards","Los Angeles Lakers", "Los Angeles Clippers", "Sacramento Kings", "Golden State Warriors", "Phoenix Suns","Minnesota Timberwolves", "Portland Trail Blazers","Denver Nuggets","Oklahoma City Thunder","Utah Jazz","New Orleans Pelicans", "Memphis Grizzlies", "Dallas Mavericks", "San Antonio Spurs", "Houston Rockets"]
teamsshort = ["PHI","BOS","TOR","NYK","BRK","IND","DET","CHI","MIL","CLE","ATL","MIA","ORL","CHO","WAS","LAL","LAC","SAC","GSW","PHO","MIN","POR","DEN","OKC","UTA","NOP","MEM","DAL","SAS","HOU"]


def getDailyBoxscore(day,month,year):
    player_stats_url = "https://www.basketball-reference.com/friv/dailyleaders.fcgi?month={}&day={}&year={}#stats"
    url = player_stats_url.format(month,day,year)
    data = requests.get(url)
    dfs = []
    page = data.text
    soup = BeautifulSoup(page, "html.parser")
    soup.find('tr', class_ = "thead").decompose()
    
    player = pd.read_html(page)[0]
    print(player)
    player["Date"] = ("{}-{}-2024").format(month, day)
    dfs.append(player) 
    data = pd.concat(dfs) 
    if data.empty:
        return 0
    data.rename(columns={'Unnamed: 0':'Id','Unnamed: 3':'H/A','Unnamed: 5':'W/L'},inplace=True)
    stats = data.iloc[:,[1,2,3,4,5,7,8,10,11,13,14,18,19,20,21,22,23,24,26]]
    games = []
    game_stats = dict()
    for index in stats.index:
        if stats["Player"][index] == "Player":
            continue
        winner = None
        home_team = None
        away_team = None
        if stats["H/A"][index] == "@":
            game = "{} vs {}".format(stats["Opp"][index] ,stats["Tm"][index])
            if game not in games:
                if game != "Tm vs Opp":
                    games += [game]
            home_team = stats["Opp"][index]
            away_team = stats["Tm"][index]
        else :
            game = "{} vs {}".format(stats["Tm"][index] ,stats["Opp"][index])
            if game not in games:
                if game != "Tm vs Opp":
                    games += [game]
            home_team = stats["Tm"][index]
            away_team = stats["Opp"][index]
        player_stats = {stats["Player"][index]: {
                    "PTS": int(stats['PTS'][index]),
                    "AST": int(stats['AST'][index]),
                    "REB": int(stats['TRB'][index]),
                    "STL": int(stats['STL'][index]),
                    "BLK": int(stats['BLK'][index]),
                    "Tov": int(stats['TOV'][index]),
                    "FLS": int(stats['PF'][index]),
                    "FGM": int(stats['FG'][index]),
                    "FGA": int(stats['FGA'][index]),
                    "3PM": int(stats['3P'][index]),
                    "3PA": int(stats['3PA'][index]),
                    "FTM": int(stats['FT'][index]),
                    "FTA": int(stats['FTA'][index])
                }}
        if game not in game_stats.keys():
            if stats["W/L"][index] == "W":
                winner = stats["Tm"][index]
            else:
                winner = stats["Opp"][index]
            game_stats[game] = {
                "Winner": winner,
                home_team: {},
                away_team: {}
            }
            if stats["Tm"][index] == home_team:
                game_stats[game][home_team].update(player_stats)
            else:
                game_stats[game][away_team].update(player_stats)
        else:
            if stats["Tm"][index] == home_team:
                game_stats[game][home_team].update(player_stats)
            else:
                game_stats[game][away_team].update(player_stats)
    with open('static/files/games_played/boxscore_{}-{}.json'.format(month,day), 'w') as json_file:
        json.dump(game_stats, json_file, indent=4)

def getStatsOTD(day,month):
    with open('static/files/games_played/boxscore_{}-{}.json'.format(month, day)) as file:
        stats = json.load(file)
    return stats

def getGames(month):
    index= months.index(month)
    games_url = "https://www.basketball-reference.com/leagues/NBA_2024_games-{}.html"
    data = requests.get(games_url.format(monthsFull[index]))
    dfs = []
    page = data.text
    monthgames = pd.read_html(page)[0]
    dfs.append(monthgames)
    data = pd.concat(dfs)
    data.drop('PTS', inplace=True, axis=1)
    data.drop('PTS.1', inplace=True, axis=1)
    data.drop('Unnamed: 6', inplace=True, axis=1)
    data.drop('Unnamed: 7', inplace=True, axis=1)
    data.drop('Attend.', inplace=True, axis=1)
    data.drop('Notes', inplace=True, axis=1)
    games = {}
    for index in data.index:
        date = data["Date"][index]
        monthday = date.split(", ")[1]
        cleardate = getShortDate(monthday)
        away_team = getTeamShort(data["Visitor/Neutral"][index])
        home_team = getTeamShort(data["Home/Neutral"][index])
        start_time = data["Start (ET)"][index]
        arena = data["Arena"][index]
        game = {"Visitor": away_team, "Home": home_team, "Start":start_time, "Arena":arena}
        if cleardate in games.keys():
            games[cleardate].append(game)
        else:
            games.setdefault(cleardate,[game])
    with open("static/files/games/games{}.json".format(month), 'w') as outfile:
        json.dump(games, outfile, indent=4)

def getTeamShort(team):
    index = teams.index(team)
    return teamsshort[index]

def getPlayersfromTeamPage(teamabv):
    teams_url = "https://www.basketball-reference.com/teams/{}/2024.html"
    data = requests.get(teams_url.format(teamabv))
    page = data.text
    dfs=[]
    soup = BeautifulSoup(page, "html.parser")
    roster = soup.find(id="roster")
    players = pd.read_html(str(roster))[0]
    players_data = roster.find_all("td", {"data-stat": "player"})
    dfs.append(players)
    data = pd.concat(dfs)
    data.drop(['No.','Ht','Wt','Birth Date','Exp','College','Unnamed: 6'], inplace=True, axis=1)
    print(data)
    playerList = []
    sub_string = '\u00a0\u00a0(TW)'
    i = 0
    for player in players_data:
        player_name = player.get_text()
        if sub_string in player_name:
            player_name = player_name.replace(sub_string,'')
        player_href = player.find("a")["href"]
        player_link = "https://www.basketball-reference.com" + player_href
        player_info = {"Player": player_name, "Link": player_link, "Pos":data["Pos"][i]}
        i += 1
        playerList.append(player_info)
    # for index in range(0,len(data)):    
    #     playerList.append(data["Player"][index])
    new_data = {"Players" : playerList}
    print(f"Team players : \n{new_data}")
    with open('static/files/teams/{}.json'.format(teamabv), 'w') as outfile:
        json.dump(new_data, outfile, indent=4)
    return new_data

