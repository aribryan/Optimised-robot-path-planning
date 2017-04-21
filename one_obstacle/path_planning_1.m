close all
clear all
clc
low_lim=[0,0];
high_lim=[10,10];

%start=[1,1];
start=rand(1,2);
%finish=[9,9];
finish=10*rand(1,2);

%% obstacle input
diam=4;
centre=[5,5];
radius=diam/2;
%%

inp=centre-diam./2;
pos = [inp(1) inp(2) diam diam];


%% choose initial optimal points
x0=10*rand(1,2);


options=optimset('Display','Iter','Tolx',1.00e-6,'TolFun',1.00e-8,'MaxIter',100,'MaxFunEvals',500);


optima=fmincon(@(x)objectivefun(x,start,finish),x0,[],[],[],[],start,finish,@(x)constraintfun(x,start,centre,finish,radius),options);

optima;

h=rectangle('Position',pos,'Curvature',[1 1]);
hold on
plot(start(1),start(2),'o')
hold on
plot(finish(1),finish(2),'o')
hold on
plot(optima(1),optima(2),'*')
hold on

%% boundary

line([low_lim(1) low_lim(1)],[low_lim(1) high_lim(2)],'color','r');
line([low_lim(1) high_lim(2)],[high_lim(1) high_lim(2)],'color','r');
line([high_lim(1) high_lim(2)],[high_lim(1) low_lim(2)],'color','r');
line([high_lim(1) low_lim(2)],[low_lim(1) low_lim(1)],'color','r');

%% joining initial and final points

line([start(1) optima(1)],[start(2) optima(2)]);
line([optima(1) finish(1)],[optima(2) finish(2)]);
line([start(1) finish(1)],[start(2) finish(2)],'LineStyle','- -');
grid on


