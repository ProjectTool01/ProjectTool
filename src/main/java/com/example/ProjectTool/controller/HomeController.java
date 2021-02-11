package com.example.ProjectTool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class HomeController {

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("message", "Тут будет главная страница");
        return "home";
    }

}
