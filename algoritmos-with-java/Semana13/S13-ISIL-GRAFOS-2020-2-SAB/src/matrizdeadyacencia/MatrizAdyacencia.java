/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package matrizdeadyacencia;

/**
 *
 * @author User
 */
public class MatrizAdyacencia {

    private int n;
    private Integer[][] matriz;

    public MatrizAdyacencia(int n) {
        this.n = n;
        matriz = new Integer[this.n][this.n];
        inicializarMatriz();
    }

    public void inicializarMatriz(){
        for (int f = 0; f < matriz.length; f++) {
            for (int c = 0; c < matriz[0].length; c++) {
                matriz[f][c]=0;
            }
        }
    }
    
    
    
     
    public void imprimir(){
        for (int f = 0; f < matriz.length; f++) {
            for (int c = 0; c < matriz[0].length; c++) {
                System.out.print(matriz[f][c]+" ");
            }
            System.out.println("");
        }
    }
    
    
}
