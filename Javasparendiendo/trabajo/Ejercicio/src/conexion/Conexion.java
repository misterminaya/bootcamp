/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public static Connection getConexion() {
        String url = "jdbc:sqlserver://localhost:1433;" + "database=Store;" + "user=sa;" + "password=123456;";

        try {
            Connection cn = DriverManager.getConnection(url);
            return cn;

        } catch (SQLException x) {
            System.out.println(x.toString());
            return null;
        }
    }

}
