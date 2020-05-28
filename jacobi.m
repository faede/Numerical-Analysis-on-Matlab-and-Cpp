function x=jacobi(a,b,x0,e)
x=x0; 
x_temp=1;
while abs(max(x-x_temp))>e
    x_temp=x; 
    for i=1:length(b)         
        sum=0;         
        for j=1:length(b)             
            if(j~=i) 
                sum=sum+a(i,j)*x_temp(j);             
            end         
        end 
    x(i)=-(sum-b(i))/a(i,i);     
    end     
end
