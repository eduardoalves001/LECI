% Cria um filtro de bloom que será usado para inserir as tags a 1 dos jogos 
% selecionados pelo utilizador, cria um vetor com N elementos todos 
% inicializados a 0, o 1 representa que é apenas uma linha,
% o logical armazena cada valor binário 0 ou 1, e usa apenas 1 bit.
% Logo é eficiente em memoria, em vez do uso de uint8, ou uint16, etc..
function [BloomFilter] = start_Bloom_Filter(N)
    BloomFilter = zeros(1, N, 'logical'); 
end
