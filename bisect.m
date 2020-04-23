function xc = bisect(f,a,b,tol)
if sign(f(a))*sign(f(b)) >= 0
    error('f(a)f(b)<0 not satisfied!') 
end
i=0;
while (b - a)/2> tol
    c = (a + b)/2;
    fa = f(a);
    fc = f(c);
    if sign(fc)*sign(fa) < 0 
        b = c;                     
    else
        a = c; 
    end
    i = i + 1;
end
fprintf("经过%d次迭代得出",i)
xc  = (a + b)/2;               
