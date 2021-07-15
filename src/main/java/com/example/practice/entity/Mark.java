package com.example.practice.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;

import javax.persistence.Entity;
import javax.validation.constraints.Size;

@Entity
@Table(name= "t_mark")
public class Mark {
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    @Setter
    @Getter
    private Long id;

    @Getter
    @Setter
    @ManyToOne(optional = false,cascade = CascadeType.DETACH)
    @JoinColumn(name = "ticket_id")
    private Ticket ticket;


    @Setter
    @Getter
    @Size(min=3,message = "Минимум 3 символа")
    private String name;

    public Mark(){

    }

}
