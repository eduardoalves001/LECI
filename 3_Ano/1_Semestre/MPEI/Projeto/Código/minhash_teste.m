
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
                disp('Nenhum jogo selecionado, a sair...');
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

            % Calcular similaridade de Jaccard real para o jogo normal escolhido
            tagsJogoEscolhido = tagsNormais(idxJogoNormal, :); % Tags do jogo normal escolhido
            jaccardReal = zeros(1, size(tagsVR, 1));
            for i = 1:size(tagsVR, 1)
                % Tags do jogo VR
                tagsJogoVR = tagsVR(i, :);
                
                % Calcular a similaridade de Jaccard real
                jaccardReal(i) = jaccard(tagsJogoEscolhido, tagsJogoVR);
            end
            
            % Exibir comparação entre MinHash e Jaccard real.
            disp('Comparação entre Similaridade de MinHash e Jaccard Real do jogo escolhido com todos os jogos VR disponíveis:');
            for i = 1:length(similaridades)

                diferenca = abs(similaridades(i) - jaccardReal(i)); % Calcular diferença verdadeira entre as similaridades minhash e real para cada recomendação
                percentagemSimilaridades = (diferenca / jaccardReal(i)) * 100; % Calular a percentagem de diferença entre as similaridades minhash e real para cada recomendação

                disp(['Jogo VR: ', nomesVR{i}]);
                disp(['Similaridade de Jaccard (MinHash): ', num2str(similaridades(i))]);
                disp(['Similaridade de Jaccard Real: ', num2str(jaccardReal(i))]);
                disp(['Diferença Absoluta: ', num2str(diferenca)]);
                disp(['Percentagem de Diferença: ', num2str(percentagemSimilaridades), '%']);
                disp('---------------------------');
            end
            
            % Ordenar os jogos VR por similaridade (do mais para o menos semelhante)
            [~, ordemSimilaridades] = sort(similaridades, 'descend');
            
            % Fazer as recomendações de jogos VR
            disp('Ordem de recomendações de jogos VR baseadas na similaridade com o jogo escolhido pelo utilizador:');
            for idxRecomendacao = 1:length(ordemSimilaridades)
                idxMaisSemelhante = ordemSimilaridades(idxRecomendacao);
                jogoVRRecomendado = nomesVR{idxMaisSemelhante};
                disp(['Recomendação nº', num2str(idxRecomendacao), ': ', jogoVRRecomendado, ' (Similaridade MinHash: ', num2str(similaridades(idxMaisSemelhante)), ')']);
            end
            
            % Função para calcular a similaridade de Jaccard real entre dois
            % vetores binários, que será usado para as tags que sao 1 ou 0.
            function similaridadeReal = jaccard(a, b)
                intersecao = sum(a & b);  % Tags em comum (1's nos dois vetores)
                reuniao = sum(a | b);        % Tags totais (1's em qualquer vetor)
                similaridadeReal = intersecao / reuniao; % Similaridade de Jaccard Real
            end
