package com.example.ProjectTool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


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

}
