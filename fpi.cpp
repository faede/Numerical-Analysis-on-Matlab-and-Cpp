#include<stdio.h>
#include<iostream>
#include<cmath>
using namespace std;
double f(double x)
{
   return pow(2,-x);
}

int main()
{
   double x=0,y=0.5,t=0.0001;
   int i = 0;
   while (abs(x-y)>t)
   {      
      i++;
      x=y;
      y=f(y);
      printf("%04d times:    x:%.8lf y:%.8lf \n",i,x,y);
   }
   system("pause");
    
}
