
clc

clear all
xmax=5;
xmin=-xmax;

%% for plot 

x1=linspace(-10,10);
x2=linspace(-10,10);
[x1,x2]=meshgrid(x1,x2);
%%


T=1.0;
a=0.9;
n=500;
ep=0.0001;
f = inline('(x1-2).^2+(x2-2).^2','x1','x2');
%f=inline('(x1 + 2*x2 - 7)^.2+ (2*x1 + x2 - 5)^.2','x1','x2');
%sol=xmin+(xmax-xmin)*(rand(1,2));
sol=[5 5];
xopt=sol;
fopt=f(xopt(1),xopt(2));

i=1;
while(T>ep)
    
    while(i<=n)
        
       temp(i,:)=xopt;
       
    n_sol=xmin+(xmax-xmin)*(rand(1,2));
    new=f(n_sol(1),n_sol(2));
    old=f(sol(1),sol(2));
     if((new-old)<0)
      old=new;
         if(old<fopt)
             xopt=sol;
             fopt=f(xopt(1),xopt(2));
    
    ap=acceptance_probability(old,new,T);     
            
            
    if(ap>rand())
        sol=n_sol;
        old=new;
        
    end 
         end
     end
      
%plot(temp(i,1),xopt(i,2),'x'); 
   
i=i+1;
  

    end
    T=T*a; 
    
   

    
end
    
%end
n    
sol
f(sol(1),sol(2))

contour(x1,x2,f(x1,x2));
  hold on
  for i=1:500
      plot(temp(i,1),temp(i,2),'x');
  end
hold on
plot(sol(1),sol(2),'o');
figure
mesh(x1,x2,f(x1,x2));


grid on