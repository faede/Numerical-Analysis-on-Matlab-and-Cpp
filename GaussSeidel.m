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
