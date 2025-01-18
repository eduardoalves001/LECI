    
    % Ficheiro principal de aplicação conjunta
    
    % Limpar o workspace
    clear; 
    clc;
    
    addpath('funcoes_auxiliares'); % Dá acesso à pasta com as com funções auxiliares, para evitar muita confusão.
    addpath('DataSets'); % Dá acesso à pasta com as tabelas xlsx, para evitar muita confusão.
    
    while true
        % 1. Menu de Escolhas
        opcao = menu('Bem vindo ao nosso projeto! Por favor, escolha uma opção', ...
            'Verificar se uma combinação de tags é ou não para maiores de 18 (Naive Bayes)', ...
            'Recomendar um jogo VR parecido a um jogo normal (MinHash)', ...
            'Verificar se um jogo tem uma certa tag (Bloom Filter)', ...
            'Testar os Módulos (Naive Bayes, Bloom Filter e MinHash)', ...
            'Ver listas de jogos', ...  
            'Sair');
        
        switch opcao
    
            % O utilizador escolhe se gosta de certas tags de jogo e no fim
            % escolhe o quao importante cada tag é para ele. As naive bayes vão
            % classificar qual é o jogo mais importante baseado nas escolhas
            % dos utilizadores.
            
            case 1
               % Chamar o ficheiro do naive bayes para o caso de
               % escolhermos a primeira opção do menu.
               naivebayes();
    
            case 2
               % Chamar o ficheiro da minhash para o caso de
               % escolhermos a segunda opção do menu.
               minhash();
    
            case 3
               % Chamar o ficheiro do bloom Filter para o caso de
               % escolhermos a terceira opção do menu.
               bloomfilter();

            case 4
                listaOpcoes = {'Testar Naive Bayes', 'Testar Bloom Filter', 'Testar MinHash'};
                [opcaoTeste, tf] = listdlg('ListString', listaOpcoes, 'SelectionMode', 'single', 'PromptString', 'Escolha uma opção de teste:');
                
                if tf  % Se o usuário escolheu uma opção (tf = true)
                    % Chamar a função de teste correspondente
                    switch opcaoTeste
                        case 1
                            naivebayes_teste();
                        
                        case 2
                            bloomfilter_teste();
                        
                        case 3
                            minhash_teste();
                    end
                else
                    disp('Nenhuma opção de teste selecionada. Saindo...');
                end
    
             % Caso 4: Ver listas de jogos
             case 5
                    disp('A exibir as tabelas disponiveis...');
                    
                   % Vai buscar as tabelas, isto é possivel porque no topo
                   % temos o caminho para a pasta DataSets
                    jogosNormais = 'jogos_normais.xlsm'; 
                    jogosVR = 'jogos_vr.xlsm';            
                    naivebayesdata = 'naivebayes_data.xlsm'; 
                    
                    % Lista de opções para o utilizador escolher
                    datasets = {'Jogos Normais', 'Jogos VR', 'Naive Bayes Data'};
                    
                    % Usar listdlg como fizemos no bloomfilter.m para
                    % mostrar a varias tabelas disponiveis e deixar que o
                    % utilizador escolha aquela que quiser ver
                    [idxDataset, tf] = listdlg('ListString', datasets, 'SelectionMode', 'single', 'PromptString', 'Escolha um conjunto de dados:');
                    
                    if ~tf
                        disp('Nenhum conjunto de dados selecionado, retornando ao menu...');
                        return; % Se o utilizador não selecionar nada, retorna ao menu
                    end
                    
                    % Determinar a tabela escolhida
                    % Escolher o dataset com base na seleção do utilizador
                    % Escolher o dataset com base na seleção do utilizador
                    switch idxDataset
                        case 1
                            % Jogos Normais selecionado
                            tabelaEscolhida = fullfile('DataSets', 'jogos_normais.xlsx');
                            datasetNome = 'Jogos Normais';
                        case 2
                            % Jogos VR selecionado
                            tabelaEscolhida = fullfile('DataSets', 'jogos_vr.xlsx');
                            datasetNome = 'Jogos VR';
                        case 3
                            % Naive Bayes Data selecionado
                            tabelaEscolhida = fullfile('DataSets', 'naivebayes_data.xlsx');
                            datasetNome = 'Naive Bayes Data';
                        otherwise
                            disp('A sair...');
                            return;  
                    end
                    
                    % Exibir uma mensagem confirmando a seleção
                    disp(['A abrir a tabela selecionada: ', datasetNome, '...']);
                    
                    % Verificar se a tabela existe
                    if exist(tabelaEscolhida, 'file') == 2 % o existe funciona assim -> exist(nome, tipo) o 2 significa que o que se esta a testar existe e é um arquivo.
                        % Abrir o artigo diretamente aqui no matlab, o que
                        % me estava sempre a acontecer era que so conseguia
                        % abrir no excel mas agora que fiz return no fim já
                        % dá para abrir aqui.
                        open(tabelaEscolhida);  % Abre a tabela
                    else
                        disp(['Tabela ', datasetNome, ' não encontrado.']);
                    end
                    
                    return; % As tabelas só estão a abrir dentro do matlab se terminarmos o programa, enquando o menu estiver ativo as tabelas nao estao a aparecer.

               
             case 6
                % Caso 3: Sair do programa
                disp('A sair... Até logo!');
                return;
            
            otherwise
                disp('Escolha uma das opções disponiveis!');
        end
    end