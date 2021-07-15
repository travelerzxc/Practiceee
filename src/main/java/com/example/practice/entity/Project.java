package com.example.practice.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Table(name= "t_project")
public class Project {
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    @Setter
    @Getter
    private Long id;

    @Getter
    @Setter
    @ManyToOne(optional = false,cascade = CascadeType.DETACH)
    @JoinColumn(name = "user_id")
    private User user;

    @Getter
    @Setter
    @Size(min = 3, message = "Минимум 3 символа")
    private String name;


    @Getter
    @Setter
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date creatingDate;

     @Getter
     @Setter
     private String description;

    public Project () {
    }

}
