function Gaussian_elimination(A,b,n)
eps1=0.000000001;
for j = 1:n - 1
    if abs(A(j,j))<eps
        error('zero pivot encountered');
    end
    for i = j + 1:n
        mult = A(i,j)/A(j,j);
        for k = j+1:n
            A(i,k) = A(i,k) - mult*A(j,k);
        end
        b(i) = b(i) - mult*b(j);
    end
end
x = ones(n,1);
for i = n: -1 : 1
    for j = i + 1: n
        b(i) = b(i) - A(i,j)*x(j);
    end
    x(i) = b(i)/A(i,i);
end
x
