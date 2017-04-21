
function [w,F]=function_mult_dich(x0a,x0b,d,ep,f)

%% multivariable function
% intial points 
%x0a=0;
%x0b=0;
x=[x0a,x0b];  
%d=-grad(x);
%%%%%%%%%%%%
xmax=15;
xmin=-xmax;

%%  for sin function
d1=xmax;
d2=xmin;
%%
%f = inline('(x1-2).^2+(x2-2).^2','x1','x2');
%%

L=d1-d2;
%ep=0.01;
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
%     
    
end
w=min(X1,X2);

F=f(w(1),w(2));
% hold on
% plot(x(1),x(2),'o');
end



