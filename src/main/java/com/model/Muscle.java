package com.model;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@Entity
@Table(name = "muscles")
public class Muscle {
    @Id
    private int id;
    private String name;

    public Muscle(int id, String name) {
        this.id = id;
        this.name = name;
    }
}
