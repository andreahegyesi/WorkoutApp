package com.repository;

import com.model.CustomExercise;
import com.model.WgerExercise;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
public class JpaCustomExerciseRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<CustomExercise> getAllCustomExercises() {
        TypedQuery<CustomExercise> typedQuery = entityManager.createQuery("select c from CustomExercise c", CustomExercise.class);
        List<CustomExercise> customExerciseList = typedQuery.getResultList();
        //entityManager.close();
        //emFactory.close();
        return customExerciseList;
    }

    public void addCustomExercise(CustomExercise customExercise) {
        entityManager.getTransaction().begin();
        entityManager.persist(customExercise);
        entityManager.getTransaction().commit();
        //entityManager.close();
        //emFactory.close();
    }

    public void addCustomExercise(ArrayList<CustomExercise> customExercises) {
        entityManager.getTransaction().begin();
        for(CustomExercise ex: customExercises){
            entityManager.persist(ex);
        }
        entityManager.getTransaction().commit();
        //entityManager.close();
        //emFactory.close();
    }

    public CustomExercise findCustomExerciseById(int id) {
        CustomExercise customExercise = entityManager.find(CustomExercise.class, id);
        //entityManager.close();
        //emFactory.close();
        return customExercise;
    }

    public void deleteCustomExercise(int id){
        entityManager.getTransaction( ).begin( );
        CustomExercise customExercise = entityManager.find(CustomExercise.class, id);
        entityManager.remove(customExercise);
        entityManager.getTransaction( ).commit( );
    }
}
