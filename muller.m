function xc = muller(f,x0,x1,x2,tol)
h1 = x1 - x0;
h2 = x2 - x1;
t1 = (f(x1) - f(x0))/h1;
t2 = (f(x2) - f(x1))/h2;
d = (t2 - t1)/(h1 + h2);
i = 3;
while true
  b = t2 + h2*d;
  D = (b^2-4*f(x2)*d)^(1/2);
 if abs(b - D) < abs(b+D)
   E = b + D;
 else
   E = b - D;
 end
 h = -2*f(x2)/E;
 p = x2 + h;
 if abs(h) < tol
   break;
 end
 x0 = x1;
 x1 = x2;
 x2 = p;
 h1 = x1 - x0;
 h2 = x2 - x1;
 t1 = (f(x1) - f(x0))/h1;
 t2 = (f(x2) - f(x1))/h2;
 d = (t2 - t1)/(h1 + h2);
 i = i+1;
end
fprintf("经过%d次迭代得出",i)
xc = x1;
  
