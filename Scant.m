function xc = Scant(f,x0,x1,tol)
x(1) = x0;
x(2) = x1;
i=1;
while abs(x(i+1)-x(i)) > tol
    i = i + 1;
    x(i+1) = x(i)-f(x(i))/(f(x(i)-f(x(i-1))))*(x(i)-x(i-1));   
end  
fprintf("����%d�ε����ó�",i)
xc = x(i+1);
