#include <stdio.h>

int binarySearch(int arr[], int l, int r, int x)
{
  while (l <= r) 
  {
    int m = l + (r - l) / 2;

    if (arr[m] == x)
      return m;
    if (arr[m] < x)
      l = m + 1;
    else
      r = m - 1;
  }
  return -1; 
}


int main(void)
{
    int arr[] = { 2, 3, 4, 10, 40, 0, -1 };
    int n = sizeof(arr) / sizeof(arr[0]);

    int testValues[] = {10, 1, 50, 4};
    int numTests = sizeof(testValues) / sizeof(testValues[0]);

    for (int i = 0; i < numTests; i++)
    {
        int x = testValues[i];
        int result = binarySearch(arr, 0, n - 1, x);
        
        if (result == -1)
            printf("Element %d is not present in array\n", x);
        else
            printf("Element %d is present at index %d\n", x, result);
    }

    return 0;
}
