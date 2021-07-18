package com.example.practice.controllers;


import com.example.practice.entity.Mark;
import com.example.practice.entity.Project;
import com.example.practice.entity.Ticket;
import com.example.practice.entity.User;
import com.example.practice.service.MarkService;
import com.example.practice.service.ProjectService;
import com.example.practice.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class ProjectController {
    @Autowired
    ProjectService projectService;

    @Autowired
    TicketService ticketService;

    @Autowired
    MarkService markService;

    @GetMapping("/allProjects")
    public String showAllProjects(Model model) {
        List<Project> projectList = projectService.getAllProjects();
        model.addAttribute("projectList", projectList);

        return "allProjects";
    }


    @PostMapping("/allProjects")
    public String  deleteProject(@RequestParam(required = true, defaultValue = "" ) Long projectId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
         
            projectService.deleteProject(projectId);
        }
        return "redirect:/allProjects";
    }

    @GetMapping("/project/{id}")
    public String showProject(Model model, @PathVariable("id") long id) {
        Project project = projectService.getProjectById(id);
        List <Ticket> tickets = ticketService.getAllProjectTickets(id);
        model.addAttribute("project", project);
        model.addAttribute("tickets", tickets);
        return "project";
    }

    @PostMapping("/project/{id}")
    public String  deleteTicket(@RequestParam(required = true, defaultValue = "" ) Long ticketId,
                                 @RequestParam(required = true, defaultValue = "" ) String action,
                                @PathVariable("id") long id,
                                 Model model) {
        if (action.equals("delete")){
            ticketService.deleteTicket(ticketId);
        }
         return  "redirect:/project/"+id;
    }

    @GetMapping("/createProject")
    public String createProject(Model model) {
        model.addAttribute("projectForm", new Project());
        return "projectCreate";
    }

    @PostMapping("/createProject")
    public String createProject(@ModelAttribute("projectForm") @Valid Project projectCreate,
                                BindingResult bindingResult,
                                Model model) throws Exception {

        if (bindingResult.hasErrors()) {
            return "redirect:/createProject";
        }

        if (projectCreate.getName().isEmpty()) {
            model.addAttribute("nameError", "Название не может быть пустым!");
            return "redirect:/createProject";
        }


        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) auth.getPrincipal();
        projectCreate.setUser(user);
        projectCreate.setCreatingDate(new Date());

        if (bindingResult.hasErrors()) {
            throw new Exception("Не удалось создать проект, обратитесь к администратору. " + bindingResult.toString());
        }

        projectService.addNewProject(projectCreate);

        return "redirect:/allProjects";
    }

    @GetMapping("/project/{id}/createTicket")
    public String createTicket(Model model,@PathVariable("id") long id){
        Project project = projectService.getProjectById(id);
        model.addAttribute("project", project);
        model.addAttribute("ticketForm", new Ticket());
        return "createTicket";
    }

    @PostMapping("/project/{id}/createTicket")
    public String createTicket(@ModelAttribute("ticketForm") @Valid Ticket ticket,
                               @PathVariable("id") long id,
                                BindingResult bindingResult,
                                Model model) throws Exception {
        Project project = projectService.getProjectById(id);
        if (bindingResult.hasErrors()) {
            return "/project/"+id+"/createTicket";
        }

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) auth.getPrincipal();
        ticket.setProject(project);
        ticket.setUser(user);
        ticket.setCreatingDate(new Date());

        if (bindingResult.hasErrors()) {
            throw new Exception("Не удалось создать тикет, обратитесь к администратору. " + bindingResult.toString());
        }

        ticketService.addNewTicket(ticket);

        return "redirect:/project/"+id;
    }

    @GetMapping("/project/{id}/editTicketTags/{ticketId}")
    public String editTicketTags(Model model,@PathVariable("id") long id,
                                 @PathVariable("ticketId") long ticketId){
        Project project = projectService.getProjectById(id);
        Ticket ticket = ticketService.getTicketById(ticketId);
        model.addAttribute("project", project);
        model.addAttribute("ticket", ticket);
        model.addAttribute("existingTags", markService.getAllMarks());
        return "editTicketTags";
    }

    @PostMapping("/project/{id}/editTicketTags/{ticketId}")
    public String  addTagToTicket( Model model,
                                   @RequestParam(required = true, defaultValue = "" ) Long ticketId,
                                  @RequestParam(required = true, defaultValue = "" ) Long tagId,
                                @RequestParam(required = true, defaultValue = "" ) String action,
                                @PathVariable("id") long id
                                ) {
        if (action.equals("addTagToTicket")){

            Project project = projectService.getProjectById(id);
            Ticket ticket = ticketService.getTicketById(ticketId);
            Set <Mark> marks  = ticket.getMarks();
           Mark single_mark = markService.getMarkById(tagId);
           single_mark.getName();
           marks.add(single_mark);
            marks.add(new Mark(1L, "ddd"));
            marks.add(new Mark(2L, "dddddd"));
            ticket.setMarks(marks);
            ticketService.addNewTicket(ticket);

        }

        if (action.equals("deleteTicketTag")){
            Ticket ticket = ticketService.getTicketById(ticketId);
             Mark mark = markService.getMarkById(tagId);
            Set <Mark> ticketMarks = ticket.getMarks();
            ticketMarks.remove((Object)mark);
            ticket.setMarks(ticketMarks);
            ticketService.addNewTicket(ticket);
        }
       return "redirect:/project/"+id+"/editTicketTags/"+ticketId;
    }



}
