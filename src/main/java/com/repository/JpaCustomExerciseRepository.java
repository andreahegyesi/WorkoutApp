package com.repository;
import com.model.CustomExercise;
import com.model.Category;
import com.model.User;
import com.model.Muscle;
import com.model.Equipment;
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

    public List<CustomExercise> getCustomExercisesByUser(int userId) {
        TypedQuery<CustomExercise> typedQuery = entityManager.createQuery("select c from CustomExercise c", CustomExercise.class);
        List<CustomExercise> customExerciseList = typedQuery.getResultList();
        List<CustomExercise> customExerciseListByUser = new ArrayList<>();
        for (CustomExercise customExercise: customExerciseList){
            for(User userFromList: customExercise.getUserList()){
                if (userId == userFromList.getId()){
                    customExerciseListByUser.add(customExercise);
                }
            }
        }
        //entityManager.close();
        //emFactory.close();
        return customExerciseListByUser;
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

    public void updateCustomExercise(int id,String name, Category category, String description, ArrayList<Integer> muscles, ArrayList<Integer> secondaryMuscles, ArrayList<Integer> equipment, String imageSource, List<User> userList){
        entityManager.getTransaction( ).begin( );
        CustomExercise customExercise = entityManager.find(CustomExercise.class, id);
        customExercise.setName(name);
        customExercise.setCategory(category);
        customExercise.setDescription(description);
        customExercise.setMuscles(muscles);
        customExercise.setSecondaryMuscles(secondaryMuscles);
        customExercise.setEquipment(equipment);
        customExercise.setImageSource(imageSource);
        customExercise.setUserList(userList);
        entityManager.getTransaction( ).commit( );
    }

    public void deleteCustomExercise(int id){
        entityManager.getTransaction( ).begin( );
        CustomExercise customExercise = entityManager.find(CustomExercise.class, id);
        entityManager.remove(customExercise);
        entityManager.getTransaction( ).commit( );
    }
}
