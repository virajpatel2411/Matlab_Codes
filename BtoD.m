function result = BtoD(A)
n = length(A);
sum = 0;

for i = 0 : 1 : n-1
    sum = sum + (2.^i)*A(n-i);
end
result = sum;
end