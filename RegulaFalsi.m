function xc = RegulaFalsi(f,a,b,k)
for i = 1:k
    c = (bf(a)-af(b))/(f(a)-f(b));
    if f(c)==0
        break
    end
    if sign(f(a))*sign(f(b)) < 0
        b = c;
    else
        a = c;
    end
end
xc = c;
        