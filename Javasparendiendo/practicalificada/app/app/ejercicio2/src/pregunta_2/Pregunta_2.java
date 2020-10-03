/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pregunta_2;

/**
 *
 * @author USUARIO
 */
public class Pregunta_2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        
        Directivo D1 = new Directivo("Mario");
        System.out.println(D1);
        
        Operario OP1 = new Operario("Alfonso");
        System.out.println(OP1);
        
        Oficial OF1 = new Oficial("Luis");
        System.out.println(OF1);
        
        Tecnico T1 = new Tecnico("Pablo");
        System.out.println(T1);
    }
    
}
