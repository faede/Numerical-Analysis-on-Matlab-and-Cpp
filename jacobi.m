function jacobi(A, b, N) 
d=diag(A); %Extracting the diagonal Element of A
D=diag(d); %Making the diagonal matrix D from extracted diagonal elements
D_inv=1/D; %inverse of a diagonal matrix is simply 1/D
E=A-D; %Calculating Remainder Matrix
x=rand(3,1); %Initializing the vector 'x' with a random initial value
T=-D_inv*E;
C=D_inv*b;

for j=1:N %performing Jacobi Iterations for 'N' times
    x=T*x+C;
end
disp(x) %Display of result