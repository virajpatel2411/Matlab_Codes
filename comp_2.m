function s = comp_2(a)
k=0;
n=length(a);

for i=n:-1:1
    if a(i)==1
    k=i;
    break
    end
end
for i=k-1:-1:1
    if(a(i)==1)
        a(i)=0;
    else
        a(i)=1;
    end
end

s=a;
display(k);
display(i);
display (s);
end

