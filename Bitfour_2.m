function s = Bitfour(a)
b =[0 0 0 0];
for i = 0:1:3
    c = mod(a,2);
    a = fix(a/2);
    b(4-i) = c;
end
s = b;
end