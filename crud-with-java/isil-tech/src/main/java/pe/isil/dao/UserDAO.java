package pe.isil.dao;

import pe.isil.model.User;
import pe.isil.util.DataBaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO{

    public void create(User user) {

        try(Connection connection = DataBaseUtil.getConnection()) {

            final String SQL = "INSERT INTO tbl_users (firstName, lastNameFather, lastNameMother, age) VALUES (?,?,?,?) ";

            try(PreparedStatement ps = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, user.getFirstName());
                ps.setString(2, user.getLastNameFather());
                ps.setString(3, user.getLastNameMother());
                ps.setInt(4, user.getAge());
                ps.executeUpdate();

                try(ResultSet rs = ps.getGeneratedKeys()) {
                    if(rs.next()){
                        int id = rs.getInt(1);
                        user.setId(id);
                    }
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    public void update(User user) {

        try(Connection connection = DataBaseUtil.getConnection()) {

            final String SQL = "UPDATE tbl_users SET firstName=?, lastNameFather=?, lastNameMother=?, age=? WHERE id=?";

            try(PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setString(1, user.getFirstName());
                ps.setString(2, user.getLastNameFather());
                ps.setString(3, user.getLastNameMother());
                ps.setInt(4, user.getAge());
                ps.setInt(5, user.getId());
                ps.executeUpdate();
            }
        }catch (Exception e){
            System.err.println(e);
        }
    }

    public void delete(User user) {

        try(Connection connection = DataBaseUtil.getConnection()) {

            final String SQL = "DELETE FROM tbl_users WHERE id=?";

            try(PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setInt(1, user.getId());
                ps.executeUpdate();
            }
        }catch (Exception e){
            System.err.println(e);
        }
    }

    public List<User> findAll() {

        List<User> users = new ArrayList<User>();

        try(Connection connection = DataBaseUtil.getConnection()) {

            final String SQL = "SELECT * FROM tbl_users";

            try(Statement statement = connection.createStatement()) {

                try(ResultSet resultSet = statement.executeQuery(SQL)) {
                    while (resultSet.next()){
                        int id = resultSet.getInt("id");
                        String firstName = resultSet.getString("firstName");
                        String lastNameFather = resultSet.getString("lastNameFather");
                        String lastNameMother = resultSet.getString("lastNameMother");
                        int age = resultSet.getInt("age");

                        User user = new User(id, firstName, lastNameFather, lastNameMother, age);
                        users.add(user);
                    }
                }
            }
        }catch (Exception e){
            System.err.println(e);
        }

        return users;
    }

    public User findById(Integer id) {

        User user = null;

        try(Connection connection = DataBaseUtil.getConnection()) {

            final String SQL = "SELECT * FROM tbl_users WHERE id=?";

            try(PreparedStatement ps = connection.prepareStatement(SQL)) {
                ps.setInt(1, id);

                try(ResultSet resultSet = ps.executeQuery()) {
                    while (resultSet.next()){
                        int current_id = resultSet.getInt("id");
                        String firstName = resultSet.getString("firstName");
                        String lastNameFather = resultSet.getString("lastNameFather");
                        String lastNameMother = resultSet.getString("lastNameMother");
                        int age = resultSet.getInt("age");

                        user = new User(current_id, firstName, lastNameFather, lastNameMother, age);
                    }
                }
            }
        }catch (Exception e){
            System.err.println(e);
        }

        return user;
    }
}