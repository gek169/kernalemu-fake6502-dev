#include <stdio.h>
#include <stdlib.h>
char BUF[256];


int main(){

	int a;
	int b;
	printf("\r\nEnter an integer:");
	scanf("%s", BUF);
	a = atoi(BUF);
	printf("\r\nEnter another integer:");
	scanf("%s", BUF);
	b = atoi(BUF);

	{int i;
		for(i = 0; i < b; i++)
			printf("%d\r\n", i * a);

	}
	return 0;
}
