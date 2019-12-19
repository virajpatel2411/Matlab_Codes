function result = uEx3_add(a,b)
n1 = a;
n2 = b;
c = 0;
x = 0;
carry = 0;
carry2 = 0;
result2 = 0;
result3 = 0;

A = [];
B = [];
c = [];
D = [];
E = [];
F = [];
G = [];
H = [];
I = [];
while(n1 ~= 0 && n2 ~= 0)
    A = Bitfour(mod(n1,10) + 3);
    n1 = fix(n1/10);
    B = Bitfour(mod(n2,10) + 3);
    n2 = fix(n2/10);
    
    for i = 0 : 1 : 3
        c = A(4 - i) + B(4 - i) + carry;
        carry = 0;
        if(c == 2);
            c = 0;
            carry = 1;
        end
        if(c == 3)
            c = 1;
            carry = 1;
        end
        C(4 - i) = c;
    end
    
    D = [C D];
    
    if(carry == 1)
        E = [0 0 1 1 E];
        G = [0 0 0 0 G];
    else
        E = [0 0 0 0 E];
        G = [0 0 1 1 G];
    end
end

if(carry == 1)
    D = [0 0 0 1 D];
    E = [0 0 0 0 E];
    G = [0 0 0 0 G];
end

n = length(D);

for i = 0 : 1 : n-1
    d = D(n - i) + E(n - i) + carry2;
    carry2 = 0;
    if(d == 2)
        d = 0;
        carry2 = 1;
    end
    if(d == 3)
        d = 1;
        carry2 = 1;
    end
    F(n - i) = d;
end

if(carry2 == 1)
    F = [0 0 0 1 F];
    G = [0 0 0 0 G];
end
j = 1;
n = length(F);
for i = 1 : 4 : n
    A = [F(i) F(i + 1) F(i + 2) F(i + 3)];
    B = [G(i) G(i + 1) G(i + 2) G(i + 3)]; 
    I(j) = BtoD(A)-BtoD(B);
    j = j + 1;
end
n = length(I);
for i = 1 : 1 : n
    H = [ H Bitfour(I(i)) ];
end


result = H;
display(H);
display(result);
end

