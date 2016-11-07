#include<stdio.h>
void main()
{   
char c[20];
printf("Enter the ip address:");
gets(c);
int a=((c[0]-48)*100);
int b=((c[1]-48)*10);
int e=((c[2]-48)*1);
int d=a+b+e;
printf("\na=%d",a);
printf("\nb=%d",b);
printf("\ne=%d",e);
printf("\nd=%d",d);
printf("\n\nip address is:%s\n\n",c);

 int i;
 
    i=0;
    if (d>=0 && d<=127)
    {
        printf("Class A\n");
        printf("The subnet mask is 255.0.0.0\n");
    }
    else if(d>=128 && d<=191)
    {
        printf("Class B\n");
        printf("The subnet mask is 255.255.0.0\n");
    }
    else if(d>=192 && d<=223)
    {
        printf("Class C\n");
        printf("The subnet mask is 255.255.255.0\n");
    }
    else if(d>=224 && d<=239)
    {
        printf("Class D\n");
        printf("The subnet mask is not defined. Reserved for multicast\n");
    }
    else if(d>=240 && d<=255)
    {
        printf("Class E\n");
        printf("The subnet mask is not defined. Reserved for research and development\n");
    }
}
