/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplo2;

import java.util.LinkedList;
import java.util.Queue;

/**
 *
 * @author User
 */
public class Cola {

    private Queue<String> cola;

    public Cola() {
        cola = new LinkedList();
    }

    //Metodo para validar si se encuentra vacio
    public Boolean isEmpty() {
        return cola.isEmpty();
    }
    //Metodo para agregar elementos a la cola

    public Boolean offer(String nombre) {
        return cola.offer(nombre);
    }

    //Metodo para remover elementos de la cola
    public String poll() {
        return cola.poll();
    }

    //Devolver el primer elemento  de la cola
    public String peek(){
    return cola.peek();
    }
    
    //Imprimir los datos
    public void print(){
        System.out.println("Los elementos de la pila son :");
        for (String string : cola) {
            System.out.println("Elemento :"+string);
        }
    }
    
    
}
