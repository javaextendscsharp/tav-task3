#include <math.h>

float area(char type, float a, float b, float c) 
{
  float res;
  if (type == 'c') 
  {
    res = pow(a, 2) * M_PI;
    return res;
  } 
  else if (type == 's') 
  {
    res = a * a;
    return res;
  } 
  else if (type == 'r') 
  {
    res = a * b;
    return res;
  } 
  else if (type == 't') 
  {
    res = (a + b + c) / 2;
    return sqrt(res * (res - a) * (res - b) * (res - c));
  } 
  else
    return -1.0;
}
