/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio01;

import java.time.LocalDate;

public class Paciente extends Persona {

    public LocalDate fechaPrimeraConsulta;
    public Medico medicoTratante;

    public Paciente(String nombre, int edad, int ruc, char sexo, double peso, double altura, LocalDate fechaPrimeraConsulta, Medico medicoTratante) {
        super(nombre, edad, ruc, sexo, peso, altura);
        this.fechaPrimeraConsulta = fechaPrimeraConsulta;
        this.medicoTratante = medicoTratante;
    }

    public LocalDate getFechaPrimeraConsulta() {
        return fechaPrimeraConsulta;
    }

    public void setFechaPrimeraConsulta(LocalDate fechaPrimeraConsulta) {
        this.fechaPrimeraConsulta = fechaPrimeraConsulta;
    }

    public Medico getMedicoTratante() {
        return medicoTratante;
    }

    public void setMedicoTratante(Medico medicoTratante) {
        this.medicoTratante = medicoTratante;
    }

    public void calcularIMC() {
        double imc = getPeso() / getAltura();
        if (imc < 18.5) {
            System.out.println("Indice de masa corporal: " + imc + ", Clasficicación de la OMS: Bajo de peso y Descripción popular: Delgado");
        } else if (imc >= 18.5 && imc <= 24.9) {
            System.out.println("Indice de masa corporal: " + imc + ", Clasficicación de la OMS: Adecuado y Descripción popular: Aceptable");
        } else if (imc >= 25.0 && imc <= 29.9) {
            System.out.println("Indice de masa corporal: " + imc + ", Clasficicación de la OMS: Sobrepeso y Descripción popular: Sobrepeso");
        } else if (imc >= 30.0 && imc <= 34.9) {
            System.out.println("Indice de masa corporal: " + imc + ", Clasficicación de la OMS: Obesidad grado 1 y Descripción popular: Obesidad");
        } else if (imc >= 35.0 && imc <= 39.9) {
            System.out.println("Indice de masa corporal: " + imc + ", Clasficicación de la OMS: Obesidad grado 2 y Descripción popular: Obesidad");
        } else {
            System.out.println("Indice de masa corporal: " + imc + ", Clasficicación de la OMS: Obesidad grado 3 y Descripción popular: Obesidad");
        }
    }
    
    public boolean esMayordeEdad(){
        boolean mayor = false;
        if (getEdad() >= 18) {
            mayor = true;
        } 
        return mayor;
    }

    private void comprobarSexo() {

        if (getSexo() == 'H') {
            System.out.println("Masculino");
        } else {
            System.out.println("Femenino");
        }
    }

}
