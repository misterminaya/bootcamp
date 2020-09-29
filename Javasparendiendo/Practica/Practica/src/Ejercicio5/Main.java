package Ejercicio5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws Exception {
        // TODO Auto-generated method stub
        createTable();
        post();
        get();


    }
    public static ArrayList<String> get() throws Exception{
        try{
            Connection con = getConnection();
            PreparedStatement statement = con.prepareStatement("SELECT * FROM Alumnos ORDER BY first DESC LIMIT 1");

            ResultSet result = statement.executeQuery();

            ArrayList<String> array = new ArrayList<String>();
            while(result.next()){
                System.out.print(result.getString("first"));
                System.out.print(" ");
                System.out.println(result.getString("last"));

                array.add(result.getString("last"));
            }
            System.out.println("All records have been selected!");
            return array;

        }catch(Exception e){System.out.println(e);}
        return null;

    }
    public static void post() throws Exception{
        final String var1 = "John";
        final String var2 = "Miller";
        try{
            Connection con = getConnection();
            PreparedStatement posted = con.prepareStatement("INSERT INTO iamalive (first, last) VALUES ('"+var1+"', '"+var2+"')");

            posted.executeUpdate();
        } catch(Exception e){System.out.println(e);}
        finally {
            System.out.println("Insert Completed.");
        }
    }
    public static void createTable() throws Exception{
        try{
            Connection con = getConnection();
            PreparedStatement create = con.prepareStatement("CREATE TABLE IF NOT EXISTS iamalive(id int NOT NULL AUTO_INCREMENT, first varchar(255), last varchar(255), PRIMARY KEY(id))");
            create.executeUpdate();
        }catch(Exception e){System.out.println(e);}
        finally{
            System.out.println("Function Complete.");
        };

    }
    public static Connection getConnection() throws Exception{
        try{
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:sqlserver://localhost:1433";
            String username = "sa";
            String password = "123456";
            Class.forName(driver);

            Connection conn = DriverManager.getConnection(url,username,password);
            System.out.println("Connected");
            return conn;
        } catch(Exception e){System.out.println(e);}


        return null;
    }

}
