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
public class Oficial extends Operario {

    public Oficial(String nombre) {
        super(nombre);
    }

   
    @Override
      public String toString(){
      
      return "Empleado "+getNombre();
      
      }
}
