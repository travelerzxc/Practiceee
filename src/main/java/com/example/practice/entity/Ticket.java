package com.example.practice.entity;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;


import javax.persistence.Entity;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name="t_ticket")
public class Ticket {
    @Id
    @GeneratedValue(strategy =  GenerationType.AUTO)
    @Setter
    @Getter
    private Long id;

    @Setter
    @Getter
    @Size(min = 3,max=256, message = "Минимум 3 символа")
    private String text;

    @Setter
    @Getter
    @ManyToOne(optional = false, cascade = CascadeType.DETACH)
    @JoinColumn(name = "project_id")
    private Project project;

    @Setter
    @Getter
    @ManyToOne(optional = false, cascade = CascadeType.DETACH)
    @JoinColumn(name = "user_id")
    private User user;

    @Getter
    @Setter
    @ManyToMany(fetch = FetchType.EAGER)
    private Set <Mark> marks;

    @Getter
    @Setter
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date creatingDate;


    public Ticket() {

    }
}
