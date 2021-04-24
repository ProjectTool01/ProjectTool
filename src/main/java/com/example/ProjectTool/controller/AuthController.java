package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String getLogin(@RequestParam(name = "error", required = false) String error,
                           @AuthenticationPrincipal User user,
                           Model model) {

        if(user != null){
            return "redirect:/home";
        }

        if (error != null) {
            model.addAttribute("message", "Неверный логин или пароль!");
            return "login";
        }

        return "login";
    }
}
