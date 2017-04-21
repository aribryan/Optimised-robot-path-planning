function f=objectivefun(x,start,finish)
d1=norm(x-start);
d2=norm(finish-x);
f=(d1+d2); 
end