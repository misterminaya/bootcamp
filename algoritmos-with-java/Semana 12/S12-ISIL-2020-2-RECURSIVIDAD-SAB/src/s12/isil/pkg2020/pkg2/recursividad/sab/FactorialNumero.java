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
public class FactorialNumero {
    
    public int factorialNumero(int numero){
                    
        if (numero==0) {
           return 1; 
        } else {
           return numero*factorialNumero(numero-1);
        }
    
    
    }
    
}
