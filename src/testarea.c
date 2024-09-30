#include <area.h>
#include <assert.h>
#include <math.h>
#include <stdio.h>

int main(void) 
{
  assert(area('c', 1, 0, 0) - M_PI < 0.0001);
  assert(area('s', 1, 0, 0) - 1.0 < 0.0001);
  assert(area('t', 1, 1, 1) - 1.5 < 0.0001);
  return 0;
}
