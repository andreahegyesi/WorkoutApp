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
@Table(name = "equipment")
public class Equipment {
    @Id
    private int id;
    private String name;

    public Equipment(){

    }

    public Equipment(int id, String name) {
        this.id = id;
        this.name = name;
    }
}
