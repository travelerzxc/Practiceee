package com.example.practice.service;


import com.example.practice.entity.Mark;
import com.example.practice.entity.Ticket;
import com.example.practice.repository.MarkRepository;
import com.example.practice.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MarkService {

    @Autowired
    MarkRepository markRepository;

    @Autowired
    TicketRepository ticketRepository;

    private void addNewMark(Mark mark) {
        markRepository.save(mark);
    }

    private List<Mark> getAllTicketMarks(Long ticketId){
        return markRepository.findMarksByTicketId(ticketId);

    }
    public boolean deleteMark(Long markId) {
        boolean isMarkExist = markRepository.existsById(markId);

        if (isMarkExist) {
            markRepository.deleteById(markId);
            return true;
        }

        return false;
    }
}
