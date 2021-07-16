package com.example.practice.repository;

import com.example.practice.entity.Mark;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MarkRepository extends JpaRepository<Mark, Long> {
    Mark findMarkById(Long id);
}
