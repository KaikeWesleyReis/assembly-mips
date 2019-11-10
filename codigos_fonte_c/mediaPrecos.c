#include <stdio.h>

//OBJETIVO - CHAMAR FUNCAO. CALCULAR PRECO. RETORNAR

#define TAM 10  // tamanho do vetor
int precos[TAM]; // vetor global de precos

//  Funcao mediaPrecos
// Entrada: nenhuma - usa vetor global
// saida: media dos precos
float mediaPrecos() {
  int i, soma=0;

  for (i=0; i<TAM; i++) {
    soma += precos[i];
  }
  return (soma/TAM);
}
// Funcao principal
int main() {
 int i;
 float precoMedio;

 for (i=0; i<TAM; i++) {
   printf("Informe o preco do produto %d: ", i);
   scanf("%d", &precos[i]);
 }

 precoMedio = mediaPrecos();
 printf("Preco medio dos produtos: %.2f\n", precoMedio);
 return 0;
}
