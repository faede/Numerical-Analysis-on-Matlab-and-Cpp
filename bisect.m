%程序1.1二分法
%计算f(x) = 0的近似解
%输入:函数句柄f;a,b使得f(a)*f(b)<0,
%     已经容差tol
%输出:近似解xc
function xc = bisect(f,a,b,tol)
if sign(f(a))*sign(f(b)) >= 0
    error('f(a)f(b)<0 not satisfied!') %停止运行
end
fa = f(a);
while (b - a)/2 > tol
    c = (a + b)/2;
    fc = f(c);
    if fc == 0 %c是一个解,完成
        break
    end
    if sign(f(fc))*sign(f(fa)) < 0 %a和c形成一个新的区间
        b = c;                     %c和b形成新的区间
    else
        a = c; fa = fc;
    end
end
xc  = (a + b)/2;                %新的中点就是最优估计
