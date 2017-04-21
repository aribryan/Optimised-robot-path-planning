close all
clear all
clc

% size varies with your choice
lb=[0,0;      0,0;  0,3;    0,3;  0,3;  0,3;  0,3;   0,0];
ub=[10,10;  10,10;  10,7;  10,7;  10,7; 7,10; 7,10; 10,10];


freq=100; % discrete line
 %% choose optimal number of points

points=[1,1;
    2,2;
    3,3;
    4,4;
    5,5;
    6,6;
    7,7;
      8,8];
 init=size(points);
 
 n=init(1);

%  n=4;
%  points=10*rand(n,2);
%  init=size(points);
 
 

%% chose starting and finishing points 
start=[3,1];
finish=[7,9.5];



%% obstacle input
%no_ob=5; %number of obstacles
%obs 1
diam(1)=2;
centre(1,:)=[3,3];
radius(1)=diam(1)/2;
%obs 2
diam(2)=2;
centre(2,:)=[5,5];
radius(2)=diam(2)/2;
%obs 3
diam(3)=2;
centre(3,:)=[7,8];
radius(3)=diam(3)/2;

diam(4)=3;
centre(4,:)=[2,8];
radius(4)=diam(3)/2;

diam(5)=2;
centre(5,:)=[2,5];
radius(5)=diam(3)/2;

% square 1
xv1= [4 6 6 4 4];
yv1= [0 0 3 3 0];

% square 2
xv2= [4 6 6 4 4];
yv2= [10 10 7 7 10];


k=size(radius);
krad=k(2);

%%  obstacles 
for i=1:krad
    
%centretot(i,1)=centre(i,:);
%radiustot=[radius1;radius2;radius3];
radiustot(i,1)=radius(i);


%
inp(i,:)=centre(i,:)-diam(i)./2;
pos(i,:) = [inp(i,1),inp(i,2),diam(i),diam(i)];

% inp2=centre2-diam2./2;
% pos2 = [inp2(1) inp2(2) diam2 diam2];
% 
% inp3=centre3-diam3./2;
% pos3 = [inp3(1) inp3(2) diam3 diam3];
% 

end
%% optimization 

options=optimset('Display','Iter','Tolx',1.00e-6,'TolFun',1.00e-8,'MaxIter',200,'MaxFunEvals',500);


optim=fmincon(@(xpoints)objectivefun(xpoints,start,finish,n),points,[],[],[],[],lb,ub,@(xpoints)constraintfun3(xpoints,start,centre,finish,radiustot,freq),options);

%% illustration


for i=1:krad
    
rectangle('Position',pos(i,:),'Curvature',[1 1]);
hold on

end
% rectangle('Position',pos2,'Curvature',[1 1]);
% hold on
% rectangle('Position',pos3,'Curvature',[1 1]);
% hold on




plot(start(1),start(2),'O','MarkerSize',10)
hold on
plot(finish(1),finish(2),'O','MarkerSize',10)
hold on
for i=1:n
   plot(optim(i,1),optim(i,2),'*')
end
hold on

%% boundary

line([lb(1) lb(1)],[lb(1) ub(2)],'color','r');
line([lb(1) ub(2)],[ub(1) ub(2)],'color','r');
line([ub(1) ub(2)],[ub(1) lb(2)],'color','r');
line([ub(1) lb(2)],[lb(1) lb(1)],'color','r');

%% joining initial and final points

optima(n+2,2)=0;
optima(1,:)=start;
optima(n+2,:)=finish;

for k=2:n+1
    optima(k,:)=optim(k-1,:);
end

for m=1:n+1

dis(m)= sqrt(power((optima(m+1,1)-optima(m,1)),2)+power((optima(m+1,2)-optima(m,2)),2));
end
distanc=sum(dis);





if(n==1)
 line([start(1) optim(n,1)],[start(2) optim(n,2)]);
   line([optim(n,1) finish(1)],[optim(n,2) finish(2)]);
 else
     %line([start(1) optim(1,1)],[start(2) optim(1,2)]);
     for i=1:n+1
      line([optima(i,1) optima(i+1,1)],[optima(i,2) optima(i+1,2)]);
     end
        %line([optim(n-1,1) finish(1)],[optim(n-1,2) finish(2)]);
 
 end

line([start(1) finish(1)],[start(2) finish(2)],'LineStyle','- -');

hold on

plot(xv1,yv1,'Linewidth',2)
plot(xv2,yv2,'Linewidth',2)

hold off
grid on