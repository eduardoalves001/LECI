function [BloomFilter] = Bloom_Filter_insert(BloomFilter, k, valor)
    for i = 1:k
        string = [valor num2str(i^5)];
        index = mod(string2hash(string), length(BloomFilter)) + 1;
        BloomFilter(index) = 1;
    end
end