package com.repository;

import com.model.Category;
import com.model.WgerExercise;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
public class JpaCategoryRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<Category> getAllCategories() {
        TypedQuery<Category> typedQuery = entityManager.createQuery("select c from Category c", Category.class);
        List<Category> categoryList = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return categoryList;
    }
}