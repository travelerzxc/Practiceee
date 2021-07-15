package com.example.practice.service;

import com.example.practice.entity.Project;
import com.example.practice.entity.Ticket;
import com.example.practice.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class ProjectService {

    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    TicketService ticketService;

    public void addNewProject(Project project) { projectRepository.save(project);}

    public Project ProjectByUserId(Long id) {return projectRepository.findProjectByUserId(id);}

    public Project getProjectById(Long id){return projectRepository.findProjectById(id);}

    public List<Project> getAllUserProjects(Long userId) { return projectRepository.findAllByUserId(userId);}

    public List <Project> getAllProjects(){return projectRepository.findAll();}

    public List <Project> searchProjectsByName( String name ) {
        List <Project> projectsList = new ArrayList<>();
        projectsList = projectRepository.findProjectsByNameContains(name);
        return projectsList;
    }
    public boolean deleteProject(Long projectId) {
        boolean isProjectExist = projectRepository.existsById(projectId);

        if (isProjectExist) {
            deleteAllProjectTickets(projectId);
            projectRepository.deleteById(projectId);
            return true;
        }
        return false;
    }
    private void deleteAllProjectTickets(Long projectId){
        List <Ticket> tickets = ticketService.getAllProjectTickets(projectId);

        for (Ticket ticket : tickets) {
            ticketService.deleteTicket(ticket.getId());
        }
    }
}





