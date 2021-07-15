package com.example.practice.repository;


import com.example.practice.entity.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TicketRepository extends JpaRepository<Ticket,Long> {
    Ticket findTicketById(Long id);
    Ticket findAllByProjectId(Long projectId);
    List <Ticket> findTicketsByProjectId(Long projectId);
}
