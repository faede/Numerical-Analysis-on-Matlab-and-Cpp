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
