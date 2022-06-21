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
public class ElementoArray {
    
    
    public int posicionElemento(int [] arreglo, int numeroABuscar, int indice){
    
        if (arreglo.length==indice || arreglo[indice]==numeroABuscar) {          
            if (arreglo.length==indice) {
               return -1;
            } else {
               return indice;
            }
            
        } else {
          return  posicionElemento(arreglo, numeroABuscar, indice+1);
        }
    
        
    
    
    }
    
    
    
}
