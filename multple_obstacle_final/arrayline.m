
function b = arrayline(FP, LP,freq)

%freq = 10;  %10 segments;

deltax = (LP(1,1) - FP(1,1))/freq;
deltay = (LP(1,2) - FP(1,2))/freq;
halfdx = deltax/2;
halfdy = deltay/2;


xcents = FP(1,1) + halfdx + (0:freq-1)*deltax;
ycents = FP(1,2) + halfdy + (0:freq-1)*deltay;
b=[xcents;ycents];

