/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pruebas;

import connectiondb.ConnectionDB;
import daos.AlumnoDAOImpl;
import pilaobjetos.Alumno;

/**
 *
 * @author User
 */
public class Prueba {
    
    public static void main(String[] args) {

//      ConnectionDB.createInstance();
//      
//      Alumno alumno = new Alumno("Gianluca","Lapadula","5434343","lapagol@fpf.pe");
//      
//        AlumnoDAOImpl alumnoDAOImpl = new AlumnoDAOImpl();
//        
//        if (alumnoDAOImpl.insert(alumno)) {
//            System.out.println("Ok dato insertado");
//        } else {
//            System.out.println("No se insetaron los datos");
//        }
//        
        AlumnoDAOImpl alumnoDAOImpl = new AlumnoDAOImpl();
        Alumno alumno = alumnoDAOImpl.selectById(1);
        System.out.println(""+alumno);
        

    }
    
}
