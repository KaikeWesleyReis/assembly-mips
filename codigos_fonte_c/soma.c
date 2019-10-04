#include <stdio.h>

float soma(float a, float b) {
  return ((a+b)*1.34);
}

int main() {
  float x, y;
  float res;

  printf("Informe o primeiro numero: ");
  scanf("%f", &x);
  printf("Informe o segundo numero: ");
  scanf("%f", &y);
  res = soma(x,y);
  if (res > 6.5)
     printf("Soma: %.2f\n", res);
  else
    printf("Resultado descartado!\n");
  getch();
  return 0;
}
