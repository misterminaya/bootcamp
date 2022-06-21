/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pilaobjetos;

/**
 *
 * @author User
 */
public class Pila {
    
    //Definiendo las variables de la pila 

    private Alumno alumnos[];
    private int cantidadDeElementos;
    private int cima;
    //Definiendo una pila a tráves del constructor     

    public Pila(int cantidadDeElementos) {
        this.cantidadDeElementos = cantidadDeElementos;
        alumnos = new Alumno[cantidadDeElementos];
        cima = 0;
    }
    //Verificar si la pila se encuentra vacia

    public boolean isEmpty() {
        boolean resultFlag = false;
        if (cima == 0) {
            resultFlag = true;
        }
        return resultFlag;
    }

    public boolean isEmpty1() {
        boolean resultFlag = false;
        if (alumnos[cima] == null) {
            resultFlag = true;
        }
        return resultFlag;
    }

    //AGREGAR ELEMENTOS A LA PILA    
    public void push(Alumno dato) {
        if (cima < cantidadDeElementos) {
            alumnos[cima] = dato;
            cima++;
        } else {
            System.out.println("La pila ya se encuentra llena");
        }
    }

    //TRAER EL ELEMENTO QUE SE ENCUETRA EN LA CIMA
    public Alumno peek() {
        if (cima == 0) {
            System.out.println("No hay datos en la pila");
            return null;
        } else {
            return alumnos[cima - 1];
        }
    }
    //RETIRAR EL ELEMENTO QUE ESTA EN LA CIMA
    public void pop() {
        if (cima == 0) {
            System.out.println("La pila se encuentra vacía");
        } else {
            alumnos[cima - 1] = null;
            cima--;
        }
    }
    //RETORNAR LOS ELEMENTOS DE LA PILA
    public Alumno[] elementosPila(){
        if (cima!=0) {
            return alumnos;
        } else {
            return null;
        }
    }
    //IMPRIMIR LOS ELEMETOS DE LA PILA
    public void imprimir(){
        if(cima>0){
            for (Alumno alumno : alumnos) {
                System.out.println(""+alumno);
            }
        }
        else{
            System.out.println("No hay elementos en la pila");
        }
    }
    
}
