#include <stdio.h>
#define PI 3.14159

//OBJETIVO - CHAMAR FUNCAO. CALCULAR AREA DO CIRCULO. RETORNAR

float AreaCirc(float R){
  float area;
  area=PI*R*R;
  return area; 
} 


main(){
  float raio;
  printf("Digite o valor do raio do circulo, e ENTER\n");
  scanf("%f", &raio); // exemplos: 1.23 12.3e-1
  // a seguir mostra na tela o valor do raio lido
  // usando 12 colunas, e 2 decimais arredondados
  // por ex. 1.576 e' arredondado para 1.58, so' na tela
  printf("Raio digitado e' %12.2f\n", raio);
  printf("Area do circulo com raio %f e' %f\n", raio, AreaCirc(raio));
  getch();
}
