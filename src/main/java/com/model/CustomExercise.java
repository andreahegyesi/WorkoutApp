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
@Table(name = "myexercises")
public class CustomExercise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "category", referencedColumnName = "id")
    private Category category;
    private String description;

    private ArrayList<Integer> muscles;
    private ArrayList<Integer> secondaryMuscles;
    private ArrayList<Integer> equipment;
    private String imageSource;

    public CustomExercise() {
    }

    public CustomExercise(int id, String name, Category category, String description, ArrayList<Integer> muscles, ArrayList<Integer> secondaryMuscles, ArrayList<Integer> equipment, String imageSource) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.muscles = muscles;
        this.secondaryMuscles = secondaryMuscles;
        this.equipment = equipment;
        this.imageSource = imageSource;
    }

    public CustomExercise(String name, Category category, String description, ArrayList<Integer> muscles, ArrayList<Integer> secondaryMuscles, ArrayList<Integer> equipment, String imageSource) {
        this.name = name;
        this.category = category;
        this.description = description;
        this.muscles = muscles;
        this.secondaryMuscles = secondaryMuscles;
        this.equipment = equipment;
        this.imageSource = imageSource;
    }
}
