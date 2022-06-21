/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectiondb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
/* Patron Singleton */
public class ConnectionDB {
    
    private static ConnectionDB instance=null;
    private static Connection con = null;
    private  final String URL="jdbc:sqlserver://localhost:1433;databaseName=isilalgoritmos";
    private  final String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private  final String USER="sa";
    private final String PASS="123456";
    
    //CONSTRUCTOR PRIVADO
    private  ConnectionDB(){  
        try {
            //Crear una instancia del driver de conexion
            Class.forName(DRIVER).newInstance();
            //Conexion a la base de datos
            con = DriverManager.getConnection(URL,USER,PASS);
            System.out.println("Conectado a mi base de datos");
        } catch (Exception ex) {
            System.out.println("Error de conexion"+ex.getMessage());
            ex.printStackTrace();
        } 
    }
    //METODO PARA CREAR UNA INSTANCIA DE CONEXION A LA BD
    public synchronized static ConnectionDB createInstance(){
        if(instance==null){
        instance = new ConnectionDB();
        }
    return instance;
    }
    //METODO PARA OBTENER LA INSTANCIA DE CONEXION A LA BD
    public Connection getConnection(){
        return con;
    }
    //METODO PARA CERRAR LA CONEXION
    public void close(){
        instance=null;
    }
    
}
