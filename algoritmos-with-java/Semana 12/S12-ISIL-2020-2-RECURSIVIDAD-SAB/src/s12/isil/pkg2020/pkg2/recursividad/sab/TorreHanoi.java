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
public class TorreHanoi {
    
    public void torreHanoi(int aros,int torreInicial,int torreTemporal, int torreFinal){
    
        if (aros ==1) {
            System.out.println("Moviendo de la torre de inicio "+torreInicial+ " a la torre de destino : "+torreFinal);
        } else {
        
            torreHanoi(aros-1, torreInicial, torreFinal, torreTemporal);
            System.out.println("Moviendo de la torre de inicio "+torreInicial+" a la torre de destino : "+torreFinal);
            torreHanoi(aros-1, torreTemporal, torreInicial, torreFinal);

        }
        
        
    }
    
    
}
