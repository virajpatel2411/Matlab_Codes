function s = ex3(a,b)

c=0;
d=0;
y=0;

l=[];
m=[];
n=[];
car = 0;

res=[];



while(a~=0 && b~=0)
    c = mod(a,10);
    a = fix(a/10);
    l = Bitfour(c+3);
    
    d = mod(b,10);
    b = fix(b/10);
    m = Bitfour(d+3);
    
    for i=4:-1:1
    n(i) = l(i) + m(i) + car;
    car=0;
    if(n(i) == 2)
        n(i) = 0;
        car = 1;
    end
    if(n(i) == 3)
        n(i) = 1;
        car = 1;
    end
    end
    
    if(car==1)
        y = btd(n) + 3;
        n = Bitfour(y);
    else
        y = btd(n) - 3;
        n = Bitfour(y);
    end
    
    res = [res n];
end



res = [ car res];
s = res;
end
        
    
    
    


