#include<stdio.h>
#include<iostream>
#include<cmath>
using namespace std;
double f(double x)
{
   return x-0.8-0.2*sin(x);
}


int main()
{
   double a=0,b=0.5,tol=0.0001,c;
   int i=1;
   
   while(abs(f(c))>tol)
   {
      c = (b*f(a)-a*f(b))/(f(a)-f(b));
      printf("%d times : a : %.8lf b: %.8lf  c : %.8lf f(c): %.8lf\n",i++,a,b,c,f(c));
      if(abs(f(c))<tol)
         break;
      if(f(a)*f(b)<0){
         b=c;
      }
      else
      {
         a=c;
      }      
   }
    system("pause");
}
