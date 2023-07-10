package com.repository;

import com.model.Category;
import com.model.WgerExercise;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
public class JpaWgerExerciseRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<WgerExercise> getAllExercises() {
        TypedQuery<WgerExercise> typedQuery = entityManager.createQuery("select e from WgerExercise e", WgerExercise.class);
        List<WgerExercise> wgerExerciseList = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return wgerExerciseList;
    }

    public void addExercise(WgerExercise wgerExercise) {
        entityManager.getTransaction().begin();
        entityManager.persist(wgerExercise);
        entityManager.getTransaction().commit();
        entityManager.close();
        emFactory.close();
    }

    public void addExercise(ArrayList<WgerExercise> wgerExercises) {
        entityManager.getTransaction().begin();
        for(WgerExercise ex: wgerExercises){
            entityManager.persist(ex);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
        emFactory.close();
    }

    public List<Category> getCategories(){
        TypedQuery<Category> typedQuery = entityManager.createQuery("select c from Category c", Category.class);
        List<Category> categoryList = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return categoryList;
    }


    /* public List<Student> findStudentByName(String findName) {
        //TypedQuery<Student> typedQuery = entityManager.createQuery(("select s from Student s WHERE s.name = '" + findName + "'"), Student.class);
        TypedQuery<Student> typedQuery = entityManager.createQuery(("select s from Student s WHERE s.name LIKE '%" + findName + "%'"), Student.class);
        List<Student> studentListByNames = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return studentListByNames;
    } */
    public WgerExercise findWgerExerciseById(int findId) {
        WgerExercise wgerExercise = entityManager.find(WgerExercise.class, findId);
        entityManager.close();
        emFactory.close();
        return wgerExercise;
    }

}
