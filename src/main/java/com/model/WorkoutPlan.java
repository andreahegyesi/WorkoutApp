package com.model;
import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.*;

@Getter
@Setter
@ToString
@Entity
@Table(name = "workoutplans")
public class WorkoutPlan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    private List<Integer> exerciseItems;
    @ManyToMany(fetch = FetchType.LAZY)
    private List<User> userList;

    public WorkoutPlan(){

    }

    public WorkoutPlan(String name){
        this.name = name;
    }

    public WorkoutPlan(String name, List<Integer> exerciseItems) {
        this.name = name;
        this.exerciseItems = exerciseItems;
    }

    public WorkoutPlan(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public WorkoutPlan(int id, String name, List<Integer> exerciseItems) {
        this.id = id;
        this.name = name;
        this.exerciseItems = exerciseItems;
    }

    public WorkoutPlan(String name, List<Integer> exerciseItems, List<User> userList) {
        this.name = name;
        this.exerciseItems = exerciseItems;
        this.userList = userList;
    }
}
