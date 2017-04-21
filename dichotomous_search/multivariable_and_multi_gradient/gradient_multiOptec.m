clear all
close all

x1=linspace(-20,20);
x2=linspace(-20,20);
[x1,x2]=meshgrid(x1,x2);


x0a=-10;
x0b=10;
x=[x0a,x0b];


ep=.1;
f = inline('(x1-2).^2+(x2-2).^2','x1','x2');
k=f(x(1),x(2));

n=1;
while(k>.001*ep)
temp(n,:)=x;    
% syms p1 p2
% F =(p1-2)^2+(p2-2)^2;
% d = -gradient(F);    
    
    
d=-inline_gradient(f,x);


x=function_mult_dich(x(1),x(2),d,ep,f);

%k=f(x(1),x(2));
%k=sqrt(d(1)*d(1)+d(2)*d(2));
k=sqrt((d(1)^2)+(d(2)^2));
contour(x1,x2,f(x1,x2));
hold on
plot(temp(n,1),temp(n,2),'o');
n=n+1;
k
end
x
hold on
plot(x(1),x(2),'*');
hold on
for i=1:n-2
    plot([temp(i,1) temp(i+1,1)],[temp(i,2) temp(i+1,2)]);
    hold on
end
grid on