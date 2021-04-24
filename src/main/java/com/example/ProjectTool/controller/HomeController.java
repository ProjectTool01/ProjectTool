package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.User;
import com.example.ProjectTool.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
public class HomeController {

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/")
    public String greeting(Model model) {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("message", "Тут будет главная страница");
        return "home";
    }

    @GetMapping("/userlist")
    public String getUserList(Model model, @RequestParam(required = false, defaultValue = "") String username) {
        List<User> users = userRepo.findAll();
        if (!username.isEmpty()) {
            users = userRepo.findUsersByUsername(username.toLowerCase());
        }

        model.addAttribute("filter", username);
        model.addAttribute("users", users);
        return "allUsers";
    }

    @GetMapping("/message")
    public String getUserMessage(Model model){

        return null;
    }
}
