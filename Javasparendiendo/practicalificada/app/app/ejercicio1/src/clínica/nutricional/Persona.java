/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clínica.nutricional;

/**
 *
 * @author USUARIO
 */
public class Persona {
 private  String nombre;
 private  int edad;
 private  String RUC;
 private  String sexo;
 private  int peso;
 private  double altura;

    public Persona(String nombre, int edad, String RUC, String sexo, int peso, double altura) {
        this.nombre = nombre;
        this.edad = edad;
        this.RUC = RUC;
        this.sexo = sexo;
        this.peso = peso;
        this.altura = altura;
    }

    public String getNombre() {
        return nombre;
    }

    public int getEdad() {
        return edad;
    }

    public String getRUC() {
        return RUC;
    }

    public String getSexo() {
        return sexo;
    }

    public int getPeso() {
        return peso;
    }

    public double getAltura() {
        return altura;
    }
 
}
