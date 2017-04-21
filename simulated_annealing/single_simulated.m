
%% simulated annealing 
clc

clear all

xmax=30;
xmin=-xmax;
xm=linspace(xmin,xmax);
T=1.0;
a=0.9;

ep=0.0001;
n=500; % number of iterations
% sol=xmin+(xmax-xmin)*(rand(1));
sol= 20; % initial
xopt=sol;
%
f = inline('(x-2)^2+(x-4)^2+(x-5)^2','x');
%
fopt=f(xopt); %initial old cost

%% random neighbouring solution
while(T>ep)
    i=1;
    while(i<=n)
    n_sol=xmin+(xmax-xmin)*(rand(1));
    new=f(n_sol);
    old=f(sol);
     if((new-old)<0)
      old=new;
         if(old<fopt)
             xopt=sol;
             fopt=f(xopt);
         


    
    ap=acceptance_probability(old,new,T);
    if(ap>rand())
        sol=n_sol;
        old=new;
        
    end 
         end
         temp(i)=xopt;
     end
    i=i+1;
    
    end
    T=T*a; 
  

    
end
x=linspace(xmin,xmax);
y=(x-2).^2+(x-4).^2+(x-5).^2; 
plot(x,y)
    hold on
    xopt
ymin=f(xopt);
plot(xopt,ymin,'*','MarkerSize',10,'MarkerEdgeColor','b');
hold on
ytemp=(temp-2).^2+(temp-4).^2+(temp-5).^2;
plot(temp,ytemp,'o','MarkerSize',6,'MarkerEdgeColor','r');
%end

grid on

