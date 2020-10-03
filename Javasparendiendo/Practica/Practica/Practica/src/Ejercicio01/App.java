/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio01;

import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Scanner;

public class App {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        ArrayList<Persona> all = new ArrayList<>();
        Empleado emple = new Empleado("Juan", 22, 75312108, 'M', 84.0, 1.34);
        Medico med = new Medico("Carlos", 45, 1651681, 'M', 95.0, 1.80, 95, "Cardiología");
        all.add(emple);
        all.add(med);
        Paciente pac = new Paciente("Michelle", 19, 46486186, 'F', 56, 1.58, LocalDate.of(2010, Month.MARCH, 30) , med);
        System.out.println("");
        System.out.println("Nombre: " + pac.getNombre());
        System.out.println("Es mayor de edad: " + pac.esMayordeEdad());
        System.out.println("Fecha de atención: " + pac.fechaPrimeraConsulta);
        pac.calcularIMC();
        all.add(pac);

        System.out.println("-----------------------------------------------------------");
        System.out.println("Todos las personas: ");
        for (Persona p : all) {
            System.out.println("Nombre: " + p.getNombre() + "\nEdad: " + p.getEdad() + "\nRuc: " + p.getRuc()
                    + "\nSexo: " + p.getSexo() + "\nPeso: " + p.getPeso() + "\nAltura: " + p.getAltura());
            System.out.println(p.saludar());
            System.out.println(p.despedida());
            System.out.println("-----------------------------------------------------------");
        }

    }

}
