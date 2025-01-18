function [Pertence] = Bloom_Verify(BloomFilter, k, item)
    Pertence = 1;
    for i = 1:k
        string = [item num2str(i^5)];
        index = mod(string2hash(string), length(BloomFilter)) + 1;
        if (BloomFilter(index) == 0)
            Pertence = 0;
            break;
        end
    end
end
