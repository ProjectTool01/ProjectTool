package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {

    @GetMapping("/login")
    public ModelAndView getLogin(@RequestParam(name = "error", required = false) String error,
                                 @AuthenticationPrincipal User user) {

        ModelAndView modelAndView = new ModelAndView("login");
        if (user != null) {
            modelAndView = new ModelAndView("redirect:/home");
            return modelAndView;
        }

        if (error != null) {
            modelAndView.addObject("message", "Неверный логин или пароль!");
            return modelAndView;
        }

        return modelAndView;
    }
}
