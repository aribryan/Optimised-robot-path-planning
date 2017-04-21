clear all
close all


xmax=6;
xmin=-xmax;
n=250;
%%  for sin function
d1=xmax;
d2=xmin;
%%
f = inline('(x-3)^2+5','x');
%%
j=1;
L=d1-d2;
ep=0.001;
while((d1-d2)>2*ep)
   
    m=(d1+d2)/2;
    
    k=m-ep;
    l=m+ep;
    
    if f(k)>f(l)
        d2=l;
    elseif f(k)<f(l)
        d1=l;
        
    elseif (f(k) == f(l))
            d1 = k; d2 = k;
    end
    
temp(j)=min(d1,d2);
j=j+1;
    
end

ytemp=(temp-3).^2+5;
plot(temp,ytemp,'o');
hold on

w=min(d1,d2)
x=(xmin:0.01:xmax);

y=(x-3).^2+5;
plot(x,y);
hold on    

ymin=(w-3).^2+5;
plot(w,ymin,'*');


grid on