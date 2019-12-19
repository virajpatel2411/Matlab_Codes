function s = add_comp2(a,b)
c=[];
k=0;
d=[];
e=[];
bit=8;
if(a(1)==0 && b(1)==0)
    for i=bit:-1:1
        c(i)=a(i)+b(i)+k;
        k=0;
        if(c(i)==2)
            c(i)=0;k=1;
        end
        if(c(i)==3)
            c(i)=1;k=1;
        end
    end
s=c;
if(s(1)==0)
    display(s);
else
    display(AnswerNotCorrect);
end
end
if(a(1)==1 && b(1)==1)
    for i=bit:-1:1
        c(i)=a(i)+b(i)+k;
        k=0;
        if(c(i)==2)
            c(i)=0;k=1;
        end
        if(c(i)==3)
            c(i)=1;k=1;
        end
    end

s=c;
if(s(1)>=1)
    s(1)=1;
    display(s);
else
    display(k);
end
end

if((a(1)==1 && b(1)==0) || (a(1)==0 && b(1)==1))
    if(a(1)==0)
        d=a;e=b;
    else
        d=b;e=a;
    end
    
    for i=bit:-1:1
        c(i)=d(i)+e(i)+k;
        k=0;
        if(c(i)==2)
            c(i)=0;k=1;
        end
        if(c(i)==3)
            c(i)=1;k=1;
        end
    end
    s=c;
    display(s)
end
end


       
        
            