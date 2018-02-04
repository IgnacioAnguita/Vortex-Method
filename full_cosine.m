function [x] = full_cosine(c,N)
i=1:N;
x=(c/2)*(1-cos((i-1)*pi/(N-1)));
end

