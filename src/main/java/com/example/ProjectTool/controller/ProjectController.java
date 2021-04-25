package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.Project;
import com.example.ProjectTool.models.User;
import com.example.ProjectTool.repos.ProjectRepo;
import com.example.ProjectTool.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Set;

@Controller
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
public class ProjectController {

    @Autowired
    UserRepo userRepo;

    @Autowired
    ProjectRepo projectRepo;

    @GetMapping("/projects")
    public ModelAndView getProjects(@AuthenticationPrincipal User user) {
        ModelAndView modelAndView = new ModelAndView("projects");
        Set<Project> projects = user.getProjects();
        modelAndView.addObject("projects", projects);
        return modelAndView;
    }

    @PostMapping("/projects/add")
    public ModelAndView postAddProjects(@AuthenticationPrincipal User user,
                                        @RequestParam String projectIdentifier) {

        ModelAndView modelAndView = new ModelAndView("redirect:/projects");
        if (projectRepo.findByProjectIdentifier(projectIdentifier) == null) {
            modelAndView.addObject("message", "Такого проекта не существует!");
        } else {
            user.addProjects(projectRepo.findByProjectIdentifier(projectIdentifier));
            userRepo.save(user);
            modelAndView.addObject("message", "Вы вступили в проект " +
                    projectRepo.findByProjectIdentifier(projectIdentifier).getName());
        }

        return modelAndView;
    }

    @PostMapping("/projects/create")
    public ModelAndView postCreateProject(@AuthenticationPrincipal User user,
                                          @RequestParam String name,
                                          @RequestParam String text){

        ModelAndView modelAndView = new ModelAndView("redirect:/projects");
        return modelAndView;
    }

}
