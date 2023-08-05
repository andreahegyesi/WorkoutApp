package com.repository;
import com.model.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;
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

    public boolean checkExerciseItemExistence(int id){
        TypedQuery<ExerciseItem> typedQuery = entityManager.createQuery(("select e from ExerciseItem e WHERE e.customExercise.getId() = 17"), ExerciseItem.class);
        List<ExerciseItem> exerciseItemList = typedQuery.getResultList();
        //entityManager.close();
        //emFactory.close();
        return exerciseItemList.size() != 0;
    }

    public void deleteExerciseItem(int id){
        entityManager.getTransaction( ).begin( );
        ExerciseItem exerciseItem = entityManager.find(ExerciseItem.class, id);
        entityManager.remove(exerciseItem);
        entityManager.getTransaction( ).commit( );
    }
}
