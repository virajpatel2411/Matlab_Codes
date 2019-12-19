function result = Bitfour(x)
A = [0 0 0 0];
count = 0;
y = x;
for count = 0:1:3
    b = mod(y,2);
    y = fix(y/2);
    A(4 - count) = b;
end
result = A;
end