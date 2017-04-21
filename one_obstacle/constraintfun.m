function [g geq]=constraintfun(x,start,centre,finish,radius)


d1=abs(det([x-start;centre-start]))/norm(x-start); % perpendicular distance from start to point x and the point centre
d2=abs(det([finish-x;centre-finish]))/norm(finish-x); % perpendicular distance from x to finish point from centre 
d3=norm(x-centre); % perpendicular distance from centre to x 

g(1)=-d1+radius;
g(2)=-d2+radius;
g(3)=-d3+radius;

geq=[];
