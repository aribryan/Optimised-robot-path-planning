function f=objectivefun(xpoints,start,finish,n)

% start = evalin('base','start');

d(n+2,2)=0;
d(1,:)=start;
d(n+2,:)=finish;

for m=2:n+1
d(m,:)=xpoints(m-1,:);
end



for m=1:n+1
dis(m)= sqrt(power((d(m+1,1)-d(m,1)),2)+power((d(m+1,2)-d(m,2)),2));

end





f=sum(dis);

