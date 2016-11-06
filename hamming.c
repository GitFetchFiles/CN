#include<stdio.h>
#include<math.h>
void main()
{
int m,r=0,a[50],i,n,j,k,p,b[50],d[20],rec[50],c1,c2,c8,c,c4;
printf("Enter the length of data word:\t");
scanf("%d",&m);
printf("Enter the data word:\n");
for(i=1;i<=m;i++)
{
scanf("%d",&d[i]);
}
while((m+r+1)>pow(2,r))
{	r++;	}
printf("The value of r is: %d\n",r);
n=m+r;
printf("The codeword length is: %d\n",n);

k=0;
j=1;
for(i=1;i<=n;i++)
{
	p=pow(2,k);
	if(i!=p)
	{	a[i]=d[j];
		j++;    
	}
	else
	{	k++;	}
}
a[1]= (a[3]^a[5]^a[7]^a[9]^a[11]^a[13]);
a[2]= (a[3]^a[6]^a[7]^a[10]^a[11]^a[14]);
a[4]= (a[5]^a[6]^a[7]^a[12]^a[13]^a[14]);
a[8]= (a[9]^a[10]^a[11]^a[12]^a[13]^a[14]);
printf("The hamming code is:\n");
for(i=1;i<=n;i++)
{	printf("%d\t",a[i]);		}
printf("\n Enter the received hamming code:\n");
for (i=1;i<=n;i++)
{	scanf ("%d",&rec[i]);		}
c1=rec[1]^rec[3]^rec[5]^rec[7]^rec[9]^rec[11]^rec[13];
c2=rec[2]^rec[3]^rec[6]^rec[7]^rec[10]^rec[11]^rec[14];
c4=rec[4]^rec[5]^rec[6]^rec[7]^rec[12]^rec[13]^rec[14];
c8=rec[8]^rec[9]^rec[10]^rec[11]^rec[12]^rec[13]^rec[14];
c=c8*8+c4*4+c2*2+c1 ;
if(c==0) 
{	printf("\nCongratulations there is no error: ");		}
 else
{	printf("Error on the postion: %d\nThe correct message is :\n",c);	}
if(rec[c]==0)
rec[c]=1;
else
rec[c]=0;
for (i=1;i<=n;i++)
{	printf("%d ",rec[i]);	} }
