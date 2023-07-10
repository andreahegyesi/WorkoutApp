package com.model;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
@Getter
@Setter
@ToString
@Entity
@Table(name = "categories")
public class Category {
    @Id
    private int id;
    private String name;

    public Category(){

    }

    public Category(int id, String name) {
        this.id = id;
        this.name = name;
    }
}
