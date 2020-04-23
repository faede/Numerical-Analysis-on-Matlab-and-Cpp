function xc = falseposition(f,x0,x1,tol)
x(1) = x0; 
x(2) = x1; 
x(3) = x(2)-f(x(2))/(f(x(2)-f(x(1))))*(x(2)-x(1));
i=1;         
while abs(x(2)-x(1)) > tol
    i = i + 1;
    t1 = x(2);
    t2 = x(3);
    x(3) = x(2)-f(x(2))/(f(x(2)-f(x(1))))*(x(2)-x(1));   
    if sign(f(x(2)))*sign(f(x(3))) < 0
      x(4) = x(3)-f(x(3))/(f(x(3)-f(x(2))))*(x(3)-x(2)); 
    else
      x(4) = x(3)-f(x(3))/(f(x(3)-f(x(1))))*(x(3)-x(1)); 
    end
    x(1) = t1;
    x(2) = t2;
end  
fprintf("经过%d次迭代得出",i)
xc = x(i+1);