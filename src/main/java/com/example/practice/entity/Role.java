package com.example.practice.entity;

import org.springframework.security.core.GrantedAuthority;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "t_role")
public class Role implements GrantedAuthority {
    @Id
    @Setter
    @Getter
    private Long id;
    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    @Transient
    @ManyToMany(mappedBy = "roles")
    private Set<User> users;

    public Role(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public Role(Long id) {
        this.id = id;
    }

    public Role() {

    }

    @Override
    public String getAuthority() {
        return getName();
    }
}




