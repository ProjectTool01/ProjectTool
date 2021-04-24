package com.example.ProjectTool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String getLogin(@RequestParam(name = "error", required = false) String error, Model model){

        if(error != null){
            model.addAttribute("message", "Неверный логин или пароль!");
            return "login";
        }

        return "login";
    }
}
