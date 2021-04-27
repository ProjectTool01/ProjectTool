package com.example.ProjectTool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {

    @GetMapping("/")
    public String greeting() {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public ModelAndView home() {

        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("message", "Тут будет главная страница");

        return modelAndView;
    }
}
