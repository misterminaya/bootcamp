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
public class SumaNNumeros {
    
    
    public int sumaNNumerosNaturales(int numero){   
        if (numero==1) {
            return 1;
        } else {
            return numero + sumaNNumerosNaturales(numero-1);
        } 
    }
    
    
    
}
