function signature = generateMinHash(tags, numHashes)
    [numJogos, numTags] = size(tags);
    signature = inf(numHashes, numJogos); 
    rng(42); 
    for h = 1:numHashes
        perm = randperm(numTags); 
        for j = 1:numJogos
            activeTags = find(tags(j, :)); 
            if ~isempty(activeTags)
                signature(h, j) = min(perm(activeTags)); 
            end
        end
    end
end