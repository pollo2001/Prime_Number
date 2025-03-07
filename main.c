
//
//  main.c
//  ppp
//
//  Created by lil shortyyy on 10/12/22.
//

#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main()
{
    int x[100];
    int l = 0;
    int totalocc = 0;
    int rnum;
    
    
    srand(time(0));
    
    for(int i =0; i < 100; i++)
    {
        rnum = rand() % 6 + 1; //random number between 1 and 6
        x[i] = rnum;
        printf("Index %d: %d \n",i+1,x[i]);
    }
    int flag;
    
    // perform a search for conesecutive matching elemts and count length of each run
    //print each run lentgh and tot num of occurences
    for(int i=1; i < 100; i++) //start 1 ahead
    {
        flag =1;
        if(x[i-1] == x[i])
        {
            l++;
            if(x[i+1]!=x[i])
            {
                flag =0;
            }
            
            if(l>1 && flag==0)
            {
                totalocc++;
                printf("Run %d: %d \n",totalocc,l);
                l=1;
            }
        }

    }
    printf("total runs:%d",totalocc);
    
    
        
        
        
        
        
        /*
        if(x[i] == x[i+1]) //compare current value to next
        {
            while(x[i] == x[i+1])
        {
            l++; //add l as sequence remains equal
            i++;//increment
        }
            printf("Run %d: ",totalocc+1);
            printf("%d long \n", l);
            totalocc++;
        }
        
        l =1; //reset l to 1
    }
    
    printf("Total Runs: %d\n\n", totalocc);
    */
    return 0;
}

