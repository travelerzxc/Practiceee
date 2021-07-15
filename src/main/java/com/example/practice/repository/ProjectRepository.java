package com.example.practice.repository;


import com.example.practice.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepository extends JpaRepository<Project,Long> {
    Project findProjectById(Long id);
    Project findProjectByUserId(Long userId);
    Project findProjectByName(String name);
    List<Project> findAllByUserId(Long userId);
    List<Project> findProjectsByNameContains(String name);
}
