#include <stdio.h> // biblioteca standard de I/O
#define PI 3.14159 // constante PI
// a seguir a funcao AreaCirc
float AreaCirc(float R){ // cabecalho da funcao, parametro R
  float area; // variavel so' existe dentro da funcao, local

  area=PI*R*R;
  return area; // retorna para main o valor area, do tipo float (único valor)
} // fim da funcao AreaCirc

// a seguir a funcao main()
main(){
  float raio; // declaracao
  // mostra na tela uma mensagem com printf
  printf("Digite o valor do raio do circulo, e ENTER\n");
  // le do teclado com scanf; note o & em &raio
  scanf("%f", &raio); // exemplos: 1.23 12.3e-1
  // a seguir mostra na tela o valor do raio lido
  // usando 12 colunas, e 2 decimais arredondados
  // por ex. 1.576 e' arredondado para 1.58, so' na tela
  printf("Raio digitado e' %12.2f\n", raio);
  // a seguir, main recebe de AreaCirc o valor da area
  printf("Area do circulo com raio %f e' %f\n", raio, AreaCirc(raio)); // chamada da funcao
  getch();
} // fim main
