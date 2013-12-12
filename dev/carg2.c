#include <stdio.h>
#include <stdlib.h>
// Iterate through argv array printing the results
// ray test code 12/12/2013
int main(int argc, char **argv)
{
	while(argc--)
		printf("%s\n", *argv++);
	exit(EXIT_SUCCESS);

}
