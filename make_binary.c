#include <stdio.h>
#include <ctype.h>
 
int main(int argc, char **argv) {
    FILE *fp;
    char null[1] = "\0";
 
    // open file
    if(!(fp = fopen(argv[1], "ab"))) {
        printf("Error to open file.\n");
        return 0;
    }
 
    long pos, max = 0xFF << 1;
 
    // get file size
    pos = ftell( fp );
    if( argc > 2 ) {
        max = atoi( argv[2] );
    }
 
    // write null data
    printf("Fill %ld to %ld\n", pos, max);
    int i;
    for( i = pos; i < max; i++ ) {
        fwrite( null, 1, 1, fp );
    }
 
    printf("Succeeded!\n");
 
    return 0;
}
