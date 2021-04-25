package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.User;
import com.example.ProjectTool.repos.UserRepo;
import com.example.ProjectTool.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
public class HomeController {

    @GetMapping("/")
    public String greeting() {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("message", "Тут будет главная страница");
        return "home";
    }

    @GetMapping("/message")
    public String getUserMessage(){

        return null;
    }
}
