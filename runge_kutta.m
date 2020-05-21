function RK=runge_kutta(f,x_0,f_x0,h,pos)
N=(pos-x_0)/h;
t=x_0;
for i = 1:N
  K1=h*f([t,f_x0]);
  K2=h*f([t+h/2,f_x0+K1/2]);
  K3=h*f([t+h/2,f_x0+K2/2]);
  K4=h*f([t+h,f_x0+K3]);
  f_x0 = f_x0+(K1+2*K2+2*K3+K4)/6;
  t=x_0+i*h;
endfor
RK=f_x0;
endfunction
