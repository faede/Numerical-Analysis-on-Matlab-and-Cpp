function [x,lu,piv] = Gaussian_elimination_with_pivot(A,b)
[m,n] = size(A);
m = length(b);
piv = (1:n)';
for k = 1:n-1
   [col_max  index] = max(abs(A(k:n,k)));
   index = index + k-1;   
   if index ~= k
      tempA = A(k,k:n);
      A(k,k:n) = A(index,k:n);
      A(index,k:n) = tempA;
       
      tempb = b(k);
      b(k) = b(index);
      b(index) = tempb;
      
      temp = piv(k);
      piv(k) = piv(index);
      piv(index) = temp;
   end   
   A(k+1:n,k) = A(k+1:n,k)/A(k,k);   
   for i = k+1:n
      A(i,k+1:n) = A(i,k+1:n) - A(i,k)*A(k,k+1:n);
   end
   b(k+1:n) = b(k+1:n) - A(k+1:n,k)*b(k);
end
x = zeros(n,1);
x(n) = b(n)/A(n,n);
for i = n-1:-1:1
   x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end
lu = A;