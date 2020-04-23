function xc = Steffensen(g,x0,tol)
x(1) = x0;
x(2) = g(x(1));
x(3) = g(x(2));
x(4) = x(3)-2*x(2)+x(1);
i = 1;
while abs(x(4)-x(1)) > tol
  x(4) = x(1);
  x(1) = x(3)-2*x(2)+x(1);
  x(2) = g(x(1));
  x(3) = g(x(2));
  i = i+1;
end
fprintf("����%d�ε����ó�",i)
xc = x(1);