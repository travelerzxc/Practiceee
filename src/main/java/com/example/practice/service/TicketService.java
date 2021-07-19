package com.example.practice.service;

import com.example.practice.entity.Mark;
import com.example.practice.entity.Ticket;
import com.example.practice.repository.ProjectRepository;
import com.example.practice.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class TicketService {
    @Autowired
    TicketRepository ticketRepository;

    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    MarkService markService;


    public void addNewTicket(Ticket ticket) {
        ticketRepository.save(ticket);
    }

   public List <Ticket> getAllProjectTickets(Long projectId){
        return ticketRepository.findTicketsByProjectId(projectId);
   }

   public Ticket getTicketById(Long ticketId) {
        return  ticketRepository.findTicketById(ticketId);
   }


    public boolean deleteTicket(Long ticketId) {
        boolean isTicketExist = ticketRepository.existsById(ticketId);

        if (isTicketExist) {
            ticketRepository.deleteById(ticketId);
            return true;
        }

        return false;
    }

    public List<Ticket> getAllUserTickets(Long userId) {
        return ticketRepository.findAllByUserId(userId);
    }

    public void deleteMarkInTicket(Long markId) {
        List <Ticket> tickets = ticketRepository.findAll();

        for (Ticket ticket : tickets) {
            Set<Mark> marksOfTicket = ticket.getMarks();
            marksOfTicket.remove(markService.getMarkById(markId));
            ticket.setMarks(marksOfTicket);
            addNewTicket(ticket);
        }

    }

}



