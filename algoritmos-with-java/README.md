

En una empresa trabajan n empleados cuyos sueldos oscilan entre $100 y $500,
realizar un programa que lea los sueldos que cobra cada empleado
e informe cuántos empleados cobran entre $100 y $300 y cuántos
cobran más de $300. Además el programa deberá informar el importe que gasta
la empresa en sueldos al personal.

```java
import java.util.Scanner;

/**
 *
 * @author User
 */
public class Reto2 {

    public static void main(String[] args) {

        Scanner teclado = new Scanner(System.in);

        int con2 = 0;
        int con1 = 0;
        int emp;
        int cont = 1;
        int sueldo;
        int totsuel = 0;
        System.out.println("Ingresar numero de empleados: ");
        emp = teclado.nextInt();
        while (cont <= emp) {
            System.out.println("Ingresar el sueldo del empleado " + cont + " entre 100 y 500");
            sueldo = teclado.nextInt();
            if (sueldo >= 100 && sueldo <= 300) {
                con1++;
            } else if (sueldo > 300 && sueldo <= 500) {
                con2++;
            }
            totsuel = totsuel + sueldo;
            cont++;
        }
        System.out.println("la cantidad de empleados que gana entre 100 y 300 es: " + con1);
        System.out.println("la cantidad de empleados que gana entre 300 y 500 es: " + con2);
        System.out.println("el total que invierte la empresa en los sueldos es: " + totsuel);

    }

}

```

ejercicio 2 

```java
import java.util.Scanner;

/**
 * Realizar un programa que permita cargar dos listas de 10 valores cada una.
 * Informar con un mensaje cual de las dos listas tiene un valor acumulado mayor
 * (mensajes "Lista 1 mayor", "Lista 2 mayor", "Listas iguales") Tener en cuenta
 * que puede haber dos o más estructuras repetitivas en un algoritmo.  *
 */
public class S01ISIL20202Repaso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Permiter ingresar datos atráves del teclado
        Scanner teclado = new Scanner(System.in);
        // Trabajando con la estructura While
        int contador = 1;
        int numero;
        int valorAcumuladoLista1 = 0;
        int valorAcumuladoLista2 = 0;
        System.out.println("Ingresar los valores de la lista 1");
        while (contador <= 10) {
            System.out.println("Ingresa el numero :" + contador);
            numero = teclado.nextInt();
            valorAcumuladoLista1 += numero;
            contador++;
        }
        contador=1;
        System.out.println("Ingresar los valores de la lista 2");
        while (contador <= 10) {
            System.out.println("Ingresa el numero :" + contador);
            numero = teclado.nextInt();
            valorAcumuladoLista2 += numero;
            contador++;
        }

        if(valorAcumuladoLista1>valorAcumuladoLista2){
            System.out.println("La lista1 tiene el mayor valor acumulado");
            System.out.println("El valor acumulado es :"+valorAcumuladoLista1);
        }
        else{
            System.out.println("La lista2 tiene el mayor valor acumulado");
            System.out.println("El valor acumulado es :"+valorAcumuladoLista2);
        }

    }

}
```




Se desea guardar los sueldos de 10 operarios,
luego deberá de imprimir todos los sueldos ingresados.

```java
import java.util.Scanner;

/**
 *
 * @author User
 */
public class Reto1 {

    public static void main(String[] args) {

        Scanner teclado = new Scanner(System.in);

        double sueldos[] = new double[10];

        //CICLO PARA INGRESAR LOS DATOS
        System.out.println("Ingresar los sueldos de los 10 operarios");
        for (int i = 0; i < 10; i++) {
            System.out.println("Ingresar el sueldo :"+(i+1));
            sueldos[i]=teclado.nextDouble();
        }
        //CICLO PARA IMPRIMIR LOS DATOS
        System.out.println("Los sueldos ingresados son :");
        for (int i = 0; i < 10; i++) {
            System.out.println(""+sueldos[i]);
        }
    }
}
```

Definir un vector de 5 componentes de tipo double que representen
las alturas de 5 personas.
Las aluras deben encontrarse en el rango de 1.60 y 1.85 cm,
de lo contrarito volver a solicitar la altura.
Obtener el promedio de las mismas.
Contar cuántas personas son más altas
que el promedio y cuántas más bajas.

```java
import java.util.Scanner;

/**
 *
 * @author User
 */
public class Reto2 {

    public static void main(String[] args) {

        Scanner teclado = new Scanner(System.in);
        double suma=0,promedio;
        int  mayoresPromedio=0, menoresPromedio=0;
        double alturas[]= new double[5];
        double altura;
//        int edad;
//        String nombre;
        System.out.println("Ingresar las alturas de los usuarios");
        boolean resultadoFlag;

        for (int i = 0; i < 5; i++) {
            resultadoFlag=false;
            //Estructura para controlar el rango de valores
            do {
                System.out.println("Ingresar la altura número :"+i);
                altura = teclado.nextDouble();
//                edad = teclado.nextInt();
//                nombre = teclado.nextLine();
                if (altura>=1.60 && altura<=1.85) {
                    alturas[i]=altura;
                    resultadoFlag=true;
                } else {
                    System.out.println("Deberá de ingresar una altura en el siguiente rango:");
                    System.out.println("1.60 y 1.85");
                }
            } while (resultadoFlag==false);
        }
        // Obteniendo el promedio
        for (int i = 0; i < 5; i++) {
            suma = suma+alturas[i];
        }
        promedio = suma/5;

        //Calculando cuantos son mayores al promedio y cuantos son menores
        for (int i = 0; i < 10; i++) {
            if (alturas[i]>promedio) {
                mayoresPromedio++;
            } else {
                menoresPromedio++;
            }
        }
        System.out.println("El promedio de las alturas es :"+promedio);
        System.out.println("Alturas mas altas que el promedio :"+mayoresPromedio);
        System.out.println("Alturas menores que el promedio :"+menoresPromedio);


    }

}

```

Una empresa tiene dos turnos (mañana y tarde) en los que trabajan
8 empleados (4 por la mañana y 4 por la tarde)
Confeccionar un programa que permita almacenar los sueldos de los empleados
agrupados por turno.Imprimir los gastos en sueldos de cada turno.
Y obtener los sueldos mas altos y mas bajos de cada turno.

* Los sueldos no pueden exceder los S/. 10000 ni deben ser menores a S/. 5000.

```java
import java.util.Scanner;

public class Reto3 {

    public static void main(String[] args) {

        Scanner teclado = new Scanner(System.in);

        double sueldosMañana[]= new double[4];
        double sueldosTarde[]= new double[4];
        double gastoSueldosMañana=0;
        double gastoSueldosTarde=0;
        double sueldoMasAltoMañana,sueldoMasBajoMañana;
        boolean resultaFlag;
        double sueldo;

        System.out.println("Ingresar sueldos del turno mañana");
        for (int i = 0; i < 4; i++) {
            resultaFlag=false;
            do {
                sueldo = teclado.nextDouble();
                if (sueldo>=5000 && sueldo<=10000) {
                    sueldosMañana[i]=sueldo;
                    gastoSueldosMañana+=sueldo;
                    resultaFlag=true;
                } else {
                    System.out.println("Deberá de ingresar un sueldo en el siguiente rango");
                    System.out.println("5000 y 10000");
                }
            } while (resultaFlag==false);
        }
//        System.out.println("Ingresar sueldos del turno tarde");
//        for (int i = 0; i < 4; i++) {
//            resultaFlag=false;
//            do {                
//               sueldo = teclado.nextDouble();
//                if (sueldo>=5000 && sueldo<=10000) {
//                    sueldosTarde[i]=sueldo;
//                    gastoSueldosTarde+=sueldo;
//                    resultaFlag=true;
//                } else {
//                    System.out.println("Deberá de ingresar un sueldo en el siguiente rango");
//                    System.out.println("5000 y 10000");
//                }      
//            } while (resultaFlag==false);
//        }

        //Calculando el sueldo mas alto;
        sueldoMasAltoMañana=0;
        for (int i = 0; i < 4; i++) {
            if (sueldoMasAltoMañana<sueldosMañana[i]) {
                sueldoMasAltoMañana=sueldosMañana[i];
            }
        }
        //Calculando el sueldo mas bajo;
        sueldoMasBajoMañana=300000;
        for (int i = 0; i < 4; i++) {
            if (sueldosMañana[i]<sueldoMasBajoMañana) {
                sueldoMasBajoMañana=sueldosMañana[i];
            }
        }
        System.out.println("El gasto total es :"+gastoSueldosMañana);
        System.out.println("El sueldo mas bajo es :"+sueldoMasBajoMañana);
        System.out.println("El sueldo mas alto es :"+sueldoMasAltoMañana);

    }

}

```

Ordenamiento y Búsqueda

```java
import java.util.Scanner;
import java.util.Vector;

/**
 *
 * @author User
 */
public class Problema1 {
    
    
    public static void main(String[] args) {
        
        Scanner teclado =  new Scanner(System.in);
        int tamañoArreglo;   
        double valorAcumulado=0;
        double valorAcumuladoMayor36=0;
        double cantidadValoresMayor50=0;
        double numeros[];
        double numeroABuscar;
        
        System.out.println("Ingrese la cantidad de elementos a procesar");
        tamañoArreglo = teclado.nextInt(); 
        numeros = new double[tamañoArreglo]; //5
        for (int i = 0; i < numeros.length  ; i++) {
            System.out.println("Ingresa el valor numero :"+(i+1));
            numeros[i]=teclado.nextDouble();
        }
        for (int i = 0; i < numeros.length; i++) {
            valorAcumulado += numeros[i];  
        }
        for (int i = 0; i < numeros.length; i++) {
            if(numeros[i]>36){
            valorAcumuladoMayor36+=numeros[i];
            }
        }
        for (int i = 0; i <numeros.length; i++) {
            if(numeros[i]>50){
             cantidadValoresMayor50++;
            }
        }
        //Cual es el número mayor en el arreglo
         for (int j = 0; j < numeros.length-1; j++) {
                double auxiliar;
                if(numeros[j]>numeros[j+1]){
                   auxiliar = numeros[j];
                   numeros[j]=numeros[j+1];
                   numeros[j+1]=auxiliar;
                }
            }
        //Ordenar el arreglo
        for (int i = 0; i < numeros.length; i++) {
            for (int j = 0; j < numeros.length-1-i; j++) {
                double auxiliar;
                if(numeros[j]>numeros[j+1]){
                   auxiliar = numeros[j];
                   numeros[j]=numeros[j+1];
                   numeros[j+1]=auxiliar;
                }
            }
        }
        
        //Algoritmo de Busqueda Secuencial
        System.out.println("Ingresa el número a buscar");
        numeroABuscar = teclado.nextDouble();
        //Algoritmo de busqueda secuencial
        for (int i = 0; i < numeros.length; i++) {     
            if(numeroABuscar==numeros[i]){
                System.out.println("Se encontro el número en la posición :"+i);
                break;
            }         
        }
        
        //Algoritmo de busqueda binaria
        //Definiendo variables auxiliares
        //Indices y/o posiciones
        int inicio=0;
        int fin = numeros.length-1;
        int centro = (inicio+fin)/2;
        //Valores almacenados en el arreglo
        double valorCentro = numeros[centro];
        
        while(fin>=inicio){  
            if (valorCentro==numeroABuscar) {
                System.out.println("Se encontro el numero en la posición :"+centro);
                break;
            } else {
                if (numeroABuscar>valorCentro) {
                    inicio=centro+1;
                    centro=(inicio+fin)/2;
                    valorCentro= numeros[centro];
                } else {
                    fin = centro-1;
                    centro=(inicio+fin)/2;
                    valorCentro= numeros[centro];                
                }
            }

        }
     
        System.out.println("El valor acumulado es :"+valorAcumulado);
        System.out.println("El valor acumulado mayor a 36 es :"+valorAcumuladoMayor36);
        System.out.println("La cantidad de valores mayores a 50"+cantidadValoresMayor50);
    }
    
    
}

```

ejercicio 2 de ordenamiento

Cargar en un vector los nombres de 4 continentes y
en otro vector paralelo la cantidad de habitantes del mismo.
Ordenar alfabéticamente e imprimir los resultados. 7
Por último ordenar con respecto a la cantidad de habitantes
(de mayor a menor) e imprimir nuevamente.

```java
package ejercicios;

/**
 *
 * @author User
 */
public class Ejemplo3 {

    public static void main(String[] args) {

        String continentes[]= {"America","Oceania","Europa","Asia"};
        double poblaciones[]={500,200,600,1200};

        //Ordenando los vectores alfabeticamente
        for (int i = 0; i < continentes.length; i++) {
            for (int j = 0; j < continentes.length-i-1; j++) {
                String auxNombre;
                double auxPoblacion;
                if (continentes[j].compareToIgnoreCase(continentes[j+1])>0) {
                    auxNombre=continentes[j];
                    continentes[j]=continentes[j+1];
                    continentes[j+1]=auxNombre;

                    auxPoblacion = poblaciones[j];
                    poblaciones[j]=poblaciones[j+1];
                    poblaciones[j+1]=auxPoblacion;
                }
            }
        }

        System.out.println("Imprimiendo los valores ordenados");
        for (int i = 0; i < continentes.length; i++) {
            System.out.println("Continente :"+continentes[i]+" Poblacion :"+poblaciones[i]);
        }


    }

}

```

ejemplo 2 con caracteres


```java
package ejercicios;

/**
 *
 * @author User
 */
public class EjemploCaracteres {

    public static void main(String[] args) {

        String nombre1="Anghelo"; //70
        String nombre2="Fiorella";//80

        //Mostrarlos de forma ascendente
        int valor = nombre1.compareToIgnoreCase(nombre2);
        System.out.println("Imprimir valor :"+valor);
        if (nombre1.compareToIgnoreCase(nombre2)<0) {
            System.out.println("Los nombres ordenados son :");
            System.out.println(""+nombre1);
            System.out.println(""+nombre2);

        } else {
            System.out.println("Los nombres ordenados son :");
            System.out.println(""+nombre2);
            System.out.println(""+nombre1);
        }


    }

}

```


ejemplo con caracteres 3 

```java
package ejercicios;

/**
 *
 * @author User
 */
public class EjemploCaracteres2 {
    public static void main(String[] args) {
        
        String nombres[] = {"Sebastian","Juan Carlos","Aldair","Fiorella"};
        
        //Ordenar la lista de forma alfábetica
        
        for (int i = 0; i <nombres.length; i++) {
            for (int j = 0; j < nombres.length-1-i; j++) { 
                String aux;
                if (nombres[j].compareToIgnoreCase(nombres[j+1])>0) {
                    aux = nombres[j];
                    nombres[j]=nombres[j+1];
                    nombres[j+1]= aux;
                }
            }
        }
        
        System.out.println("Imprimir vector ordenado");
        for (int i = 0; i < nombres.length; i++) {
            System.out.println("-"+nombres[i]);
        }
        
    }
    
}

```

Matrices 

```java
package s05.isil.pkg2020.pkg2.matrices;

/**
 *
 * @author User
 */
public class MatrizDiagonal {

    public static void main(String[] args) {

        // Generar una matriz escalar  de 5X5 donde los elemento
        // de la diagonal principal son iguales a 7
        int matriz[][] = new int[5][5];

        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[0].length; j++) {
                if (i == j) {
                    matriz[i][j] = 7;
                } else {
                    matriz[i][j] = 0;
                }
            }
        }
        // IMPRESION DE LOS ELEMENTOS DE LA MATRIZ POR FILAS
        System.out.println("Los valores de la MATRIZ por fila-columna son :");
        for (int f = 0; f < matriz.length; f++) {
            for (int c = 0; c < matriz[0].length; c++) {
                if (c == matriz[0].length - 1) {
                    System.out.println(matriz[f][c]);
                } else {
                    System.out.print(matriz[f][c] + "-");
                }
            }
            System.out.println("");
        }

    }
}

```

matrices ejemplo 2 

```python
package s05.isil.pkg2020.pkg2.matrices;

import java.util.Scanner;

/**
 *
 * @author User
 */
public class S05ISIL20202MATRICES {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Variable Scanner
        Scanner teclado = new Scanner(System.in);
        //DEFINIENDO LA MATRIZ
        int edades[][] = new int[3][4];
        //INGRESAR DATOS A LA MATRIZ
        for (int f = 0; f < edades.length; f++) {
            for (int c = 0; c < edades[0].length; c++) {
                System.out.println("Ingresa el valor de la fila " + f + " la columna :" + c);
                edades[f][c] = teclado.nextInt();
            }
        }

        // IMPRESION DE LOS ELEMENTOS DE LA MATRIZ POR FILAS
        System.out.println("Los valores de la MATRIZ por fila-columna son :");
        for (int f = 0; f < edades.length; f++) {
            for (int c = 0; c < edades[0].length; c++) {
                if (c == edades[0].length - 1) {
                    System.out.println(edades[f][c]);
                } else {
                    System.out.print(edades[f][c] + "-");
                }
            }
            System.out.println("");
        }
        //IMPRESION DE LOS ELEMENTOS DE LA MATRIZ POR COLUMNAS
        System.out.println("Los valores de la MATRIZ por columna-fila son");
        for (int c = 0; c < edades[0].length; c++) {
            for (int f = 0; f < edades.length; f++) {
                if (f == edades.length - 1) {
                    System.out.print(edades[f][c]);
                } else {
                    System.out.print(edades[f][c] + "-");
                }
            }
            System.out.println("");
        }
        //ALGORITMO PARA LA BUSQUEDA DE UN ELEMENTO EN LA MATRIZ
        int edad = 30;

        for (int f = 0; f < edades.length; f++) {
            for (int c = 0; c < edades[0].length; c++) {
                if (edades[f][c] == edad) {
                    System.out.println("Se encontro el valor en la fila : " + f + " La columna: " + c);
                    break;
                }
            }
        }

        //ALGORITMO DE ORDENAMIENTO DE FORMA ASCENDENTE
        for (int i = 0; i < edades.length; i++) {
            for (int j = 0; j < edades[0].length; j++) {
                for (int k = 0; k < edades.length; k++) {
                    for (int l = 0; l < edades[0].length; l++) {
                        int auxiliar;
                        if (edades[i][j] < edades[k][l]) {
                            auxiliar = edades[i][j];
                            edades[i][j] = edades[k][l];
                            edades[k][l] = auxiliar;
                        }
                    }
                }
            }
        }

        System.out.println("Los valores de la MATRIZ por fila-columna son :");
        for (int f = 0; f < edades.length; f++) {
            for (int c = 0; c < edades[0].length; c++) {
                if (c == edades[0].length - 1) {
                    System.out.println(edades[f][c]);
                } else {
                    System.out.print(edades[f][c] + "-");
                }
            }
            System.out.println("");
        }

    }

}
```

matrices 3 

```java
package s05.isil.pkg2020.pkg2.matrices;

import java.util.Scanner;

/**
 *
 * @author User
 */
public class S05ISIL20202MATRICES1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Variable Scanner
//        Scanner teclado = new Scanner(System.in);
        //DEFINIENDO LA MATRIZ CON VALORES ESTATICOS
        int edades[][] = {{43,32,33,45},{23,43,34,25},{23,52,23,32}};
        //INGRESAR DATOS A LA MATRIZ
//        for (int f = 0; f < edades.length; f++) {
//            for (int c = 0; c < edades[0].length; c++) {
//                System.out.println("Ingresa el valor de la fila " + f + " la columna :" + c);
//                edades[f][c] = teclado.nextInt();
//            }
//        }

        // IMPRESION DE LOS ELEMENTOS DE LA MATRIZ POR FILAS
        System.out.println("Los valores de la MATRIZ por fila-columna son :");
        for (int f = 0; f < edades.length; f++) {
            for (int c = 0; c < edades[0].length; c++) {
                if (c == edades[0].length - 1) {
                    System.out.println(edades[f][c]);
                } else {
                    System.out.print(edades[f][c] + "-");
                }
            }
            System.out.println("");
        }
        //IMPRESION DE LOS ELEMENTOS DE LA MATRIZ POR COLUMNAS
        System.out.println("Los valores de la MATRIZ por columna-fila son");
        for (int c = 0; c < edades[0].length; c++) {
            for (int f = 0; f < edades.length; f++) {
                if (f == edades.length - 1) {
                    System.out.print(edades[f][c]);
                } else {
                    System.out.print(edades[f][c] + "-");
                }
            }
            System.out.println("");
        }
        //ALGORITMO PARA LA BUSQUEDA DE UN ELEMENTO EN LA MATRIZ
        int edad = 30;

        for (int f = 0; f < edades.length; f++) {
            for (int c = 0; c < edades[0].length; c++) {
                if (edades[f][c] == edad) {
                    System.out.println("Se encontro el valor en la fila : " + f + " La columna: " + c);
                    break;
                }
            }
        }

        //ALGORITMO DE ORDENAMIENTO DE FORMA ASCENDENTE
        for (int i = 0; i < edades.length; i++) {
            for (int j = 0; j < edades[0].length; j++) {
                for (int k = 0; k < edades.length; k++) {
                    for (int l = 0; l < edades[0].length; l++) {
                        int auxiliar;
                        if (edades[i][j] < edades[k][l]) {
                            auxiliar = edades[i][j];
                            edades[i][j] = edades[k][l];
                            edades[k][l] = auxiliar;
                        }
                    }
                }
            }
        }

        System.out.println("Los valores de la MATRIZ por fila-columna son :");
        for (int f = 0; f < edades.length; f++) {
            for (int c = 0; c < edades[0].length; c++) {
                if (c == edades[0].length - 1) {
                    System.out.println(edades[f][c]);
                } else {
                    System.out.print(edades[f][c] + "-");
                }
            }
            System.out.println("");
        }

    }

}
```

Listas enlazadas

```java
public class ListaEnlazada {

    private Nodo inicio;
    private int size;
    //Constructor para inicializar las variables
    public ListaEnlazada() {
        this.inicio = null;
        size = 0;
    }
    //Metodo para validar si la lista enlazada se encuentra vacía

    public Boolean estaVacia(){
        Boolean  resultFlag = false;
        if(inicio ==null){
            resultFlag = true;
        }
        return resultFlag;
    }

    //Metodo agregar un elemento al inicio de la lista enlazada
    public void agregarInicio(Double dato){
        if (inicio==null) {
            inicio = new Nodo(dato);
        } else {
            Nodo aux = inicio;
            Nodo nuevoNodo = new Nodo(dato);
            nuevoNodo.enlazarSiguiente(aux);
            inicio = nuevoNodo;
        }
        size++;
    }
    //Metodo para agregar un elemento al final de la lista

    public void addFinal(Double dato){
        Nodo auxiliar = inicio;
        if(size == 0){
            agregarInicio(dato);
        }
        else{
            for (int i = 0; i < size; i++) {
                if (i == size-1) {
                    Nodo nuevo  = new Nodo(dato);
                    auxiliar.enlazarSiguiente(nuevo);
                    size++;
                    break;
                } else {
                    auxiliar = auxiliar.obtenerSiguiente();
                }
            }
        }
    }

    //Metodo para obtener el valor almacenado pasandole el índice
    public double obtenerValor(int indice){

        int contador = 0;
        Nodo auxiliar = inicio;
        while (contador<indice) {
            auxiliar = auxiliar.obtenerSiguiente();
            contador++;
        }
        return auxiliar.obtenerDato();

    }

    // Anghelo Aguirre
//    public double obtenerValor(int valor) {
//        Nodo aux = inicio;
//        double dato = 0;
//        for (int i = 0; i < size; i++) {
//            if (i == valor) {
//                dato = aux.getDato();
//                break;
//            } else {
//                aux = aux.getNodoSiguiente();
//            }
//        }
//        return dato;
//    }


}

```

Nodo

```java
/**
 *
 * @author User
 */
//Creamos la clase nodo
public class Nodo {
    //Definiendo sus atributos
    private Double dato;
    private Nodo nodoSiguiente;
    //Definiendo el constructor para inicializar el dato
    public Nodo(Double dato){
        this.dato = dato;
        this.nodoSiguiente=null;
    }
    //Definir un método para enlazar un nodo al nodo actual
    public void enlazarSiguiente(Nodo nodo){
        nodoSiguiente = nodo;
    }
    //Definir un método para  obtener el valor del nodo
    public Double obtenerDato(){
        return this.dato;
    }
    //Definir un método para obtener la referencia al nodo enlazado

    public Nodo obtenerSiguiente(){
        return nodoSiguiente;
    }


}

```

listas enlazadas 2

```java
package s06.isil.pkg2020.pkg2.listasenlazadas;

import java.util.LinkedList;

/**
 *
 * @author User
 */
public class S06ISIL20202ListasEnlazadas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
       //Creación del objeto nodo
        Nodo nodo1 = new Nodo(30.6);
        Nodo nodo2 = new Nodo(43.6);
        Nodo nodo3 = new Nodo(34.6);
       //Enlazar nodo1 con nodo2
       nodo1.enlazarSiguiente(nodo2);
       //Enlazar nodo2 con nodo3;
       nodo2 = nodo1.obtenerSiguiente();
       nodo1.obtenerSiguiente().enlazarSiguiente(nodo3);
       // Imprimir valor que tiene almacenado el Nodo1
       
       ListaEnlazada lista = new ListaEnlazada();
       Boolean estaVacia = lista.estaVacia();
       System.out.println("El resultado es :"+estaVacia);
       
       lista.agregarInicio(30.5);
       
       Boolean estaVacia1 = lista.estaVacia();
       System.out.println("El resultado es :"+estaVacia1);
       
        
    }
    
}

```

Lista enlazada doble 


```java

/**
 *
 * @author User
 */
public class ListaEnlazadaDoble {

    private Nodo inicio;
    private Nodo fin;
    private int size;

    //Creando el constructor
    public ListaEnlazadaDoble() {
        this.inicio = null;
        this.fin = null;

    }

    //Metodo para saber que la lista está vacia
    public Boolean estaVacia() {
        if (inicio == null) {
            return true;
        }
        return false;
    }

    //Metodo para agregar elementos a la lista al inicio
    public void agregarAlInicio(int edad) {
        if (estaVacia()) {
            inicio = fin = new Nodo(edad);
            size++;
        } else {
            inicio = new Nodo(edad, inicio, null);
            inicio.obtenerNodoSiguiente().enlazarNodoAnterior(inicio);
            size++;
        }
    }

    //Metodo para agregar elementos al final de la lista doblemente enlazada
    public void agregarAlFinal(int edad) {

        if (estaVacia()) {
            inicio = fin = new Nodo(edad);
            size++;
        } else {
            fin = new Nodo(edad, null, fin);
            fin.obtenerNodoAnterior().enlazarNodoSiguiente(fin);
            size++;
        }
    }

    //METODO PARA MOSTRAR LOS ELEMENTOS RECORRIENDO DE INICIO A FIN
    public void mostrarListaEnlazadaInicioAFin() {
        String datos = "<=>";
        if (!estaVacia()) {
            Nodo auxiliar = inicio;
            while (auxiliar != null) {
                datos = datos + auxiliar.obtenerDatoNodo() + "<=>";
                auxiliar = auxiliar.obtenerNodoSiguiente();
            }
            System.out.println("La lista de los elementos son :");
            System.out.println("" + datos);
        }
    }

    public int obtenerDato(int indice) {
        int contador = 0;
        Nodo auxiliar = inicio;
        while (contador < indice) {
            auxiliar = auxiliar.obtenerNodoSiguiente();
            contador++;
        }
        return auxiliar.obtenerDatoNodo();
    }

    public int tamaño(){
        return size;
    }

    //METODO PARA MOSTRAR LOS ELEMENTOS RECORRIENDO DE FIN A INICIO
    public void mostrarListaEnlazadaFinAInicio() {
        String datos = "<=>";
        if (!estaVacia()) {
            Nodo auxiliar = fin;
            while (auxiliar != null) {
                datos = datos + auxiliar.obtenerDatoNodo() + "<=>";
                auxiliar = auxiliar.obtenerNodoAnterior();
            }
            System.out.println("La lista de los elementos son :");
            System.out.println("" + datos);
        }
    }

    //METODO PARA BUSCAR ELEMENTO EN LA LISTA ENLAZADA
    public void buscarElemento(int edad) {
        String resultado = "";
        Boolean resultFlag = false;
        Boolean resulFlagVacio = false;
        if (!estaVacia()) {
            Nodo auxiliar = inicio;
            while (auxiliar != null) {
                int dato = auxiliar.obtenerDatoNodo();
                if (dato == edad) {
                    resultado = "El número se encuentra en la lista";
                    resultFlag = true;
                    break;
                } else {
                    auxiliar = auxiliar.obtenerNodoSiguiente();
                }
            }
        } else {
            resultado = "La lista se encuentra vacía";
            resulFlagVacio = true;
        }
        if (resultFlag) {
            System.out.println("-" + resultado);
        } else if (resulFlagVacio) {
            System.out.println("" + resultado);
        } else {
            resultado = "No se encuentra el dato en la lista";
            System.out.println(resultado);
        }
    }

    //METODO PARA ELIMINAR UN DATO
    public void eliminar(int dato) {

        if (inicio != null) {
            Nodo auxiliar = inicio;
            Nodo anterior = null;
            while (auxiliar != null) {
                if (auxiliar.obtenerDatoNodo() == dato) {
                    if (anterior == null) {
                        inicio = inicio.obtenerNodoSiguiente();
                        auxiliar.enlazarNodoSiguiente(null);
                        auxiliar = inicio;
                        // inicio.enlazarNodoAnterior(null);

                    } else {
                        anterior.enlazarNodoSiguiente(auxiliar.obtenerNodoSiguiente());
                        auxiliar.enlazarNodoSiguiente(null);
                        auxiliar = anterior.obtenerNodoSiguiente();
                    }
                } else {
                    anterior = auxiliar;
                    auxiliar = auxiliar.obtenerNodoSiguiente();
                }

            }
        } else {
            System.out.println("La lista se encuentra vacía");
        }
    }

}

```

Nodo 2

```java
package s07.isil.pkg2020.pkg2.listaenlazadadoble;

/**
 *
 * @author User
 */
public class Nodo {

    private int edad;
    private Nodo anterior;
    private Nodo siguiente;

    //Constructor cuando no hay nodos creados
    public Nodo(int edad) {
        this.edad = edad;
    }
    //Constructor cuando hay nodos creados 

    public Nodo(int edad,Nodo siguiente,Nodo anterior) {
        this.edad = edad;
        this.siguiente = siguiente;
        this.anterior = anterior;
    }
    // Metodo para enlazar al nodo siguiente

    public void enlazarNodoSiguiente(Nodo nodo) {
        this.siguiente = nodo;
    }

    // Metodo para obtener el nodo siguiente
    public Nodo obtenerNodoSiguiente() {
        return this.siguiente;
    }

    // Metodo para enlazar al nodo anterior
    public void enlazarNodoAnterior(Nodo nodo) {
        this.anterior = nodo;
    }

    // Metodo para obtener el nodo anterior
    public Nodo obtenerNodoAnterior() {
        return this.anterior;
    }

    // Metodo para obtener el dato
    public int obtenerDatoNodo() {
        return this.edad;
    }

}

```
```java
package s07.isil.pkg2020.pkg2.listaenlazadadoble;

/**
 *
 * @author User
 */
public class S07ISIL20202LISTAENLAZADADOBLE {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        ListaEnlazadaDoble listaDoble = new ListaEnlazadaDoble();
        System.out.println("La lista esta vacia :"+listaDoble.estaVacia());

        listaDoble.agregarAlFinal(10);
        listaDoble.agregarAlFinal(24);
        listaDoble.agregarAlInicio(30);

        //listaDoble.mostrarListaEnlazadaInicioAFin();

        listaDoble.mostrarListaEnlazadaFinAInicio();
        listaDoble.buscarElemento(24);
        //listaDoble.eliminar(30);
        listaDoble.mostrarListaEnlazadaInicioAFin();
        //listaDoble.mostrarListaEnlazadaFinAInicio();

        System.out.println("Tamaño :"+listaDoble.tamaño());
        int tamaño = listaDoble.tamaño();
        ListaEnlazadaDoble listaDobleReplica = new ListaEnlazadaDoble();
        for (int i = 0; i < tamaño; i++) {
            //int indice = Math.random();
            listaDobleReplica.agregarAlInicio(listaDoble.obtenerDato(i));
        }

        listaDobleReplica.mostrarListaEnlazadaFinAInicio();
        listaDoble.mostrarListaEnlazadaInicioAFin();


    }

}

```

semana 9

pilanumeros/Pila.java y Test.Java
```java
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pilanumeros;

import java.util.Stack;

/**
 *
 * @author User
 */
//Creacion de una pila estatica
public class Pila {
    //Definiendo las variables de la pila 

    private Double numeros[];
    private int cantidadDeElementos;
    private int cima;
    //Definiendo una pila a tráves del constructor     

    public Pila(int cantidadDeElementos) {
        this.cantidadDeElementos = cantidadDeElementos;
        numeros = new Double[cantidadDeElementos];
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
        if (numeros[cima] == null) {
            resultFlag = true;
        }
        return resultFlag;
    }

    //AGREGAR ELEMENTOS A LA PILA    
    public void push(Double dato) {
        if (cima < cantidadDeElementos) {
            numeros[cima] = dato;
            cima++;
        } else {
            System.out.println("La pila ya se encuentra llena");
        }
    }

    //TRAER EL ELEMENTO QUE SE ENCUETRA EN LA CIMA
    public Double peek() {
        if (cima == 0) {
            System.out.println("No hay datos en la pila");
            return 0.0;
        } else {
            return numeros[cima - 1];
        }
    }
    //RETIRAR EL ELEMENTO QUE ESTA EN LA CIMA
    public void pop() {
        if (cima == 0) {
            System.out.println("La pila se encuentra vacía");
        } else {
            numeros[cima - 1] = null;
            cima--;
        }
    }
    //RETORNAR LOS ELEMENTOS DE LA PILA
    public Double[] elementosPila(){
        if (cima!=0) {
            return numeros;
        } else {
            return null;
        }
    }
    //IMPRIMIR LOS ELEMETOS DE LA PILA
    public void imprimir(){
        if(cima>0){
            for (Double numero : numeros) {
                System.out.println(""+numero);
            }
        }
        else{
            System.out.println("No hay elementos en la pila");
        }
    }
}
```
```java
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

```
PilaObjetos / Alumno.java y Pila.Java

```java
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
public class Alumno {
    private Integer id;
    private String nombre;
    private String apellido;
    private String dni;
    private String correo;

    public Alumno(Integer id, String nombre, String apellido, String dni, String correo) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.correo = correo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}

```
```java
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

    private Alumno alumnos[];

}

```

SEMANA 10 

PILAS/SRC
* connectiondb 
  * ConnectionDB.java
```java
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectiondb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
/* Patron Singleton */
public class ConnectionDB {

    private static ConnectionDB instance=null;
    private static Connection con = null;
    private  final String URL="jdbc:sqlserver://localhost:1433;databaseName=isilalgoritmos";
    private  final String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private  final String USER="sa";
    private final String PASS="123456";

    //CONSTRUCTOR PRIVADO
    private  ConnectionDB(){
        try {
            //Crear una instancia del driver de conexion
            Class.forName(DRIVER).newInstance();
            //Conexion a la base de datos
            con = DriverManager.getConnection(URL,USER,PASS);
            System.out.println("Conectado a mi base de datos");
        } catch (Exception ex) {
            System.out.println("Error de conexion"+ex.getMessage());
            ex.printStackTrace();
        }
    }
    //METODO PARA CREAR UNA INSTANCIA DE CONEXION A LA BD
    public synchronized static ConnectionDB createInstance(){
        if(instance==null){
            instance = new ConnectionDB();
        }
        return instance;
    }
    //METODO PARA OBTENER LA INSTANCIA DE CONEXION A LA BD
    public Connection getConnection(){
        return con;
    }
    //METODO PARA CERRAR LA CONEXION
    public void close(){
        instance=null;
    }

}

```
* daos
    * AlumnoDAOImpl.java
    * IAlumnoDAO.java
    * ICRUD.java
```java
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import connectiondb.ConnectionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import pilaobjetos.Alumno;

/**
 *
 * @author User
 */
public class AlumnoDAOImpl implements IAlumnoDAO{

    private static PreparedStatement pstm;
    private static ResultSet res;
    private static ConnectionDB con;

    public AlumnoDAOImpl() {
        con = ConnectionDB.createInstance();
    }

    @Override
    public Boolean insert(Alumno t) {
        Boolean result=false;
        final String SQL_INSERT="insert into alumno values(?,?,?,?)";
        try {
            pstm = con.getConnection().prepareStatement(SQL_INSERT);
            pstm.setString(1, t.getNombre());
            pstm.setString(2,t.getApellido());
            pstm.setString(3, t.getDni());
            pstm.setString(4,t.getCorreo());

            if(pstm.executeUpdate()>0){
                result=true;
            }

        } catch (Exception e) {
            System.out.println("Error al insertar");
            e.printStackTrace();
        }
        finally{
            close();
        }
        return result;
    }

    @Override
    public Boolean update(Alumno t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Alumno selectById(Object id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Alumno> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Object id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void close() {
        try {
            if(res!=null)res.close();
            if(pstm!=null)pstm.close();
            if(con!=null) con.close();
        } catch (Exception e) {
            System.out.println("Error al cerrar las interfaces :");
        }
    }

}

```
```java
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import pilaobjetos.Alumno;

/**
 *
 * @author User
 */
public interface IAlumnoDAO extends ICRUD<Alumno>{

}

```
```java
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;

/**
 *
 * @author User
 */
public interface ICRUD <T>{
    public abstract Boolean insert(T t);
    public abstract Boolean update(T t);
    public abstract T selectById(Object id);
    public abstract List<T> selectAll();
    public abstract void delete(Object id);
    public abstract  void close();
}

```
* pilanumeros
  * Pila.java
  * Test.java
```java
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pilanumeros;

import java.util.Stack;

/**
 *
 * @author User
 */
//Creacion de una pila estatica
public class Pila {
    //Definiendo las variables de la pila 

    private Double numeros[];
    private int cantidadDeElementos;
    private int cima;
    //Definiendo una pila a tráves del constructor     

    public Pila(int cantidadDeElementos) {
        this.cantidadDeElementos = cantidadDeElementos;
        numeros = new Double[cantidadDeElementos];
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
        if (numeros[cima] == null) {
            resultFlag = true;
        }
        return resultFlag;
    }

    //AGREGAR ELEMENTOS A LA PILA    
    public void push(Double dato) {
        if (cima < cantidadDeElementos) {
            numeros[cima] = dato;
            cima++;
        } else {
            System.out.println("La pila ya se encuentra llena");
        }
    }

    //TRAER EL ELEMENTO QUE SE ENCUETRA EN LA CIMA
    public Double peek() {
        if (cima == 0) {
            System.out.println("No hay datos en la pila");
            return 0.0;
        } else {
            return numeros[cima - 1];
        }
    }
    //RETIRAR EL ELEMENTO QUE ESTA EN LA CIMA
    public void pop() {
        if (cima == 0) {
            System.out.println("La pila se encuentra vacía");
        } else {
            numeros[cima - 1] = null;
            cima--;
        }
    }
    //RETORNAR LOS ELEMENTOS DE LA PILA
    public Double[] elementosPila(){
        if (cima!=0) {
            return numeros;
        } else {
            return null;
        }
    }
    //IMPRIMIR LOS ELEMETOS DE LA PILA
    public void imprimir(){
        if(cima>0){
            for (Double numero : numeros) {
                System.out.println(""+numero);
            }
        }
        else{
            System.out.println("No hay elementos en la pila");
        }
    }
}

```
```java
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

```
* pilaobjetos
    * Alumno.java
    * Pila.java

```java
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
public class Alumno {
    private Integer id;
    private String nombre;
    private String apellido;
    private String dni;
    private String correo;

    public Alumno(Integer id, String nombre, String apellido, String dni, String correo) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.correo = correo;
    }

    public Alumno(String nombre, String apellido, String dni, String correo) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.correo = correo;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}

```
```java
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

    private Alumno alumnos[];

}

```


semana 11


```java
import foobar

# returns 'words'
foobar.pluralize('word')

# returns 'geese'
foobar.pluralize('goose')

# returns 'phenomenon'
foobar.singularize('phenomena')
```
```java
import foobar

# returns 'words'
foobar.pluralize('word')

# returns 'geese'
foobar.pluralize('goose')

# returns 'phenomenon'
foobar.singularize('phenomena')
```
```java
import foobar

# returns 'words'
foobar.pluralize('word')

# returns 'geese'
foobar.pluralize('goose')

# returns 'phenomenon'
foobar.singularize('phenomena')
```
```java
import foobar

# returns 'words'
foobar.pluralize('word')

# returns 'geese'
foobar.pluralize('goose')

# returns 'phenomenon'
foobar.singularize('phenomena')
```