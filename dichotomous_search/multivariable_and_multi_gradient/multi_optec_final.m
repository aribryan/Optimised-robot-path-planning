clear all
close all
%% multivariable function
% intial points 
x1=linspace(-20,20);
x2=linspace(-20,20);
[x1,x2]=meshgrid(x1,x2);
x0a=0;
x0b=0;
x=[x0a,x0b];  
%% constant gradient
d=[1 1];
%%%%%%%%%%%%
xmax=5;
xmin=-xmax;
n=250;
%%  for sin function
d1=xmax;
d2=xmin;
%%
f = inline('(x1-2).^2+(x2-2).^2','x1','x2');
%%

L=d1-d2;
ep=0.001;
while((d1-d2)>2*ep)
    m=(d1+d2)/2;
    
    k=m-ep;
    l=m+ep;
    X1 = x +k*d  ;
    X2 = x +l*d  ;
        
    
    if f(X1(1),X1(2))>f(X2(1),X2(2))
        d2=l;
    elseif f(X1(1),X1(2))<f(X2(1),X2(2))
        d1=l;
        
    elseif f(X1(1),X1(2))==f(X2(1),X2(2))
            d1 = k; d2 = k;
    end
% w=min(d1,d2)
% x=(xmin:0.01:xmax); 
% y=(x-3).^2+5;
% plot(x,y);
    
contour(x1,x2,f(x1,x2));hold on
plot(X1,X2,'x');
 
end
w=min(X1,X2)
hold on
plot(w(1),w(2),'o');
%%
figure
mesh(x1,x2,f(x1,x2));
% figure


%%

