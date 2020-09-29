package Ejercicio5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class SQLDatabaseConnection {

    // Connect to your database.
    // Replace server name, username, and password with your credentials
    public static void main(String[] args) {
        String connectionUrl =
                "jdbc:sqlserver://localhost:1433;"
                        + "database=Store;"
                        + "user=sa;"
                        + "password=123456;"
                        + "encrypt=true;"
                        + "trustServerCertificate=false;"
                        + "loginTimeout=30;";

        String insertSql = "INSERT INTO Store.Alumnos (id,Nombre,Apellido,Edad,Puesto,NivelAcademico,Profesion,Dni) VALUES "
                + "(2,'jimmy','bobadilla',19, 'Estudiantes','3 ciclo','marketing',11321234);";

        ResultSet resultSet = null;

        try (Connection connection = DriverManager.getConnection(connectionUrl);
             PreparedStatement prepsInsertAlumnos = connection.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);) {

            prepsInsertAlumnos.execute();
            // Retrieve the generated key from the insert.
            resultSet = prepsInsertAlumnos.getGeneratedKeys();

            // Print the ID of the inserted row.
            while (resultSet.next()) {
                System.out.println("Generated: " + resultSet.getString(1));
            }
        }
        // Handle any errors that may have occurred.
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}