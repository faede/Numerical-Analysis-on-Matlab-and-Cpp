function El=modified_euler_method(f,x_0,f_x0,h,pos)
N=(pos-x_0)/h;
t=x_0;
for i = 1:N
    f_x0 = f_x0+h/2*(f([t,f_x0]) + f([t+h,f_x0+h*f([t,f_x0])]));
    t=x_0+i*h;
endfor
El=f_x0;
endfunction
