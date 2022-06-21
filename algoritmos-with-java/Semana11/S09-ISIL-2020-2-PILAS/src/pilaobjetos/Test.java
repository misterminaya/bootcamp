/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pilaobjetos;

import daos.AlumnoDAOImpl;

/**
 *
 * @author User
 */
public class Test {

    public static void main(String[] args) {
       // 1 Crear los objetos del tipo alumno
//        Alumno alumno1 = new Alumno("Anghelo", "Aguirre", "71487356", "ashdjasdhlsadha@hotmail.com");
//        Alumno alumno2 = new Alumno("Juan Carlos", "Jimenez Atoche", "74866938", "jjimenezat@gmail.com");
//        Alumno alumno3 = new Alumno("Fiorella", "Rey", "71458006", "correoejemplo@hotmail.com");
//      // 2 Crear la instancia de DAO
        AlumnoDAOImpl alumnoDAOImpl = new AlumnoDAOImpl();
//        alumnoDAOImpl.insert(alumno1);
//        alumnoDAOImpl.insert(alumno2);
//        alumnoDAOImpl.insert(alumno3);

      // 3 Recuperar registros de la base de datos
        Alumno alumnoRecuperadoBD1 = alumnoDAOImpl.selectById(1);
        Alumno alumnoRecuperadoBD2 = alumnoDAOImpl.selectById(2);
        Alumno alumnoRecuperadoBD3 = alumnoDAOImpl.selectById(3);
        Alumno alumnoRecuperadoBD4 = alumnoDAOImpl.selectById(4);
        
        Pila pila = new Pila(4);
        
        pila.push(alumnoRecuperadoBD1);
        pila.push(alumnoRecuperadoBD2);
        pila.push(alumnoRecuperadoBD3);
        pila.push(alumnoRecuperadoBD4);
        
        
        pila.imprimir();
        
    }
}
