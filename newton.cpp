#include<stdio.h>
#include<iostream>
#include<cmath>
using namespace std;
double f(double x)
{
   return x-0.8-0.2*sin(x);
}
double g(double x)
{
   return 1-0.2*cos(x);
} 

int main()
{
   double x=-1,y=0,tol=0.0001;
   int i=1;
   
   while(abs(x-y)>tol)
   {
      x=y;
      y=y-f(y)/g(y);
      printf("%d times : x : %.8lf y: %.8lf  delta : %.8lf\n",i++,x,y,abs(x-y));
   }
    system("pause");
}
