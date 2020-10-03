/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clínica.nutricional;

import java.util.Scanner;
import java.util.ArrayList;

/**
 *
 * @author USUARIO
 */
public class ClínicaNutricional {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
     //EJERCICIO  1.1 
      Paciente paciente = new Paciente("Juan",32,"12345678","M",78,1.80,12102020,"Dr.Pedro");
    //Verifica si su peso es adecuado
      paciente.IMC2();
      //Verifica si es mayor de edad
      paciente.bool();
      //Verificar sexo
      paciente.comprobarSexo();
      
      
      //EJERCICIO 1.2
      System.out.println(paciente.toString());
      Scanner input =new Scanner (System.in);
      
        System.out.println("Ingresar nombre: ");
        String nombre = input.next(); 
        
        System.out.println("Ingresar RUC: ");
        String RUC = input.next(); 
           
        System.out.println("Ingresar Edad: ");
        int  edad = input.nextInt();
         
        System.out.println("Ingresar sexo: ");
        String  sexo = input.next(); 
        
        System.out.println("Ingresar peso: ");
        int peso = input.nextInt();
        
        System.out.println("Ingresar altura: ");
        double  altura = input.nextDouble();
        
        System.out.println("Ingresar fecha:" );
        int fechaPrimeraConsulta = input.nextInt();
        
        System.out.println("Ingresar Medico Tratante:" );
        String medicoTratante = input.next();
        
        System.out.println("Ingresar precio:" );
        int precioConsulta = input.nextInt();
        
        System.out.println("Ingresar especialidad:" );
        String especialidad = input.next();
        
      Paciente paciente2 = new Paciente( nombre,edad,RUC,sexo,peso,altura,fechaPrimeraConsulta,medicoTratante);
     
       ArrayList<Paciente> listaPaciente = new ArrayList<>();
      listaPaciente.add(paciente2);
      
      Medico medico = new Medico(nombre,edad,RUC,sexo,peso,altura,precioConsulta,especialidad);
      
       ArrayList<Medico> listaMedico = new ArrayList<>();
      listaMedico.add(medico);
       System.out.println(listaPaciente);
        System.out.println(listaMedico);
      
           
      //Verifica si su peso es adecuado con mensaje
      paciente2.IMC3();
      //Verifica si es mayor de edad con mensaje
      paciente2.bool2();

      
      
     

    }
}
