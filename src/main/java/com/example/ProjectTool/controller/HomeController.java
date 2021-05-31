package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.Project;
import com.example.ProjectTool.models.Task;
import com.example.ProjectTool.models.User;
import com.example.ProjectTool.repos.ProjectRepo;
import com.example.ProjectTool.repos.TaskRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Set;


@Controller
public class HomeController {

    @Autowired
    private ProjectRepo projectRepo;

    @Autowired
    private TaskRepo taskRepo;

    @GetMapping("/")
    public String greeting() {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public ModelAndView home(@RequestParam(defaultValue = "", required = false) String pid,
                             @AuthenticationPrincipal User user) {

        ModelAndView modelAndView = new ModelAndView("home");
        Set<Project> projects = user.getProjects();
        modelAndView.addObject("projects", projects);

        if(!pid.isEmpty()){
            long projectId = Long.parseLong(pid);
            if (!user.getProjects().contains(projectRepo.findById(projectId))) {
                modelAndView.setViewName("redirect:/home");
                return modelAndView;
            }
            Project project = projectRepo.findById(projectId);
            modelAndView.addObject("project", project);
            List<Task> tasks = taskRepo.findAllByProjectOrderById(projectRepo.findById(projectId));
            modelAndView.addObject("tasks", tasks);
        }

        return modelAndView;
    }
}
