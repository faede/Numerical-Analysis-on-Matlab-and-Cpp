function xc = newton(f,g, x0, tol)
x(1) = x0;
x(2) = x(1)-f(x(1))/g(x(1));
i=1;
while abs(x(i+1)-x(i)) > tol
  i = i + 1;
    x(i+1) = x(i)-f(x(i))/g(x(i));
end  
fprintf("经过%d次迭代得出",i)
xc = x(i+1);
