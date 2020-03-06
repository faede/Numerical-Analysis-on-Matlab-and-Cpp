%程序1.2 不动点迭代
%计算g(x)=x的近似解
%输入:函数句柄g, 初试估计x0,
%     迭代步数k
%输出:近似解xc
function xc = fpi(g, x0, k)
x(1) = x0;
for i  = 1 : k
    x(i+1) = g(x(i));
end  
xc = x(i+1);
