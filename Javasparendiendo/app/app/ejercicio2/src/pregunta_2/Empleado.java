/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pregunta_2;

/**
 *
 * @author USUARIO
 */
public class Empleado {
    
    public String nombre;

    public Empleado(String nombre) {
        this.nombre = nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }
    
      public String toString(){
      
      return "Empleado "+getNombre();
      
      }
}
