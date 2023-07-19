package com.repository;
import java.util.*;
import java.util.stream.Collectors;
import com.model.Muscle;
import jakarta.persistence.*;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
public class JpaMuscleRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<Muscle> getAllMuscles() {
        TypedQuery<Muscle> typedQuery = entityManager.createQuery("select m from Muscle m", Muscle.class);
        List<Muscle> muscleList = typedQuery.getResultList();
        //entityManager.close();
        //emFactory.close();
        return muscleList.stream().sorted((firstM, secondM) -> ((Integer)firstM.getId()).compareTo((Integer)secondM.getId())).toList();
    }

    public String findMuscleNameById(Integer id) {
        Muscle muscle = entityManager.find(Muscle.class, id);
        //entityManager.close();
        //emFactory.close();
        return muscle.getName();
    }

    public int findMuscleByName(String name){
        TypedQuery<Muscle> typedQuery = entityManager.createQuery(("select m from Muscle m WHERE m.name LIKE '%" + name + "%'"), Muscle.class);
        Muscle muscle = typedQuery.getSingleResult();
        entityManager.close();
        emFactory.close();
        return muscle.getId();
    }

}