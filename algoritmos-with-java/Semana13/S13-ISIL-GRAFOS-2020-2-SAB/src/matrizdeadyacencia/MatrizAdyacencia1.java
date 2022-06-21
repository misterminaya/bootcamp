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
public class MatrizAdyacencia1 {
     private int n;
    private int[][] matriz;

    public MatrizAdyacencia1(int n) {
        this.n = n;
        matriz = new int[this.n][this.n];
    }
   
    public void agregar(int fila, int columna){
        matriz[fila][columna]+=1;
    }
    
    public void eliminar(int fila, int columna){
       if(matriz[fila][columna]>0)
        matriz[fila][columna]-=1;
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
