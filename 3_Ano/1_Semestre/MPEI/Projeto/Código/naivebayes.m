            
            addpath('funcoes_auxiliares'); % Dá acesso à pasta com as com funções auxiliares, para evitar muita confusão.
            addpath('DataSets'); % Dá acesso à pasta com as tabelas xlsx, para evitar muita confusão.
            
            % Ler os dados do ficheiro Excel
            data = readcell('naivebayes_data.xlsx');
            
            % Separar dados representados por X e classe representado por Y
            X = cell2mat(data(2:end, 1:end-1)); % Converter características para matriz numérica
            Y = data(2:end, end);               % Última coluna é a classe +18 ou -18
            
            % Verificar se Y é numérico ou texto e converter para numérico
            if iscell(Y)
                Y = categorical(Y);  % Converter para categórico, se necessário
                Y = double(Y);       % Converter categorias para números (1 para +18, 0 para -18)
            end
            
            % Verificar se os tamanhos de X e Y são consistentes
            if size(X, 1) ~= length(Y)
                error('O número de linhas de X e o número de observações em Y são diferentes!');
            end
            
            % Remover colunas de X com variância zero, ou seja se varias
            % linhas tiverem a mesma informação, acaba por ser redundante e
            % não ajuda o modelo dos naive bayes em nada
            variancia = var(X);
            idx_constantes = find(variancia == 0);
            % Remove esse dados redundantes
            X(:, idx_constantes) = []; 
            
            % Atualizar os nomes das tags para corresponder às colunas restantes
            tags = data(1, 1:end-1); % Nomes originais das tags
            tags(idx_constantes) = []; % Remover tags correspondentes aos dados previamente removidos
            
            % Verificar a consistência de X e Y após a remoção dos dados,
            % para garantir se esta tudo solido. Caso nao esteja deve dar
            % erro.
            if size(X, 1) ~= length(Y)
                error('Após a remoção das colunas de variância zero, X e Y ainda têm números diferentes de observações.');
            end
               
            % Calcular a variância por classe, isto requer pre alocação de
            % espaço senao estavamos com um warning bastante irritante, que
            % estava a dizer que a variavel variancia_por_classe mudava de
            % tamanho a cada iteração.
            classes = unique(Y); % Identificar classes únicas, ou seja no nosso caso os valores unicos sao +18 e -18, se tivessemos outras classes como +20 tmb apareceria.
            num_classes = length(classes); % conta quantas classes diferentes temos, no nosso caso temos 2: +18 e -18.
            variancia_por_classe = zeros(num_classes, size(X, 2)); % Fator que nos estava a dar warning: Contabiliza a matriz de variancia por cada uma das duas classes previmente mencioandas.
            
            % Calcular a variância para cada classe
            for idx = 1:num_classes
                i = classes(idx);
                X_class = X(Y == i, :);
                variancia_por_classe(idx, :) = var(X_class);
            end
            
            % Identificar as colunas com zero de variância em todas as classes
            idx_constantes_total = find(all(variancia_por_classe == 0, 1)); % Variáveis com zero de variância em todas as classes
            
            % Verificar se há variáveis com zero de variância
            if ~isempty(idx_constantes_total)
                % Remover essas variáveis de X
                X(:, idx_constantes_total) = [];
                
                % Atualizar as tags removidas
                tags(idx_constantes_total) = [];
            end
            
            % Verificar a consistência de X e Y após a remoção das colunas
            if size(X, 1) ~= length(Y)
                error('Após a remoção das colunas com variância zero em todas as classes, X e Y ainda têm números diferentes de observações.');
            end
            
            % Treinar o modelo Naïve Bayes com suavização (usando kernel, caso haja variância zero)
            % Treinar os dados com tudo o que temos, so nos testes é que
            % dividimos em 70/30 pra treino e testes, respetivamente.
            model = fitcnb(X, Y, 'DistributionNames', 'kernel', 'Weights', ones(size(X, 1), 1));
            
            % Permitir ao usuário escolher tags manualmente (Perguntar sobre todas predict as tags, incluindo as de variância zero)
            disp('Agora, selecione as categorias que você gosta:');
            entradautilizador = zeros(1, length(tags)); % Inicializar vetor de escolhas do usuário
            
            % Iterar pelas tags e perguntar ao usuário
            for i = 1:length(tags)
                while true
                    resposta = input(['Você gosta de "', tags{i}, '"? (s/n): '], 's');
                    if strcmpi(resposta, 's')
                        entradautilizador(i) = 1; % Marcado como "gosta"
                        break;
                    elseif strcmpi(resposta, 'n')
                        entradautilizador(i) = 0; % Marcado como "não gosta"
                        break;
                    else
                        disp('Resposta inválida! Por favor, responda com "s" ou "n".');
                    end
                end
            end
            
            % Permitir ao utilizador atribuir pesos às tags
            pesos = ones(1, length(tags)); % Inicializar pesos como 1
            disp('Avalie a importância das categorias escolhidas (1 a 3):');
            for i = 1:length(tags)
                if entradautilizador(i) == 1 % Somente para tags escolhidas
                    while true
                        resposta = input(['Quão importante é "', tags{i}, '"? (1 a 3 ou "sair" para cancelar): '], 's');
                        if strcmpi(resposta, 'sair')
                            disp('A sair...');
                            return;
                        elseif isnumeric(str2double(resposta)) && str2double(resposta) >= 1 && str2double(resposta) <= 3
                            pesos(i) = str2double(resposta); % Atribuir peso
                            break;
                        else
                            disp('Este valor não é possível! Insira um número entre 1 e 3 ou "sair" para cancelar.');
                        end
                    end
                end
            end

            % Garantir que os arrays de entrada e de pesos a aplicar têm
            % tamanhos iguais, senao tiverem avisa o utilizador.
            if length(entradautilizador) == length(pesos)
                % Aplicar pesos às escolhas do utilizador
                entradautilizadorPonderada = entradautilizador .* pesos;
                disp(entradautilizadorPonderada);
            else
                disp('Os arrays de entrada e dos pesos têm tamanhos diferentes!');
            end
            
            % Prever a classificação com base nas escolhas ponderadas do
            % utilizador
            predicaoutilizador = predict(model, entradautilizador);
            
            % Exibir o resultado ao utilizador
            if predicaoutilizador == 1
                disp('Com base nas tags escolhidas, o nosso Naive Bayes prevê que o jogo é mais adequado para MAIORES de 18 anos.');
            else
                disp('Com base nas tags escolhidas, o nosso Naive Bayes prevê que o jogo é mais adequado para MENORES de 18 anos.');
            end