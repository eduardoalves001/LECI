    
    addpath('funcoes_auxiliares'); % Dá acesso à pasta com as com funções auxiliares, para evitar muita confusão.
    addpath('DataSets'); % Dá acesso à pasta com as tabelas xlsx, para evitar muita confusão.
    
    % Configuração inicial do Bloom Filter
    N = 3256; % Tamanho do Bloom Filter, coloquei o tamanho a 3256, pois o numero de valores inseridos é 407, então fica 8 vezes o valor, que é um valor adequado apos falar com o professor.
    k = 6;   % Número de funções hash, Usando a formula de k optimo dos slides, obtemos k=ln(2)⋅(3256/407) ~= 5,55, que arrendonda para 6.​
    bloomFilters = containers.Map(); % Inicializar como vazio
    
    % Carregar os dados da tabela Excel que está na pasta DataSets
    ficheiro = 'jogos_normais.xlsx'; % Nome da tabela com os jogos normais
    data = readtable(ficheiro, 'VariableNamingRule', 'preserve');
    
    % Separar os nomes dos jogos e as tags
    jogos = data{:, end};                                               % Última coluna que contém os nomes dos jogos
    tags = data.Properties.VariableNames(1:end-1);                      % Nomes das tags (menos a última coluna)
    
    % Inicializar o mapa conjuntoVerdadeiro para associar jogo às tags inseridas
    conjuntoVerdadeiro = containers.Map; % Mapa para associar jogo às tags verdadeiras de cada jogo
    totalTagsInseridas = 0;
    
    for i = 1:length(jogos)
        jogo = jogos{i};
        conjuntoVerdadeiro(jogo) = {}; % Começar a lista de tags para cada jogo
    
        % Caso o filtro de Bloom ainda não existir para o jogo, criamos o
        % filtro para o jogo usando a função auxiliar start_Bloom_Filter.
        if ~isKey(bloomFilters, jogo)
            % Instanciamos o Bloom Filter para o jogo
            bloomFilters(jogo) = start_Bloom_Filter(N);
    
            % Inserimos as tags no filtro de bloom
            for j = 1:length(tags)
                if data{i, j} == 1 % Se a tag está ativa para o jogo
                    tag = tags{j};
                    bloomFilters(jogo) = Bloom_Filter_insert(bloomFilters(jogo), k, tag);
                    totalTagsInseridas = totalTagsInseridas + 1;
                end
            end
        end
    
        % Verificamos se o filtro de Bloom existe para o jogo e caso exista
        % guardamos as tags do jogo no filtro.
        if isKey(bloomFilters, jogo)
            filtroDoJogo = bloomFilters(jogo);
            for j = 1:length(tags)
                if data{i, j} == 1 % Se a tag estiver presente no jogo.
                    conjuntoVerdadeiro(jogo) = [conjuntoVerdadeiro(jogo), tags{j}];
                end
            end
        end
    end
    
    % Gerar o conjunto conjuntoTags, de todas as combinações de Tags
    conjuntoTags = tags;
    
    % Testar com apenas algumas tags diferentes das que tinham sido usadas
    % previamente.
    numTagsTestes = 1; % Usar tag nova para efeitos de testagem
    
    % Vamos inserir a tag nova no jogo sem retirarmos as previamente
    % inseridas.
    for i = 1:length(jogos)
        jogo = jogos{i}; % Ir um a um, colocar os dados
        if isKey(bloomFilters, jogo)
            filtroDoJogo = bloomFilters(jogo); % Obter o filtro do jogo
    
            % Inserir a tag nova
            for j = 1:numTagsTestes
                tagFalsa = tags{randi(length(tags))}; % Escolher ao calhas a tag nova
                filtroDoJogo = Bloom_Filter_insert(filtroDoJogo, k, tagFalsa); % Inserir a tag escolhida aleatoriamente no fitro
            end
    
            % Atualizar o filtro de Bloom
            bloomFilters(jogo) = filtroDoJogo;
        end
    end
    
    % Vamos fazer a verificação total para testes
    totalVerificacoes = 0;
    falsosPositivos = 0;
    for i = 1:length(jogos)
        jogo = jogos{i};
        if isKey(bloomFilters, jogo)
            filtroDoJogo = bloomFilters(jogo); % Obtemos o filtro de Bloom dos jogos
            conjuntoVerdadeiro_jogo = conjuntoVerdadeiro(jogo); % Tags inseridas "verdadeiramente" no jogo, guardadas neste mapa
    
            for j = 1:length(conjuntoTags)
                tagDetetar = conjuntoTags{j};
    
                % A cada iteração nesta verificação de Tags, aumentamos o
                % total de verificações. 
                totalVerificacoes = totalVerificacoes + 1; 
                % Depois disso, usamos a função auxiliar Bloom_Verify para
                % verificar se a tag está no filtro de bloom ou nao
                pertenceBloom = Bloom_Verify(filtroDoJogo, k, tagDetetar);
                % Se a tag pertencer ao filtro de bloom mas não for membro
                % do conjuntoVerdadeiro de Tags de um jogo, então é porque
                % é um Falso Positivo.
                if pertenceBloom && ~ismember(tagDetetar, conjuntoVerdadeiro_jogo)
                    falsosPositivos = falsosPositivos + 1;
                    fprintf('Novo Falso positivo detectado: Jogo "%s", Tag "%s"\n', jogo, tagDetetar);
                end
            end
        end
    end
    
    
    
    % Calcular percentagem de falsos positivos
    if totalVerificacoes > 0
        percentagemFP = (falsosPositivos / totalVerificacoes) * 100;
    else
        percentagemFP = 0; % Senão houvessem verificações obviamente que não temos percentagem útil 0/n = 0
    end
    
    probabilidadeSlidesFP = (1 - (1 - 1/N)^(k * totalTagsInseridas))^k; % Slide 45 das aulas teóricas do Bloom Filter
    percentagemSlides = probabilidadeSlidesFP * 100; % A probabilidade está entre 0 e 1, mas para termos de 0 a 100, ou seja se queremos em percentagem temos que multiplicar o valor por 100.
    
    % Mostrar os resultados
    fprintf('\nResultado do Teste Bloom Filter:\n');
    fprintf('Número total de verificações: %d\n', totalVerificacoes);
    fprintf('Número total de tags inseridas no Bloom Filter (ou seja com o valor 1): %d\n', totalTagsInseridas);
    fprintf('Número de Falsos positivos: %d\n', falsosPositivos);
    fprintf('Percentagem de falsos positivos: %.2f%%\n', percentagemFP);
    fprintf('Probabilidade de ocorrer falsos positivos: %.2f%%\n', percentagemSlides);