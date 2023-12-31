package com.repository;
import com.model.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import org.hibernate.jdbc.Work;

import java.util.ArrayList;
import java.util.List;
public class JpaWorkoutPlanRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<WorkoutPlan> getAllWorkoutPlans() {
        TypedQuery<WorkoutPlan> typedQuery = entityManager.createQuery("select w from WorkoutPlan w", WorkoutPlan.class);
        List<WorkoutPlan> workoutPlanList = typedQuery.getResultList();
        //entityManager.close();
        //emFactory.close();
        return workoutPlanList;
    }

    public List<WorkoutPlan> getWorkoutPlanByUser(int userId) {
        TypedQuery<WorkoutPlan> typedQuery = entityManager.createQuery("select w from WorkoutPlan w", WorkoutPlan.class);
        List<WorkoutPlan> workoutPlanList = typedQuery.getResultList();
        List<WorkoutPlan> workoutPlanListByUser = new ArrayList<>();
        for (WorkoutPlan workoutPlan: workoutPlanList){
            for (User userFromList: workoutPlan.getUserList()){
                if (userId == userFromList.getId()){
                    workoutPlanListByUser.add(workoutPlan);
                }
            }
        }
        //entityManager.close();
        //emFactory.close();
        return workoutPlanListByUser;
    }

    public void addWorkoutPlan(WorkoutPlan workoutPlan) {
        entityManager.getTransaction().begin();
        entityManager.persist(workoutPlan);
        entityManager.getTransaction().commit();
        //entityManager.close();
        //emFactory.close();
    }

    public void addExerciseItemToWorkoutPlan(int workoutPlanId, Integer exerciseItemId){
        entityManager.getTransaction( ).begin( );
        WorkoutPlan workoutPlan= entityManager.find(WorkoutPlan.class, workoutPlanId);
        workoutPlan.getExerciseItems().add(exerciseItemId);
        entityManager.getTransaction( ).commit( );
    }

    public void deleteExerciseItemFromWorkoutPlan(int workoutPlanId, Integer exerciseItemId){
        entityManager.getTransaction( ).begin( );
        WorkoutPlan workoutPlan= entityManager.find(WorkoutPlan.class, workoutPlanId);
        workoutPlan.getExerciseItems().remove(exerciseItemId);
        entityManager.getTransaction( ).commit( );
    }

    public WorkoutPlan findWorkoutPlanById(int id) {
        WorkoutPlan workoutPlan = entityManager.find(WorkoutPlan.class, id);
        //entityManager.close();
        //emFactory.close();
        return workoutPlan;
    }

    public int findWorkoutPlanIdByName(String name){
        TypedQuery<WorkoutPlan> typedQuery = entityManager.createQuery(("select w from WorkoutPlan w  WHERE w.name LIKE '%" + name + "%'"), WorkoutPlan.class);
        WorkoutPlan workoutPlan= typedQuery.getSingleResult();
        //entityManager.close();
        //emFactory.close();
        return workoutPlan.getId();
    }

    public void updateWorkoutPlan(int id, String name, List<Integer> exerciseItems){
        entityManager.getTransaction( ).begin( );
        WorkoutPlan workoutPlan= entityManager.find(WorkoutPlan.class, id);
        workoutPlan.setName(name);
        workoutPlan.setExerciseItems(exerciseItems);
        entityManager.getTransaction( ).commit( );
    }

    public void deleteWorkoutPlan(int id){
        entityManager.getTransaction( ).begin( );
        WorkoutPlan workoutPlan = entityManager.find(WorkoutPlan.class, id);
        entityManager.remove(workoutPlan);
        entityManager.getTransaction( ).commit( );
    }
}
