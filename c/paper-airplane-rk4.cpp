#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define PI 3.1415926535897932385

  const double c=0.0015125, k=0.08;
  
void diffEq(double x, double y[],double yp[]);
void ruku(double xi, double yi[], double h);

main(){
	int i,j;
	double v0, theta0;
	double h;
	double yi[5], xi=0.;
	double y1old,y3old,tGround,xGround;
	FILE *fp;
	
	printf("초기 속력과 발사각을 각도로 입력하세요!\n");
	scanf("%lf %lf", &v0,&theta0);
	
	h=0.01;
	yi[1]=0.;
	yi[2]=v0*cos(theta0*PI/180.);
	yi[3]=0;
	yi[4]=v0*sin(theta0*PI/180.);
	
	fp=fopen("paper airplane.txt", "w");
	printf("초속력 = %.3f, 발사각=%.2f\n", v0,theta0);
	fprintf(fp,"초속력 = %.3f, 발사각=%.2f\n",v0,theta0);
	
	for(j=1;j<=1000;j++){
		y1old=yi[1];
		y3old=yi[3];
		ruku(xi,yi,h);
		xi=xi+h;
		if(yi[3]<0) break;
		printf("t=\%.3f, x=\%.5f, v_x=%.5f, y=%.5f, v_y=%.5f\n"
		      ,xi,yi[1],yi[2],yi[3],yi[4]);
		fprintf(fp,"\%.3f, \%.5f, v_x=%.5f, %.5f, v_y=%.5f\n"
		      ,xi,yi[1],yi[2],yi[3],yi[4] );
		      
	}
	xGround = y1old + (yi[1]-y1old)*y3old/(y3old-yi[3]);
	tGround = xi-h+yi[3]*h/(yi[3]-y3old);
	printf("비행시간=%f s수평도달 거리=%f m\n",tGround,xGround);
	fprintf(fp,"비행시간=%f s수평도달 거리=%f m\n",tGround,xGround);
	fclose(fp);
	system("pause");
}


void diffEq(double x, double y[], double yp[]){
	yp[1]=y[2];
	yp[2]=(sqrt(y[2]*y[2]+y[4]*y[4]))*(-c*y[2]-k*y[4]);
	yp[3]=y[4];
	yp[4]=sqrt((y[2]*y[2]+y[4]*y[4]))*(-c*y[4]+k*y[2])-9.8;
	
}

void ruku(double xi, double yi[], double h){
	
	int i,m;
	double x,y[5],yp[5],k[5][5];
	
	x=xi;
	for(i=1;i<=4;i++)
	    y[i] = yi[i];
	diffEq(x,y,yp);
	for(i=1;i<=4;i++)
	    k[i][1]=yp[i];
	
	    x=xi + h/2.;
	for(i=1;i<=4;i++)
	    y[i]=yi[i] +h/2.*k[i][1];
	diffEq(x,y,yp);
	for(i=1;i<=4;i++)
	    k[i][2]=yp[i];
	
	x=xi + h/2.;
	for(i=1;i<=4;i++)
	    y[i]=yi[i] +h/2.*k[i][2];
	diffEq(x,y,yp);
	for(i=1;i<=4;i++)
	    k[i][3]=yp[i];
	    
	x=xi + h/2.;
	for(i=1;i<=4;i++)
	    y[i]=yi[i] +h/2.*k[i][3];
	diffEq(x,y,yp);
	for(i=1;i<=4;i++)
	    k[i][4]=yp[i];
	    
	for(i=1;i<=4;i++)
	    yi[i]=yi[i]+h/6.*(k[i][1]+2.*k[i][2]+2.*k[i][3]+k[i][4]);
	    	
}
