#include <stdio.h>

int search(int array[], int n, int x) 
{
  for (int i = 0; i < n; i++) 
  {
    if (array[i] == x) 
    {
        return i;
    }
  }
  return -1;
}


int main() 
{
    int array[] = {2, 4, 0, 1, 9};
    int n = sizeof(array) / sizeof(array[0]);
    
    /* 1 is present in array, 5 is not */
    int testValues[] = {1, 5}; 
    int numTests = sizeof(testValues) / sizeof(testValues[0]);

    for (int i = 0; i < numTests; i++) 
    {
        int x = testValues[i];
        int result = search(array, n, x);

        if (result == -1) 
        {
            printf("Element %d not found\n", x);
        } 
        else 
        {
            printf("Element %d found at index: %d\n", x, result);
        }
    }
    return 0;
}
