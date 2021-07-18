package com.example.practice.service;


import com.example.practice.entity.Mark;
import com.example.practice.entity.Project;
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

    public void addNewMark(Mark mark) {
        markRepository.save(mark);
    }

    public List <Mark> getAllMarks(){return markRepository.findAll();}

    public Mark getMarkById(Long id) {
        return markRepository.findMarkById(id);
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
