package pe.isil;

import pe.isil.dao.UserDAO;
import pe.isil.model.User;

public class App {

    public static void main(String[] args) {

        User user = new User();
        user.setFirstName("NameTest");
        user.setLastNameFather("LastFatherTest");
        user.setLastNameMother("LastMotherTest");
        user.setAge(30);

        UserDAO userDAO = new UserDAO();

        //CREATE
        userDAO.create(user);
        System.out.println(userDAO.findById(user.getId()));

        //UPDATE
        user.setFirstName("Franco");
        user.setAge(25);
        userDAO.update(user);
        System.out.println(userDAO.findById(user.getId()));

        //DELETE
        userDAO.delete(user);
        System.out.println(userDAO.findById(user.getId()));

        //LIST
        userDAO.findAll().forEach(System.out::println);
    }
}
