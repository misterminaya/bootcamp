/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pilanumeros;

/**
 *
 * @author User
 */
public class Test {
    
    static public void main(String[] args) {
        
        Pila pila = new Pila(2);
        //VALIDANDO LA PILA SE ENCUENTRA VACIA
        System.out.println("Pila vacia :"+pila.isEmpty());
        System.out.println("Pila vacia 1:"+pila.isEmpty1());
        Double valor = pila.peek();
        //INGRESANDO LAS TALLAS DE LAS PERSONAS
        pila.push(1.75);
        pila.push(1.80);
        
        //RECUPERANDO EL VALOR DE LA CIMA
        System.out.println("Recuperando el elemento que esta en la cima");
        Double cima = pila.peek();
        System.out.println("La cima es :"+cima);
        
        //ELIMINANDO EL ELEMENTO EL ELEMENTO QUE ESTA EN LA CIMA
        System.out.println("Eliminando el elemento que esta en la cima");
        //pila.pop();
        pila.peek();
        
        //IMPRIMIENDO LOS VALORES DE LA PILA
        System.out.println("Imprimiendo los valores de la cima");
        pila.imprimir();
        
    }
    
}
