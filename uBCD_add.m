function result = uBCD_add(x,y)
n1 = x;
n2 = y;
carry = 0;
carry2 = 0;
A = [];
B = [];
C = [];
D = [];
E = [];
F = [];
c = 0;
d = 0;
n = 0;
result2 = 0;

while(n1 ~= 0 && n2 ~=0)
    A = Bitfour(mod(n1,10));
    n1 = fix(n1/10);
    B = Bitfour(mod(n2,10));
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
    
    if(BtoD(C) > 9 || carry == 1)
        E = [0 1 1 0 E];
    else
        E = [0 0 0 0 E];
    end
end

if(carry == 1)
    D = [0 0 0 1 D];
    E = [0 0 0 0 E];
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
end

n = length(F);
for i = 1 : 4 : n
    A = [F(i) F(i + 1) F(i + 2) F(i + 3)];
    
end

display(result2);
result = F;
display(result); 
end


    
    
    
        
    
        
        
        
    
    
    
    
    
    

