/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicio01;

public class Medico extends Persona {

    private double precioConsulta;
    private String especialidad;

    public Medico(String nombre, int edad, int ruc, char sexo, double peso, double altura, double precioConsulta, String especialidad) {
        super(nombre, edad, ruc, sexo, peso, altura);
        this.precioConsulta = precioConsulta;
        this.especialidad = especialidad;
    }

    public double getPrecioConsulta() {
        return precioConsulta;
    }

    public void setPrecioConsulta(double precioConsulta) {
        this.precioConsulta = precioConsulta;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

}
