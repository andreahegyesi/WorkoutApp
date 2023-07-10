package com.model;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
@Getter
@Setter
@ToString
@Entity
@Table(name = "exercises")
public class WgerExercise {
    @Id
    private int id;
    private String name;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "category", referencedColumnName = "id")
    private Category category;
    private String description;
    private ArrayList<Integer> muscles;
    private ArrayList<Integer> secondaryMuscles;
    private ArrayList<Integer> equipment;


    public WgerExercise(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public WgerExercise() {
    }

    public WgerExercise(String name) {
        this.name = name;
    }

    public WgerExercise(int id, String name, Category category, String description, ArrayList<Integer> muscles, ArrayList<Integer> secondaryMuscles, ArrayList<Integer> equipment) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.muscles = muscles;
        this.secondaryMuscles = secondaryMuscles;
        this.equipment = equipment;
    }

}
