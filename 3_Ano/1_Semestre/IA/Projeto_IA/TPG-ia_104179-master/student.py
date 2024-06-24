"""Example client."""
import asyncio
import getpass
import json
import os
import math
import random
from consts import Direction
import websockets

 # Directions:
 # NORTH = 0
 # EAST = 1
 # SOUTH = 2
 # WEST = 3

 # Limite de ataque do personagem = 3
 # Fygar não cospe nas verticais

 # Issues resolvidos desde época normal :
 # Certos Loops infinitos,
 # Evitar colisão com o Pooka em modo fantasma,
 # Evitar morte por pedras
 # Limitação do mapa de forma correta (Nas versões prévia, ocorreram problemas ao desviar no limite do mapa)
direcoes = {"norte": Direction.NORTH, "sul": Direction.SOUTH, "este": Direction.EAST, "oeste": Direction.WEST} #Variável global para identificar as direções.

# Função que retorna as posições possiveis seguintes do digdug.
def posições_possiveis_digdug(state, chave='e'):       
     if 'digdug' in state:                             
        posicao_digdug = state['digdug']                   
     else:                                             
        return ''
     posicoes_futuras = {}
     x, y = posicao_digdug
     
     # Uso de dicionários para os movimentos do digdug de forma a evitar limites do mapa
     posicoes_futuras[' '] = [x,y] # Posição base
     posicoes_futuras['w'] = [x,y-1] if posicao_digdug[1] > 0 else  [x,y] # Posição para cima sem passar limites do mapa.
     posicoes_futuras['s'] = [x,y+1] if posicao_digdug[1] < 23 else [x,y] # Posição para baixo sem passar limites do mapa.
     posicoes_futuras['a'] = [x-1,y] if posicao_digdug[0] > 0 else [x,y]  # Posição para a esquerda sem passar limites do mapa.
     posicoes_futuras['d'] = [x+1,y] if posicao_digdug[0] < 47 else [x,y] # Posição para a direita sem passar limites do mapa.

     if chave in 'wsad ':
          return posicoes_futuras[chave]
     return posicoes_futuras


# Função que retorna a lista com todas as posições de morte que podem ocorrer no próximo movimento.
def todas_posições_possiveis_inimigos(state):          
    lista_posicoes_inimigos = []                                                               
    dicionario_posicoes_inimigos = {}
    # Morte por inimigos
    if 'enemies' in state:
        for inimigo in state['enemies']:
            distancia = math.dist(state['digdug'],inimigo['pos'])
            if distancia <= 5:
                    # Se o inimigo estiver a 5 unidades de distancia, identifica o inimigo pelo nome, id e posição.
                    nome_inimigo = inimigo["name"] # Buscar nome do inimigo
                    id_inimigo = inimigo["id"] # Buscar ID do inimigo
                    posicao_inimigo = inimigo["pos"] #Buscar posiçáo do inimigo

                    zonas_perigosas = posições_possiveis_inimigos(posicao_inimigo)
                    if nome_inimigo == "Fygar":
                         zonas_perigosas = zonas_perigosas + fogo(inimigo) # +fogo chama a função que evita as àreas de ataque do Fygar

                    dicionario_posicoes_inimigos[nome_inimigo + id_inimigo] = zonas_perigosas
    # Morte por rochas
    if 'rocks' in state:
            for pedra in state['rocks']:
                 posicao_rocha = pedra["pos"] #Identificar posição da pedra
                 id_rocha = pedra["id"] #identificar ID da pedra
                 x, y = posicao_rocha 
                 por_baixo_rocha = [x, y+1] #identificar localização por baixo da rocha
                 dicionario_posicoes_inimigos[id_rocha] = [posicao_rocha, por_baixo_rocha] # Se o digdug ficar diretamente por baixo da rocha, esta cai-lhe em cima causando a sua morte.
                #To do: Implementar timeout no caso de ficar preso na pedra durante algum tempo, ao fim de timeout fazer um random move, na tentativa de escapar.
    for valores in dicionario_posicoes_inimigos.values():
        lista_posicoes_inimigos = lista_posicoes_inimigos + valores # Update à lista de posições de inimigos
   
    return lista_posicoes_inimigos
                         

# Função que retorna uma lista com a posição de um inimigo, tal como a posição que este terá no próximo movimento.
def posições_possiveis_inimigos(posicao_inimigo): 
    # Lista de posições adjacentes do inimigo.
    posicoes_adjacentes = []
    # Dicionário com as posições seguintes do inimigo.                              
    x,y = posicao_inimigo # Coordenadas do inimigo.

    posicoes_adjacentes.append([x,y])   # Coordenada base do inimigo.
    posicoes_adjacentes.append([x-1,y]) # Coordenada se o inimigo for para a esquerda
    posicoes_adjacentes.append([x+1,y]) # Coordenada se o inimigo for para a direita
    posicoes_adjacentes.append([x,y-1]) # Coordenada se o inimigo for para cima
    posicoes_adjacentes.append([x,y+1]) # Coordenada se o inimigo for para baixo
                                    
    return posicoes_adjacentes



#-------------------------------------------- FOGO ------------------------------------------------


# Função que retorna a lista de todas as posições de morte por fogo a evitar.
def fogo(info_fygar):   
    areaFogo = []
    
    direcao_atual = info_fygar['dir'] # Direção do Fygar
    x,y = info_fygar['pos'] # Posição do Fygar

    #Adicionar à lista
    areaFogo.append([x+1, y]) 
    areaFogo.append([x-1, y]) 
    areaFogo.append([x+2, y])
    areaFogo.append([x-2, y])
    areaFogo.append([x+3, y])
    areaFogo.append([x-3, y])
    areaFogo.append([x+4, y])
    areaFogo.append([x-4, y])

    # O Fygar só utiliza o ataque de fogo quando se encontra a andar na horizontal, tornando-se totalmente seguro aproximar-nos dele quando está a andar na vertical (Apenas náo colidir contra este).
    # Caso o fygar esteja a andar para a direita
    if direcao_atual == "este":
        #Adicionar à lista, caso o Fygar esteja na direção para este
        areaFogo.append([x+1, y-1])
        areaFogo.append([x+2, y-1])
        areaFogo.append([x+3, y-1])
        areaFogo.append([x+1, y+1])
        areaFogo.append([x+2, y+1])
        areaFogo.append([x+3, y+1])
    # Caso o fygar esteja a andar para a esquerda
    elif direcao_atual == "oeste":
        #Adicionar à lista, caso o Fygar esteja na direção para oeste
        areaFogo.append([x-1, y-1])
        areaFogo.append([x-2, y-1])
        areaFogo.append([x-3, y-1])
        areaFogo.append([x-1, y+1])
        areaFogo.append([x-2, y+1])
        areaFogo.append([x-3, y+1])

    return areaFogo


#-------------------------------------------- ATAQUE ------------------------------------------------

def atacar(state, digdug_pos, digdug_direction, posicao_inimigo_mais_proximo, nome_inimigo_mais_proximo):
    x,y = digdug_pos
    digdug_pos_x = digdug_pos[0]
    digdug_pos_y = digdug_pos[1]
    posicao_inimigo_mais_proximo_x = posicao_inimigo_mais_proximo[0]
    posicao_inimigo_mais_proximo_y = posicao_inimigo_mais_proximo[1]

    nome_inimigo_mais_proximo = ['Fygar', 'Pooka']


    alcance_cima = [[x,y-1], [x,y-2], [x,y-3]] # O range de ataque do digdug para cima 
    alcance_baixo = [[x,y+1], [x,y+2], [x,y+3]] # O range de ataque do digdug para baixo
    alcance_esquerda = [[x-1,y], [x-2,y], [x-3,y]] # O range de ataque do digdug para a esquerda
    alcance_direita = [[x+1,y], [x+2,y], [x+3,y]] # O range de ataque do digdug para a direita

    alcance = [alcance_cima, alcance_baixo, alcance_esquerda, alcance_direita] # Lista de todos os alcances

    posicao_inimigo_mais_perto = [posicao_inimigo_mais_proximo]
    if nome_inimigo_mais_proximo == nome_inimigo_mais_proximo[0]:
        inimigo_mais_proximo_fygar = [nome_inimigo_mais_proximo]
    else:
        inimigo_mais_proximo_fygar = []

    if 'enemies' in state:
        for inimigo in state["enemies"]:
            distancia_ao_inimigo = math.floor(math.dist(digdug_pos, inimigo["pos"]))
            if distancia_ao_inimigo <= 4:
                posicao_inimigo_mais_perto.append(inimigo["pos"])
                if inimigo['name'] == 'Fygar':
                    inimigo_mais_proximo_fygar.append(inimigo['pos'])

    if digdug_direction == "oeste":
        for possivel_vitima in alcance[2]:      
            if possivel_vitima in posicao_inimigo_mais_perto:
                return 'A',digdug_direction
    elif digdug_direction == "este":
        for possivel_vitima in alcance[3]:
            if possivel_vitima in posicao_inimigo_mais_perto:
                return 'A',digdug_direction
    elif digdug_direction == "norte":
        for possivel_vitima in alcance[0]:
            if possivel_vitima in posicao_inimigo_mais_perto:
                return 'A',digdug_direction
    elif digdug_direction == "sul":
        for possivel_vitima in alcance[1]:
            if possivel_vitima in posicao_inimigo_mais_perto:
                return 'A',digdug_direction
            

    
    if (digdug_pos_x < posicao_inimigo_mais_proximo_x and digdug_pos_y > posicao_inimigo_mais_proximo_y) or (digdug_pos_x < posicao_inimigo_mais_proximo_x and digdug_pos_y < posicao_inimigo_mais_proximo_y) or (digdug_pos_x > posicao_inimigo_mais_proximo_x and digdug_pos_y < posicao_inimigo_mais_proximo_y) or (digdug_pos_x > posicao_inimigo_mais_proximo_x and digdug_pos_y > posicao_inimigo_mais_proximo_y):   
        return quebraLoops(state, digdug_direction)
    return '', digdug_direction

#-------------------------------------------- Avoid Loops ------------------------------------------------

# Função utilizada para impedir loops infinitos.
def quebraLoops(state, digdug_direcao, movimentos_mais_favoraveis=''): 
     movimentos_possiveis = posições_possiveis_digdug(state)
     if movimentos_possiveis == '':
         return '', digdug_direcao
     posicoes_ameacadoras = todas_posições_possiveis_inimigos(state)
     movimentos_seguros = '' # Instanciar movimentos que não causam perigo ao digdug.
     for chave, posicao in movimentos_possiveis.items():
          if posicao not in posicoes_ameacadoras:
            movimentos_seguros = movimentos_seguros + chave

     if movimentos_seguros == '':
         return '', digdug_direcao
     
     movimentos_potenciais_favoraveis=''

     if len(movimentos_mais_favoraveis) > 0:
         for k in movimentos_mais_favoraveis: #Loop para atualizar movimentos_potenciais_favoráveis
             if k in movimentos_seguros:
                 movimentos_potenciais_favoraveis = movimentos_potenciais_favoraveis + k

     if len(movimentos_potenciais_favoraveis) > 0:
        chave = random.choice(movimentos_potenciais_favoraveis) # Escolhe um movimento favorável, de forma aleatória.
     else:
        chave = random.choice(movimentos_seguros) # Escolhe um movimento seguro, de forma aleatória.

     if chave == 'w':
        return chave, "norte"
     elif chave == 'd':
        return chave, "este"
     elif chave == 'a':
        return chave, "oeste"
     elif chave == 's':
        return chave, "sul"
     return '', digdug_direcao

    
#-------------------------------------------- Distancia ------------------------------------------------


# Função que retorna a distância do inimigo mais próximo e as suas coordenadas. 
def distancia_inimigo_mais_proximo(state):               
    if "digdug" in state:

        digdug_pos = state["digdug"]
        # Dicionário usado para armazenar as distâncias e posições.
        distancias = {}     
        for chave, valor in state.items():
            if chave == "enemies":
                for entradas in valor:
                    distancias[entradas["name"]+entradas["id"]] = [entradas["pos"], math.floor(math.dist(digdug_pos, entradas["pos"])),  entradas["dir"], entradas['name']] 

        distancia_ao_inimigo_mais_proximo = 9999       
        posicao_do_inimigo_mais_perto = [0,0]
        nome_inimigo_mais_perto = 'Fygar'
        
        for chave, distancia in distancias.items():
            if distancia[1] < distancia_ao_inimigo_mais_proximo:
                nome_inimigo_mais_perto = distancia[3]
                distancia_ao_inimigo_mais_proximo = distancia[1]
                posicao_do_inimigo_mais_perto = distancia[0]

        return posicao_do_inimigo_mais_perto, distancia_ao_inimigo_mais_proximo, nome_inimigo_mais_perto
    return None, None, None
     
# Função de movimento do agente, garante que não morra para potenciais ameaças.
def movimentacao(posicao_digdug, digdug_direction, posicao_inimigo_mais_proximo, nome_inimigo_mais_perto, possiveis_chaves_ameacadoras=''):
        
        posicao_digdug_x = posicao_digdug[0]
        posicao_digdug_y = posicao_digdug[1]
        posicao_inimigo_mais_proximo_x = posicao_inimigo_mais_proximo[0]
        posicao_inimigo_mais_proximo_y = posicao_inimigo_mais_proximo[1]

        #Aproximar do inimigo
        if posicao_digdug_x <= posicao_inimigo_mais_proximo_x:
            eixo1 = abs(posicao_digdug_x - posicao_inimigo_mais_proximo_x - 3)            
        else:
            eixo1 = abs(posicao_digdug_x - posicao_inimigo_mais_proximo_x + 3)

        if posicao_digdug_y <= posicao_inimigo_mais_proximo_y:
            eixo2 = abs(posicao_digdug_y - posicao_inimigo_mais_proximo_y - 3)
        else:
            eixo2 = abs(posicao_digdug_y - posicao_inimigo_mais_proximo_y + 3)

        if nome_inimigo_mais_perto == 'Fygar':
            eixo1 = eixo1 + 3 # Distância fogo do Fygar

        chave=''
        dist = math.floor(math.dist(posicao_digdug, posicao_inimigo_mais_proximo))
        if  dist >= 4:                
            # Upgrade relativo ao código base da época normal, pois verifica no movimento se o caminho para onde vai é perigoso.
            if eixo1 > eixo2:
                #se o digdug estiver à esquerda do inimigo mais próximo
                if posicao_digdug_x < posicao_inimigo_mais_proximo_x: 
                    if "d" not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "d"
                        digdug_direction = "este" #Update à direção
                    elif "s" not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "s"
                        digdug_direction = "sul" #Update à direção
                    elif "w" not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "w"
                        digdug_direction = "norte" #Update à direção
                #se o digdug estiver à direita do inimigo mais próximo
                elif posicao_digdug_x > posicao_inimigo_mais_proximo_x:
                    if "a" not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "a"
                        digdug_direction = "oeste" #Update à direção
                    elif "s" not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "s"
                        digdug_direction = "sul"#Update à direção
                    elif "w" not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "w"
                        digdug_direction = "norte" #Update à direção
            else:
                #se o digdug estiver em cima do inimigo mais próximo
                if posicao_digdug_y < posicao_inimigo_mais_proximo_y: 
                    if 's' not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "s"
                        digdug_direction = "norte"#Update à direção
                    elif 'a' not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "a"
                        digdug_direction = "oeste" #Update à direção
                    elif 'd' not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "d"
                        digdug_direction = "este" #Update à direção
                #se o digdug estiver em baixo do inimigo mais próximo
                elif posicao_digdug_y >= posicao_inimigo_mais_proximo_y:
                    if 'w' not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "w"
                        digdug_direction = "norte" #Update à direção
                    elif 'd' not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "d"
                        digdug_direction = "este" #Update à direção
                    elif 'a' not in possiveis_chaves_ameacadoras: #Se for seguro ir para a posição, executa o movimento
                        chave = "a"
                        digdug_direction = "oeste" #Update à direção
        
        elif dist > 2:
            if posicao_digdug_y < posicao_inimigo_mais_proximo_y and 's' not in possiveis_chaves_ameacadoras:
                    chave = "s"
                    digdug_direction = "sul" #Update à direção
            elif posicao_digdug_x < posicao_inimigo_mais_proximo_x and "d" not in possiveis_chaves_ameacadoras:
                    chave = "d"
                    digdug_direction = "este" #Update à direção
            elif posicao_digdug_y > posicao_inimigo_mais_proximo_y and 'w' not in possiveis_chaves_ameacadoras:
                    chave = "w"
                    digdug_direction = "norte" #Update à direção
            
            elif posicao_digdug_x >= posicao_inimigo_mais_proximo_x and "a" not in possiveis_chaves_ameacadoras:
                    chave = "a"
                    digdug_direction = "oeste" #Update à direção
        # Distância perigosa, quando se encontra a duas unidades é preciso ter extremo cuidado para não colidir.
        elif dist <= 2:
            if posicao_digdug_y <= posicao_inimigo_mais_proximo_y and 'w' not in possiveis_chaves_ameacadoras:
                    chave = "w"
                    digdug_direction = "norte" #Update à direção
            elif posicao_digdug_y > posicao_inimigo_mais_proximo_y and 's' not in possiveis_chaves_ameacadoras:
                    chave = "s"
                    digdug_direction = "sul" #Update à direção
            elif posicao_digdug_x < posicao_inimigo_mais_proximo_x and "a" not in possiveis_chaves_ameacadoras:
                    chave = "a"
                    digdug_direction = "oeste" #Update à direção
            elif posicao_digdug_x >= posicao_inimigo_mais_proximo_x and "d" not in possiveis_chaves_ameacadoras:
                    chave = "d"
                    digdug_direction = "este" #Update à direção

        return chave, digdug_direction
                
#------------------------------------------------Perseguir-------------------------------------------------

# Função para perseguir o inimigo mais próximo
def perseguir(state, digdug_direction, posicao_inimigo_mais_proximo, nome_inimigo_mais_perto, possiveis_chaves_ameacadoras=''):                      
     if posicao_inimigo_mais_proximo == None:
          return "", digdug_direction
    
     return movimentacao(state["digdug"], digdug_direction, posicao_inimigo_mais_proximo, nome_inimigo_mais_perto, possiveis_chaves_ameacadoras)

#------------------------------------------------Fugir---------------------------------------------------------

# Função que retorna o digdug para uma posição segura, em caso de potenciais ameaças. 
def fugir(state, digdug_dir, posicoes_possiveis_ameacadoras):  

    movimentos_possiveis = posições_possiveis_digdug(state)     
    possiveis_chaves_ameacadoras = ''  #Instanciar as chaves do teclado possivelmente ameaçadoras como vazio                                  
    for acao, valor in movimentos_possiveis.items():          
        if valor in posicoes_possiveis_ameacadoras:                        
             possiveis_chaves_ameacadoras = possiveis_chaves_ameacadoras + acao #incrememntar às possiveis chaves ameaçadoras
    chave=''
    
    if 'w' not in possiveis_chaves_ameacadoras:
        chave = 'w'
        digdug_dir = "norte" # Direção do digdug quando anda para cima é norte
    elif 'a' not in possiveis_chaves_ameacadoras:
        chave = 'a'
        digdug_dir = "oeste" # Direção do digdug quando anda para a esquerda é oeste
    elif 'd' not in possiveis_chaves_ameacadoras:
        chave = 'd'
        digdug_dir = "este" # Direção do digdug quando anda para a direita é este
    elif 's' not in possiveis_chaves_ameacadoras:
        chave = 's'
        digdug_dir = "sul" # Direção do digdug quando anda para baixo é sul
                                     
    return chave, digdug_dir

#-------------------------------------------------Condições de jogo essenciais-----------------------------------------

 # Função que analisa se o dig dug está em jogo e as respetivas condições de jogo.
def check_game(state, digdug_dir):
    if 'digdug' not in state:
        return '', digdug_dir

    # Analisa posições de morte
    posicoes_possiveis_ameacadoras = todas_posições_possiveis_inimigos(state)


    # Analisa se o digdug está num possivel próximo movimento inimigo, e evita-o.
    if 'digdug' in state and state["digdug"] in posicoes_possiveis_ameacadoras:
        return fugir(state, digdug_dir, posicoes_possiveis_ameacadoras) # Chama a função de fuga para se estiver em situações que leve à morte.
    

    # Analisa e calcula o inimigo mais próximo do digdug.
    posicao_do_inimigo_mais_perto, distancia, nome_inimigo_mais_perto = distancia_inimigo_mais_proximo(state)
    if distancia == None:
        return '', digdug_dir

    # Analisa se estamos em condições de ataque.
    if state["digdug"] and distancia <= 3:
        chave, digdug_dir = atacar(state, state["digdug"], digdug_dir, posicao_do_inimigo_mais_perto, nome_inimigo_mais_perto)
        if chave == 'A' or len(chave) > 1: 
            return chave, digdug_dir
        
    # Se não for possivel atacar, movimentar em direção ao inimigo mais próximo, evitando as posições ameaçadoras.
    todos_movimentos_possiveis = posições_possiveis_digdug(state)
    possiveis_chaves_ameacadoras = ''
    for acao, valor in todos_movimentos_possiveis.items():
        if valor in posicoes_possiveis_ameacadoras:
             possiveis_chaves_ameacadoras = possiveis_chaves_ameacadoras + acao

    chave, digdug_dir = perseguir(state, digdug_dir, posicao_do_inimigo_mais_perto, nome_inimigo_mais_perto, possiveis_chaves_ameacadoras)


    return chave, digdug_dir
    
#--------------------------------------------------Agent_Loop-------------------------------------------------

async def agent_loop(server_address="localhost:8000", agent_name="student"):
    """Example client loop."""
    async with websockets.connect(f"ws://{server_address}/player") as websocket:
        # Receive information about static game properties
        await websocket.send(json.dumps({"cmd": "join", "name": agent_name}))
        

        digdug_dir = "este"
        guess = 0
        ultima_chave = ''
        chave=''

        while True:
            try:
                state = json.loads(
                    await websocket.recv()
                )  # receive game update, this must be called timely or your game will get out of sync with the server

                chave, digdug_dir = check_game(state, digdug_dir)
                if ultima_chave != 'A' and chave == "A":
                    guess = 0
                guess = guess + 1
                if guess >= 10: # Se digdug ficar preso em loop, quebra o loop
                    chave, digdug_dir = quebraLoops(state, digdug_dir)
                    guess = 0
                ultima_chave = chave
                await websocket.send(
                        json.dumps({"cmd": "key", "key": chave})
                    )  # send key command to server - you must implement this send in the AI agent
                

            except websockets.exceptions.ConnectionClosedOK:
                print("Server has cleanly disconnected us")
                return



# DO NOT CHANGE THE LINES BELLOW
# You can change the default values using the command line, example:
# $ NAME='arrumador' python3 client.py
loop = asyncio.get_event_loop()
SERVER = os.environ.get("SERVER", "localhost")
PORT = os.environ.get("PORT", "8000")
NAME = os.environ.get("NAME", getpass.getuser())
loop.run_until_complete(agent_loop(f"{SERVER}:{PORT}", NAME))
