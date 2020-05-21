%for SOR method
function x = SOR( A ,B )
disp ( ' Enter system of equations in the form of AX=B')


w=input('Enter the relaxation parameter   ');
% A = D + L + U
D = diag(diag(A));
L = tril(A)- D;
U = triu(A)- D;

% check for convergence of system
e= max(eig(inv( D+w*L) * ( D*(1-w) - w*U)));

if abs(e) >= 1
    disp ('Since the modulus of largest eigen value of iterative matrix is not less than 1') 
    disp ('This process is not convergent. Please try some other process.')
    return
end

% initial guess for X..?
% default guess is [ 1 1 .... 1]'
r = input ( 'Any initial guess for X? (y/n):   ','s');
switch r 
    case 'y'
        % asking for initial guess
    X0 = input('pls enter initial guess for X :\n')
        % check for intial guess
    [nx, mx] = size(X0);
    if nx ~= na || mx ~= 1
        disp( 'ERROR: pls check input')
        return
    end
    otherwise
    X0 = ones(na,1);
end

%allowed error in final answer
t = input ( 'enter the error allowed in final ans:  ');
tol = t*ones(na,1);
k= 1;

X( : , 1 ) = X0;
err= 1000000000*rand(na,1); %intial error assumtion for looping
while sum(abs(err) >= tol) ~= zeros(na,1)
    X ( : ,k+ 1 ) = inv(D+w*L) * ( D*(1-w) - w*U)*X( : ,k) + inv(D+ w*L)*B;% SOR formula
    err = X( :,k+1) - X( :, k);% finding error
    k = k + 1;
    
end

fprintf (' The final ans obtaibed after %d itaration which is  \n', k)
X( : ,k)