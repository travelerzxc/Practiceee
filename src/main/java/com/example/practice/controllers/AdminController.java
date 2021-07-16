package com.example.practice.controllers;

import com.example.practice.entity.Mark;
import com.example.practice.entity.Project;
import com.example.practice.entity.User;
import com.example.practice.service.MarkService;
import com.example.practice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Date;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private MarkService markService;

    @GetMapping("/admin")
    public String userList(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "admin";
    }

    @PostMapping("/admin")
    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) Long userId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            userService.deleteUser(userId);
        }
        return "redirect:/admin";
    }

    @GetMapping("/admin/gt/{userId}")
    public String  gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "admin";
    }

    @GetMapping("/tagTypes")
    public String tagList(Model model) {
      model.addAttribute("tagForm", new Mark());
      model.addAttribute("existingTags", markService.getAllMarks());
        return "allTagTypes";
    }

    @PostMapping("/tagTypes")
    public String addMarks(@ModelAttribute("tagForm") @Valid Mark markCreate,
                                BindingResult bindingResult,
                                Model model) throws Exception {


        if (bindingResult.hasErrors()) {
            return "redirect:/tagTypes";
        }

        if (markCreate.getName().isEmpty()) {
            model.addAttribute("nameError", "Название не может быть пустым!");
            return "redirect:/tagTypes";
        }

        if (bindingResult.hasErrors()) {
            throw new Exception("Не удалось создать тэг, обратитесь к администратору. " + bindingResult.toString());
        }

        markService.addNewMark(markCreate);

        return "redirect:/tagTypes";
    }

    @PostMapping("/tagTypes/{id}")
    public String  deleteTag(@RequestParam(required = true, defaultValue = "" ) Long tagId,
                                 @RequestParam(required = true, defaultValue = "" ) String action,
                                 Model model) {
        if (action.equals("delete")){

            markService.deleteMark(tagId);
        }
        return "redirect:/tagTypes";
    }
}


