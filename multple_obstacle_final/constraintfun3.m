function [g geq]=constraintfun3(xpoints,start,centre,finish,radius,freq)




k1=size(xpoints);%now add 2 to include start and finish
k=k1(1)+2; 
no_of_circles=size(radius);
opt(k,2)=0;% matrix kX2 zeros
opt(1,:)=start;
opt(k,:)=finish;

count=1;


for m=2:k-1
    opt(m,:)=xpoints(m-1,:);
end



for i=1:no_of_circles
    
   for j=1:k-1 % inside line
    
    FP=opt(j,:);
    LP=opt(j+1,:);
    b = arrayline(FP, LP,freq);
    b=b'; 
    
    
    
    
    
    for nm=1:size(b,1)
        

      distan= sqrt(power((b(nm,1)-centre(i,1)),2)+power((b(nm,2)-centre(i,2)),2));
      
 if  (distan-radius(i)<0);
      
     

       
       
 g(count)=-distan+radius(i);
 

 
 else 
  g(count)=0; 
 end  
  count=count+1;      

         
         
    end 
    end
    
    

end


 geq=[];
 
end

     
     
     
