%下三角
function x=upsub(A,b)
    [n n]=size(A);
    for i=1:n
        if(i>n)
            s=A(i,1:(i-1))*x(1:(i-1),1);
        else
            s=0;
        end
        x(i,1)=(b(i)-s)/A(i,i);
    end
end

%上三角
function X = backsub( A,b)
n=length(b);
X=zeros(n,1);
X(n)=b(n)/A(n,n);
for i=n-1:-1:1
    X(i)=(b(i)-A(i,i+1:n)*X(i+1:n))/A(i,i);
end
end

%高斯
function X = gauss( A,b )
[n n]=size(A);
for k=1:n-1
    for i=k+1:n
        m=A(i,k)/A(k,k);
        A(i,k+1:n)=A(i,k+1:n)-m*A(k,k+1:n);
        b(i)=b(i)-m*b(k);
    end
end
X=backsub(A,b);


end

%选主yuan高斯
function X = ppgs( A, b )
 
M = [A b];
[n n] = size(A);
X = zeros(n,1);
for i = 1:n-1
    N = abs(M);
    [~ e] = max(N((i:n),i));
    e=e+i-1;
    temp = M(i,:);
    M(i,:) = M(e,:);
    M(e,:) = temp;
    if M(i,i) == 0
        error('???');
    end
    for j = i+1:n
        m = M(j,i)/M(i,i);
        M(j,:) = M(j,:)-m*M(i,:);
    end
end
U = M(:,(1:n));
b = M(:,n+1);
X=backsub(U,b);
end

%比例消元
function X = spgs(A,b)
a = [A b];
[n, ~] = size(A);
for i=1:n 
    s(i)=abs(a(i,1));    
    for j=1:n 
       if abs(a(i,j))>s(i)           
           s(i)=abs(a(i,j));        
       end
    end
end
for i=1:(n-1) 
    b=abs(a(i,i))/s(i);     
    for j=i:n 
       if (abs(a(j,i))/s(j))>b           
           p=j;  
       end
    end
    if i~=p 
        b=a(i,:); 
        a(i,:)=a(p,:);         
        a(p,:)=b;      
    end 
    for j=(i+1):n 
        m=a(j,i)/a(i,i); 
        a(j,:)=a(j,:)-m*a(i,:);    
    end
end
U = a(:,(1:n));
b = a(:,n+1);
X=backsub(U,b);
end

%Crout
function [L,U,x]=Crout(a,c,d,b)
%a对角
%c，d上下带
    L=zeros(n);
    U=zeros(n);
    p=1:n;
    q=1:n-1;
    x=1:n;
    y=1:n;
    p(1)=a(1);
    for i=1:n-1
        q(i)=c(i)/p(i);
        p(i+1)=a(i+1)-d(i)*q(i);
    end
    
    y(1)=b(1)/p(1);
    for i=2:n
        y(i)=(b(i)-d(i-1)*y(i-1))/p(i);
    end
    
    x(n)=y(n);
    for i=(n-1):-1:1
        x(i)=y(i)-q(i)*x(i+1);
    end
    
    for i=1:n
        L(i,i)=p(i);
        U(i,i)=1;
    end
    
    for i=1:n-1
        L(i+1,i)=d(i);
        U(i,i+1)=q(i);
    end
end 

%Jacobi
function x=Jacobi(a,b,x0,e)
x=x0; 
x_temp=1;
while abs(max(x-x_temp))>e
    x_temp=x; 
    for i=1:length(b)         
        sum=0;         
        for j=1:length(b)             
            if(j~=i) 
                sum=sum+a(i,j)*x_temp(j);             
            end         
        end 
    x(i)=-(sum-b(i))/a(i,i);     
    end     
        
end

%G_S
function X = GaussSeidel( a,b,x0,e )
if size(b,2)~=1
    b=b';
end
if size(x0,2)~=1
    x0=x0';
end
D=diag(diag(a));
L=-tril(a-D);
U=-triu(a-D);
M=(D-L)\U;
g=(D-L)\b;
x1=M*x0+g;
while norm((x1-x0),2)>e
    x0=x1;
    x1=M*x0+g;
end
X=x1;

end

%SOR
function X = SOR( a,b,x0,e )
w=1.2;
if size(b,2)~=1
    b=b';
end
if size(x0,2)~=1
    x0=x0';
end
D=diag(diag(a));
L=-tril(a-D);
U=-triu(a-D);
M=(D-w*L)\((1-w)*D+w*U);
g=(D-w*L)\(w*b);
x1=M*x0+g;
while norm((x1-x0),2)>e
    x0=x1;
    x1=M*x0+g;
end
X=x1;
end
