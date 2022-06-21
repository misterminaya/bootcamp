/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplos;

/**
 *
 * @author User
 */
public class Test {
    public static void main(String[] args) {

        
        Cola cola = new Cola();
        
        //La cola esta vacia
        System.out.println("La cola esta vacia :"+cola.isEmpty());   
        //Agregar elementos a la cola
        cola.offer("Juan Carlos");
        cola.offer("Marcos");
        System.out.println("La cola esta vacia :"+cola.isEmpty());
        System.out.println("Imprimiendo los elementos de la cola");
        cola.print();
        System.out.println("El primer lemento de la cola :"+cola.peek());
        System.out.println("Eliminar el primer elemento de la cola");
        cola.poll();
        System.out.println("El primer elemento de la cola :"+cola.peek());
        System.out.println("Los elementos de la cola son:");
        cola.print();
        
    }
}
