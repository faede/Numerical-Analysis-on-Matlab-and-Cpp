double g(double x){
     return sin(x);
}


int main()
{

     double x1 = 1,tol = 1E-6,x2,x3,x4=0;
     int i = 1;
     while(abs(x4-x1) > tol){
          x4 = x1;
          x1 = x1 - (x2-x1)*(x2-x1)/(x3+x1-2*x2);
          x2 = g(x1);
          x3 = g(x2);
          i++;
     }
     cout<<i<<endl;
     printf("%.10f",x4);
     system("pause");
     return 0;
}