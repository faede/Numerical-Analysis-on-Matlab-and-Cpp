#include<stdio.h>
#include<iostream>
#include<cmath>
using namespace std;
double f(double x)
{
   return x*x*x-2*x*x-5;
}


int main()
{
   double x=1,y=2,tol=0.0001,t;
   int i=1;
   
   while(abs(x-y)>tol)
   {
      t=y;
      y=y-f(y)/(f(y)-f(x))*(y-x);
      x=t;
      printf("%d times : x : %.8lf y: %.8lf  delta : %.8lf\n",i++,x,y,abs(x-y));
   }
    system("pause");
}
