#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

// CHANGE path to match your environment
// Once compiled set the SUID bit on the binary

int main()
{
	setuid( 0 );
	system( "/home/ray/github/desktop/scrolllockled.sh off" );
	return 0;
}
