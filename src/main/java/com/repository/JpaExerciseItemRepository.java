package com.repository;
import com.controller.ExerciseApiServlet;
import com.model.ExerciseItem;
import com.model.WorkoutPlan;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
public class JpaExerciseItemRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public void addExerciseItem(ExerciseItem exerciseItem) {
        entityManager.getTransaction().begin();
        entityManager.persist(exerciseItem);
        entityManager.getTransaction().commit();
        //entityManager.close();
        //emFactory.close();
    }

    public ExerciseItem findExerciseItemById(int id) {
        ExerciseItem exerciseItem = entityManager.find(ExerciseItem.class, id);
        //entityManager.close();
        //emFactory.close();
        return exerciseItem;
    }
}
