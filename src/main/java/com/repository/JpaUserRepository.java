package com.repository;

import com.model.User;
import com.model.WgerExercise;
import com.model.WorkoutPlan;
import jakarta.persistence.*;

import java.security.InvalidParameterException;
import java.util.List;
public class JpaUserRepository {

    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<User> getAllUsers() {
        TypedQuery<User> typedQuery = entityManager.createQuery("select u from User u", User.class);
        List<User> userList = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return userList;
    }
    public void addUser(User user) {
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
        //entityManager.close();
        //emFactory.close();
    }

    public User findUserById(int id) {
        User user = entityManager.find(User.class, id);
        entityManager.close();
        emFactory.close();
        return user;
    }

    public void updateUser(int id, String name, String email, String password){
        entityManager.getTransaction( ).begin( );
        User user = entityManager.find(User.class, id);
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        entityManager.getTransaction( ).commit( );
    }

    public void deleteUser(int id){
        entityManager.getTransaction( ).begin( );
        User user = entityManager.find(User.class, id);
        entityManager.remove(user);
        entityManager.getTransaction( ).commit( );
    }

    public User checkIfExists(String email, String password) {
        try {
            TypedQuery<User> typedQuery = entityManager.createQuery("select u from User u WHERE u.email = :email AND u.password = :password", User.class);
            return typedQuery
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
        } catch (NoResultException e) {
            throw new InvalidParameterException("User is not found in the database");
        }
    }

}
