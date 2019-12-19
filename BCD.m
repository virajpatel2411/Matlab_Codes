function s = BCD(a,b)
l=[];
m=[];

c=0;
d=0;
car = 0;
car2=0;

add2 = [];
sum = [];
res = [];
do
{
 c = mod(a,10);
 a = fix(a/10);
 l = [Bitfour(c) l];
}
while(a~=0)
end

do
{
 d = mod(b,10);
 b = fix(b/10);
 m = [Bitfour(d) m];
}
while(b~=0)
end

count = 0;
k=0;j=0;
k = length(l);
j = length(m);
if k>j
    for i=0:1:k-j-1
        l=[Bitfour(0) l];
    end
    for i=k:-4:1
       for count=4:-1:1
         res(count)=a(i)+b(i)+car;
        car=0;
        if(res(count)==2)
            res(count)=0;car=1;
        end
        if(res(count)==3)
            res(count)=1;car=1;
        end
        i=i+1;
       end
       if (car == 1)
           add2 = [add2 0 1 1 0];
       else if (btd(res) > 9)
               add2 = [add2 0 1 1 0];
           else
               add2 = [add2 0 0 0 0];
           end
       end
       sum = [res sum];
    end
    for i=k:-1:1
        sum(i) = sum(i) + add2(i) + car2(i);
        car2(i) = 0;
        if(sum(i) == 2)
            sum(i) = 0; car2 = 1;
        end
        if(sum(i)==3)
            sum(i) = 1; car2 = 1;
        end
    end
    sum = [0 0 0 car sum];
    s = sum;
end
            
          
if k<j
    for i=0:1:j-k-1
        m=[Bitfour(0) m];
    end
end
end

