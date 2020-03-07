#include <stdio.h>
#include <iostream>
#include <cmath>
using namespace std;
double f(double x)
{
   return x*x-3;
}

int main()
{
   double a=1.5,b=2,fa,fc,c,tol=0.0001;
   int i = 0;
   if (f(a)*f(b) >= 0)
    {
       printf("f(a)f(b)<0 not satisfied!");
       system("pause");
    }
   fa = f(a);
   while ((b - a) / 2 > tol)
   {
      
      
      c = (a + b) / 2;
      printf("%04d times:    a:%.8lf b:%.8lf c:%.8lf delta x:%.8f\n", i, a, b, c,(b-a)/2);
      i++;
      fa = f(a);
      fc = f(c);
      
      if (fc == 0)
         break;
      if (fa * fc < 0)
        b = c;
      else
      {
         a = c;
         
      }
      
   }
   printf("last c:%.8lf\n",c);
   system("pause");
}
