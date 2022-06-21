/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplo2;

/**
 *
 * @author User
 */
public class Test {
    public static void main(String[] args) {
        
        Cola cola = new Cola();
        System.out.println("La cola esta vacia :"+cola.isEmpty());
        
        System.out.println("Agregando elementos a la cola");
        cola.offer("Carlos");
        
        System.out.println("La cola esta vacia :"+cola.isEmpty());
        
        
    }
    
}
