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
public class Cola {

    private Nodo inicio;
    private Nodo fin;

    //Constructor para inicializar las variables
    public Cola() {
        inicio = null;
        fin = null;
    }
    //Proceso para ver si la cola esta vácia
    public Boolean isEmpty(){
        return inicio==null;
    }
    
    //Método para agregar elementos a la cola offer
    public void offer(String nombre){
        Nodo nodo = new Nodo();
        nodo.nombre=nombre;
        nodo.siguiente=null;
        
        if (isEmpty()) {
              inicio=nodo;
              fin = nodo;
        } else {
            fin.siguiente = nodo;
            fin = nodo;
        }
    }
    
    //Metodo para remover el primer elemento de la cola
    public String poll(){
        if (!isEmpty()) {
            String nombre =  inicio.nombre;
            if (inicio==fin) {
                inicio=null;
                fin =  null;
            } else {
                inicio = inicio.siguiente;
            }
            return nombre;
        } else {
           return "La cola se encuentra vacía";
        }
    }
    //Metodo para devolver el primer elemento
    public String peek(){ 
        if (!isEmpty()) {
            return inicio.nombre;
        } else {
           return "La cola esta vacía"; 
        } 
    }
    //Proceso para imprimir los elementos de la cola
    public void print(){
    
        Nodo nodoAux = inicio;     
        String elementos = "";
        
        while (nodoAux!=null) {            
            elementos = elementos + nodoAux.nombre + " ";
            nodoAux = nodoAux.siguiente;
        }
        
        System.out.println("Los valores de la cola son:");
        System.out.println("Valores :"+elementos);
    
    
    }
    
    
    
}
