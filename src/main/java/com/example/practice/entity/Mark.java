package com.example.practice.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;

import javax.persistence.Entity;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "t_mark")
public class Mark {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Setter
    @Getter
    private Long id;

    @Getter
    @Setter
    @Transient
    @ManyToMany(mappedBy = "marks")
    private Set<Ticket> tickets;


    @Setter
    @Getter
    @Size(min = 3, max=256, message = "Минимум 3 символа")
    private String name;

    public Mark() {

    }

    public Mark(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public Mark(Long id) {
        this.id = id;
    }
}

