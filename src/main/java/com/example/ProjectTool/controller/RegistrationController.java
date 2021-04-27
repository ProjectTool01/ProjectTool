package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.User;
import com.example.ProjectTool.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
public class RegistrationController {
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration(@AuthenticationPrincipal User user) {

        if (user != null) {
            return "redirect:/home";
        }

        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model) {

        if (!userService.addUser(user)) {
            model.addAttribute("message", "User Exists!");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public ModelAndView activate(@PathVariable String code) {

        ModelAndView modelAndView = new ModelAndView("login");
        boolean isActivate = userService.activateUser(code);
        if (isActivate) {
            modelAndView.addObject("message", "Учетная запись активирована!");
        } else {
            modelAndView.addObject("message", "Код активации не найден");
        }

        return modelAndView;
    }
}
