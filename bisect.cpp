#include <stdio.h>
#include <iostream>
#include <cmath>
using namespace std;
double f(double x)
{
   return x*x-2;
}

int main()
{
   double a=1,b=2,fa,fc,c,tol=0.001;
   int i = 0;
   if (f(a)*f(b) >= 0)
    {
       printf("f(a)f(b)<0 not satisfied!");
       system("pause");
    }
   fa = f(a);
   while ((b - a) / 2 > tol)
   {
      
      printf("%04d times:    a:%.8lf b:%.8lf c:%.8lf error:%.8f\n", i, a, b, c,b-a);
      c = (a + b) / 2;
      fc = f(c);
      
      if (fc == 0)
         break;
      if (f(fc) * f(fa) < 0)
        b = c;
      else
      {
         a = c;
         fa = fc;
      }
      i++;
   }
   printf("%04d times:    a:%.8lf b:%.8lf c:%.8lf error:%.8f\n", i, a, b, c,b-a);

   system("pause");
}
