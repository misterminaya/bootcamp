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
public class Medico extends Persona {
    private int precioConsulta;
    private String especialidad;

    public Medico( String nombre, int edad, String RUC, String sexo, int peso, double altura,int precioConsulta, String especialidad) {
        super(nombre, edad, RUC, sexo, peso, altura);
        this.precioConsulta = precioConsulta;
        this.especialidad = especialidad;
    }

  
    
    public int getPrecioConsulta() {
        return precioConsulta;
    }

    public String getEspecialidad() {
        return especialidad;
    }
   public String toString(){
            return 
                    "Precio: "+getPrecioConsulta()+ "\n"+
                    "Especialidad: "+ getEspecialidad();
            
            }  
}
