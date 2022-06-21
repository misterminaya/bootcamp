package pe.isil.dao;
import pe.isil.model.User;

import java.util.List;

public interface IUserDAO {

    public void create(User user);
    public void update(User user);
    public void delete(User user);

    public List<User> findAll();
    public User findById(Integer id);

}