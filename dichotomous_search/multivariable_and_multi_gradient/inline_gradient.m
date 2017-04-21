function [d]=inline_gradient(f,p)
i=.001;
z1x = f(p(1)+i,p(2));
z2x = f(p(1)-i,p(2));
dzdx = (z1x-z2x)/(2*i);

z1y = f(p(1),p(2)+i);
z2y = f(p(1),p(2)-i);
dzdy = (z1y-z2y)/(2*i);

%d=[2*(x(1)-2),2*(x(2)-2)]
d=[dzdx,dzdy];