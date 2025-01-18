            addpath('funcoes_auxiliares'); % Dá acesso à pasta com as com funções auxiliares, para evitar muita confusão.
            addpath('DataSets'); % Dá acesso à pasta com as tabelas xlsx, para evitar muita confusão.

            % isto vai carregar os dados que tao tipo na tabela
            ficheiro = 'jogos_normais.xlsx'; % Nome do arquivo com os jogos     % nome do arquivo com os jogos
            data = readtable(ficheiro, 'VariableNamingRule', 'preserve');

             % Configuração inicial do Bloom Filter
            N = 3256; % Tamanho do Bloom Filter
            k = 6;   % Número de funções hash
            bloomFilters = containers.Map(); % Inicializar como vazio
            
            % separaa os nomes dos jogos e as tags
            jogos = data{:, end};                                               % ultima coluna que contém os nomes dos jogos
            tags = data.Properties.VariableNames(1:end-1);                      % nomes das tags (menos a ultima coluna)
            
            % vai perguntar ao usuário para escolher um jogo
            [idxJogoNormal, tf] = listdlg('ListString', jogos, 'SelectionMode', 'single', 'PromptString', 'Escolha um jogo:');
            if ~tf
                disp('Nenhum jogo selecionado, retornando ao menu...');
                return;
            end
            
            jogoEscolhido = jogos{idxJogoNormal};
            
            % vai exibir todas as tags como opções para o usuario
            tagOptions = tags;                                                  % vai exibir todas as tags possíveis
            
            % pergunta ao usuário para escolher uma tag
            [idxTag, tf] = listdlg('ListString', tagOptions, 'SelectionMode', 'single', 'PromptString', 'Escolha uma tag:');
            if ~tf
                disp('Nenhuma tag selecionada, a voltar ao menu...');
                return;
            end
            
            tagConsulta = tagOptions{idxTag}; % Tag escolhida pelo usuário
            
            % vai garantir que o Bloom Filter para o jogo foi configurado
            if ~isKey(bloomFilters, jogoEscolhido)
                % cria um novo Bloom Filter para o jogo
                bloomFilters(jogoEscolhido) = start_Bloom_Filter(N);            % inicializa o filtro para o jogo
                for i = 1:size(data, 2)-1
                    if data{idxJogoNormal, i} == 1                              % apenas vai inserir as tags ativas
                        tag = tags{i};                                          % usando a tag da coluna que lhe corresponde
                        bloomFilters(jogoEscolhido) = Bloom_Filter_insert(bloomFilters(jogoEscolhido), k, tag);
                    end
                end
            end
            
            % recupera o filtro do jogo e verifica a tag
            filtroDoJogo = bloomFilters(jogoEscolhido);
            isPresent = Bloom_Verify(filtroDoJogo, k, tagConsulta);
            
            % vai exibir o resultado da verificação
            if isPresent
                fprintf('A tag "%s" pertence ao jogo "%s" (Há possibilidade de falso positivo).\n', tagConsulta, jogoEscolhido);
            else
                fprintf('A tag "%s" não pertence ao jogo "%s".\n', tagConsulta, jogoEscolhido);
            end