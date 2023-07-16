package com.repository;

import com.model.Muscle;
import jakarta.persistence.*;

import java.util.List;
public class JpaMuscleRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<Muscle> getAllMuscles() {
        TypedQuery<Muscle> typedQuery = entityManager.createQuery("select m from Muscle m", Muscle.class);
        List<Muscle> muscleList = typedQuery.getResultList();
        //entityManager.close();
        //emFactory.close();
        return muscleList;
    }

    public String findMuscleNameById(Integer findId) {
        Muscle muscle = entityManager.find(Muscle.class, findId);
        //entityManager.close();
        //emFactory.close();
        return muscle.getName();
    }

}