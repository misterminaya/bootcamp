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
public class S12ISIL20202RECURSIVIDADSAB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
//        //Suma de N numeros naturales
//        SumaNNumeros sumaNNumeros = new SumaNNumeros();
//        int sumaN =  sumaNNumeros.sumaNNumerosNaturales(10);
//        System.out.println("La suma de los n numeros naturales es :"+sumaN);
//        //Probando el factorial de un numero
//        
//        FactorialNumero factorialNumero = new FactorialNumero();
//        
//        int factorial = factorialNumero.factorialNumero(4);
//        
//        System.out.println("El factorial de un numero es :"+factorial);
//        
//        //Probando el suma digitos
//        
//        SumaDigitos sumaDigitos = new SumaDigitos();
//        int suma = sumaDigitos.sumaDigitos(555);
//        System.out.println("La suma de los digitos es :"+suma);
        
        //Probando encontrar elemento en el Arreglo
        int numeros[] = {5,6,8,9,4,10,12,16,23,21};
        ElementoArray elementoArray = new ElementoArray();
        int indice = elementoArray.posicionElemento(numeros,132,0);
        
        if (indice>=0) {
            System.out.println("El elemento se encuentra en la posicion :"+indice);
        } else {
            System.out.println("El elemento no se encuentra en el arreglo");
        }
        
        //Implementando la matriz recursiva
        
        int numerosMatriz[][]={{4,5,6,7},{2,1,3,4},{3,2,6,3},{4,2,1,4}};
        
        MatrizRecursiva matrizRecursiva = new MatrizRecursiva();
        System.out.println("Matriz Recursiva");
        matrizRecursiva.recorreMatriz(numerosMatriz, 0, 0);
        System.out.println("");
        //Validando el algoritmo de la torre de Hanoi
        System.out.println("Torre de Hanoi");
        TorreHanoi torreHanoi = new TorreHanoi();
        
        torreHanoi.torreHanoi(4, 1,2,3);
        
        
        
    }
    
}
