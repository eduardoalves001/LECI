            addpath('funcoes_auxiliares'); % Dá acesso à pasta com as com funções auxiliares, para evitar muita confusão.
            addpath('DataSets'); % Dá acesso à pasta com as tabelas xlsx, para evitar muita confusão.
            % Vai buscar os dados aos das tabelas jogos_normais e jogos_vr
            % que estão na pasta DataSets, ele consegue fazer isto porque
            % o main é que chama este ficheiro e no main temos um addpath
            % paara a pasta Datasets
            jogosNormais = readtable('jogos_normais.xlsx', 'VariableNamingRule', 'preserve');
            jogosVR = readtable('jogos_vr.xlsx', 'VariableNamingRule', 'preserve');
        
            % Separar as tags e os nome do jogo em variáveis diferentes, as
            % tagsNormais -> Tags, nomesNormais -> Nomes dos jogos. os nomes dos jogos pertencem
            % apenas a ultima coluna, entao tudo ate la acaba por ser tags
            tagsNormais = jogosNormais{:, 1:end-1}; % Todas as colunas exceto a última são tags
            nomesNormais = jogosNormais{:, end};    % e a ultima coluna é o nome do jogo
            
            % Aqui faz o mesmo para a lista dos jogos VR, em que separa as
            % tags VR dos nomes dos jogos VR, os nomes dos jogos pertencem
            % apenas a ultima coluna, entao tudo ate la acaba por ser tags
            tagsVR = jogosVR{:, 1:end-1}; % Todas as colunas exceto a última são tags
            nomesVR = jogosVR{:, end};    % e a ultima coluna é o nome do jogo
        
            % Criamos esta forma para o utilizador interagir com o sistema,
            % aqui o utilizador tem a opção de escolher entre os varios
            % jogos normais disponiveis e selecionar um.
            [idxJogoNormal, tf] = listdlg('ListString', nomesNormais, 'SelectionMode', 'single', 'PromptString', 'Escolha um jogo normal para recomendação VR:');
            if ~tf
                disp('Nenhum jogo selecionado, saindo...');
                return;
            end
            
            % guarda o jogo escolhido pelo utilizador na variavel
            % jogoEscolhido, para mostrar ao utilizador o jogo.

            jogoEscolhido = nomesNormais{idxJogoNormal}; % Nome do jogo escolhido, o idxJogoNormal é o que vamos usar mais a frente para ir buscar este jogo na secção de similiariadade.
            disp(['Jogo normal escolhido: ', jogoEscolhido]); %informa o jogo escolhido pelo utilizador no terminal.
        
            % Instanciamos aqui o número de hash functions para a MinHash
            numHashes = 100;
        
            % Aqui Geramos assinaturas MinHash para as duas tabelas, tanto
            % para todos os jogos normais como todos os jogos VR, vão ser
            % estas assinaturas mais "compactas" que vão fazer a comparaçao
            % de valores para a similariadade de jaccard.
            minhashNormais = generateMinHash(tagsNormais, numHashes);
            minhashVR = generateMinHash(tagsVR, numHashes);
        
            % Aqui calculamos a similaridade de jaccard e entre o jogo
            % normal escolhido e todos os jogos VR disponiveis, isto da nos
            % quais são os jogo VR mais semelhante ao jogos escolhido pelo
            % utilizador.
            similaridades = zeros(1, size(tagsVR, 1));
            for i = 1:size(tagsVR, 1)
                % Similaridade de Jaccard
                similaridades(i) = sum(minhashNormais(:, idxJogoNormal) == minhashVR(:, i)) / numHashes;
            end
        
            % Ordenar os jogos VR que vao ser recomendados por similaridade
            % do mais para o menos semelhante, garantindo que aparece
            % sempre a melhor recomendaçao em primeiro, e se o
            % utilizador quiser mais recomendaçoes, aparece de forma
            % ordenada da melhor para a pior recomendaçao.
            [~, ordemSimilaridades] = sort(similaridades, 'descend');
        
            % Aqui vamos perguntar ao utilizador se ele quer mais
            % recomendações ou não, o utilizador tem até 5 recomendaçóes
            % de forma a garantir que os jogos que lhe são recomendados são
            % o mais parecidos possiveis.
            continuar = true;
            indiceRecomendacao = 1; % O Índice para manter seguimento na lista ordenada
            maximoRecomendacoes = 5; % Limite de recomendações que vamos impor, que decidimos que seria melhor 5 recomendações no maximo.
            numAtualRecomendacoes = 0; % Um Contador de recomendações que aumenta sempre que uma nova recomendação é feita, 
                                  % esta variavel vai servir para garantir
                                  % que o numero de recomendações não é
                                  % maior que o numero de recomendaações
                                  % maxima que são 5.
        
            while continuar && indiceRecomendacao <= length(ordemSimilaridades) && numAtualRecomendacoes < maximoRecomendacoes
                % Se cumprirmos os requisitos impostos previamente, aqui
                % recomendamos o proximo jogo mais semelhante.
                idxMaisSemelhante = ordemSimilaridades(indiceRecomendacao);
                jogoVRRecomendado = nomesVR{idxMaisSemelhante};
        
                % Aqui mostra a recomendaçao ao utilizador via terminal.
                disp(['Baseado no jogo: "', jogoEscolhido, '", o jogo VR recomendado é: ', jogoVRRecomendado]);
        
                % Da update ao numero de recomendaçoes, visto que ha uma
                % recomendacao nova, se este valor chegar ao limite ja nao ha
                % recomendações novas.
                numAtualRecomendacoes = numAtualRecomendacoes + 1;
        
                % Pergunta ao utilizador se ele quer mais recomendações ou
                % nao
                continuar = strcmp(questdlg('Deseja outra recomendação?', 'Continuar', 'Sim', 'Não', 'Não'), 'Sim');
                indiceRecomendacao = indiceRecomendacao + 1; % Avançar para o próximo jogo
            end
        
            % Mensagem final quando termina as recomendações, chega ao
            % limite ou quando o utilizador quiser sair
            if numAtualRecomendacoes >= maximoRecomendacoes
                disp('Limite de 5 recomendações atingido.');
            elseif indiceRecomendacao > length(ordemSimilaridades)
                disp('Todas as recomendações foram exibidas.');
            else
                disp('Recomendações encerradas pelo utilizador.');
            end
