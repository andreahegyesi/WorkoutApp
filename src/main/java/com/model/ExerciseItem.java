package com.model;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.*;
@Getter
@Setter
@ToString
@Entity
@Table(name = "exerciseitems")
public class ExerciseItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "customexercise", referencedColumnName = "id")
    private CustomExercise customExercise;
    private int set;
    private int repetition;
    public ExerciseItem(){

    }

    public ExerciseItem(int id, CustomExercise customExercise, int set, int repetition) {
        this.id = id;
        this.customExercise = customExercise;
        this.set = set;
        this.repetition = repetition;
    }

    public ExerciseItem(CustomExercise customExercise, int set, int repetition) {
        this.customExercise = customExercise;
        this.set = set;
        this.repetition = repetition;
    }
}
