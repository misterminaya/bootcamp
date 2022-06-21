/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import connectiondb.ConnectionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import pilaobjetos.Alumno;

/**
 *
 * @author User
 */
public class AlumnoDAOImpl implements IAlumnoDAO {

    private static PreparedStatement pstm;
    private static ResultSet res;
    private static ConnectionDB con;

    public AlumnoDAOImpl() {
        con = ConnectionDB.createInstance();
    }

    @Override
    public Boolean insert(Alumno t) {
        Boolean result = false;
        final String SQL_INSERT = "insert into alumno values(?,?,?,?)";
        try {
            pstm = con.getConnection().prepareStatement(SQL_INSERT);
            pstm.setString(1, t.getNombre());
            pstm.setString(2, t.getApellido());
            pstm.setString(3, t.getDni());
            pstm.setString(4, t.getCorreo());

            if (pstm.executeUpdate() > 0) {
                result = true;
            }

        } catch (Exception e) {
            System.out.println("Error al insertar");
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }

    @Override
    public Boolean update(Alumno t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Alumno selectById(Integer id) {
        Alumno alumno = null;
        final String SQL_SELECT = "select * from alumno where id=?";
        try {
            pstm = con.getConnection().prepareStatement(SQL_SELECT);
            pstm.setInt(1, id);
            res = pstm.executeQuery();
            while (res.next()) {
                alumno = new Alumno(res.getInt("id"), res.getString("nombre"), res.getString("apellido"), res.getString("dni"), res.getString("correo"));
            }
        } catch (Exception e) {
            System.out.println("Error al seleccionar por ID" + e.getMessage());
        } finally {
            close();
        }
        return alumno;
    }

    @Override
    public List<Alumno> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Object id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void close() {
        try {
            if (res != null) {
                res.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            System.out.println("Error al cerrar las interfaces :");
        }
    }

}
