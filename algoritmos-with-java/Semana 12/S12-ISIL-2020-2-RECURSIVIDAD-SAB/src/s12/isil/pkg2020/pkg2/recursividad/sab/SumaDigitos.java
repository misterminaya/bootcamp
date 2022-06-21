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
public class SumaDigitos {
    
    public int sumaDigitos(int numero){
    
        if (numero<10) {
           return numero; 
        } else {
            return numero%10 + sumaDigitos(numero/10);
                                  
        } 
    }
    
}
