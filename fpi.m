function xc = fpi(g, x0,tol)
x(1) = x0;
x(2) = g(x(1));
i=1;
while abs(x(i+1)-x(i)) > tol
   i = i +1; 
    x(i+1) = g(x(i));
end  
fprintf("经过%d次迭代得出",i)
xc = x(i+1);
