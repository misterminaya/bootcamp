/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package s12.isil.pkg2020.pkg2.recursividad.sab;

/**
 *
 * @author User
 */
public class MatrizRecursiva {
    
    public void recorreMatriz(int matriz[][],int f,int c){
        System.out.print(matriz[f][c]+"  ");     
        if (f!=matriz.length-1 || c !=matriz[f].length-1 ) {
            //Indicar si llego al final de la fila
            if(c==matriz[f].length-1){
            //Pasar a la siguiente fila
            f++;
            //Reiniciar el valor c
            c=0;
            //Salto de linea
             System.out.println("");
            }
            else{
            //Paso a la siguiente columna    
            c++;
            }
            //Volvemos a llamar a la funcion de manera recursiva
            recorreMatriz(matriz, f, c);
        } 
    
    }
    
}
