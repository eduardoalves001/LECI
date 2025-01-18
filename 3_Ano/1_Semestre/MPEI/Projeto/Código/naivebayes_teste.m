            
            addpath('funcoes_auxiliares'); % Dá acesso à pasta com as com funções auxiliares, para evitar muita confusão.
            addpath('DataSets'); % Dá acesso à pasta com as tabelas xlsx, para evitar muita confusão.
            
            % Ler os dados do ficheiro Excel para o conjunto de teste
            data = readcell('naivebayes_data.xlsx');
            
            % Separar dados (X) e rótulos (Y) para o conjunto de teste
            X = cell2mat(data(2:end, 1:end-1)); % Converter características para matriz numérica
            Y = data(2:end, end);               % Última coluna como classe
            
            % Verificar se Y é numérico ou texto e converter para numérico
            if iscell(Y)
                Y = categorical(Y);  % Converter para categórico, se necessário
                Y = double(Y);       % Converter categorias para números (1 para +18, 0 para -18)
            end
            
            % Remover colunas de X com variância zero
            variancia = var(X);
            idx_constantes = find(variancia == 0);
            X(:, idx_constantes) = []; % Remover colunas constantes
            
            % Atualizar os nomes das tags para corresponder às colunas restantes
            tags = data(1, 1:end-1); % Nomes originais das tags
            tags(idx_constantes) = []; % Remover tags correspondentes às colunas removidas
            
            % Dividir os dados em treino (70%) e teste (30%) para a avaliação
            rng(0); % Fixar semente para reprodutibilidade
            indices = randperm(size(X, 1));
            nTreino = round(0.7 * size(X, 1));
            
            Xtreino = X(indices(1:nTreino), :);
            Ytreino = Y(indices(1:nTreino));
            
            Xteste = X(indices(nTreino+1:end), :);
            Yteste = Y(indices(nTreino+1:end));

            % Treinar o modelo Naïve Bayes com o conjunto de treino
            model = fitcnb(Xtreino, Ytreino, 'DistributionNames', 'kernel');
            
            % Precisão do modelo baseado nos resultados previstos.
            Yprevisto = predict(model, Xteste);
            precisao = sum(Yprevisto == Yteste) / length(Yteste);

            disp('Após dividir o modelo em 70% de treino e 30% de testes: ');
            fprintf('A precisão do modelo é de %.2f%%\n', precisao * 100);
            
            % Apresentar a Matriz de confusão, o que pode ajudar a detetar
            % diversos erros.

            % Slide 36 dos slides teoricos de naive bayes 
            matrizConfusao = confusionmat(Yteste, Yprevisto);
            disp('Matriz de Confusão:');
            disp(matrizConfusao);

            % Ir buscar à matriz de confusão os valores
            VP = matrizConfusao(1, 1);  % Verdadeiros positivos
            FP = matrizConfusao(1, 2);  % Falsos positivos
            FN = matrizConfusao(2, 1);  % Falsos negativos
            VN = matrizConfusao(2, 2);  % Verdadeiros negativos

            % Vou explicar o que caada coisa significa para nao me perder
            % 129 | representa os jogos que realmente são para +18 e foram classificados como tal
            % 20  | representa os jogos que realmente são para +18 mas o modelo classificou mal como -18
            % 3   | representa os jogos que realmente são para -18 mas o modelo classificou mal como +18
            % 153 | representa os jogos que realmente são para -18 e foram classificados como tal

            % Exibir os valores da matriz de confusão
            disp(['Verdadeiros Positivos (jogos para +18 e o modelo classificou como +18): ', num2str(VN)]);
            disp(['Falsos Positivos (jogos para +18 mas o modelo classificou mal como -18): ', num2str(FP)]);
            disp(['Falsos Negativos (jogos para -18 mas o modelo classificou mal como +18): ', num2str(FN)]);
            disp(['Verdadeiros Negativos (jogos para -18 e foram classificados como -18): ', num2str(VP)]);

            % Calcular a Precisão
            % Slide 37 dos slides teoricos de naive bayes
            accuracy = (VP + VN) / (VP + FP + VN + FN);
            
            % Calcular o Recall
            % Slide 40 dos slides teoricos de naive bayes
            recall = VP / (VP + FN);
            
            % Calcular o F1-score
            % Slide 42 dos slides teoricos de naive bayes
            f1_score = 2 * (accuracy * recall) / (accuracy + recall);
            
            % Exibir os resultados
            disp(['Accuracy: ', num2str(accuracy)]);
            disp(['Recall: ', num2str(recall)]);
            disp(['F1-score: ', num2str(f1_score)]);
            
