package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.Role;
import com.example.ProjectTool.models.User;
import com.example.ProjectTool.repos.UserRepo;
import com.example.ProjectTool.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@Controller
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepo userRepo;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/list")
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());
        return "adminControlPanelUserList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/list/{user}")
    public String userEditorForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "adminControlPanelUserEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/user/list")
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.saveUser(user, username, form);
        return "redirect:/user/list";
    }

    @GetMapping("/user")
    public String userMappingRedirect() {
        return "redirect:/userlist";
    }

    @GetMapping("/user/change")
    public String getChangeMyProfileData() {
        return "userProfileChangeData";
    }

    @PostMapping("/user/change")
    public String postChangeMyProfileData(@AuthenticationPrincipal User user,
                                          @RequestParam String password,
                                          @RequestParam String email,
                                          Model model
    ) {
        userService.changeUserData(user, password, email);
        if (!password.isEmpty()) {
            model.addAttribute("changePasswordMessage", "Пароль успешно изменен!");
        }
        if (!email.isEmpty() && !email.equals(user.getEmail())) {
            model.addAttribute("changeEmailMessage", "Письмо с подтверждением отправлено на вашу почту!");
        }
        return "userProfileChangeData";
    }

    @GetMapping("/user/{id}")
    public String getUserProfile(Model model,
                                 @PathVariable String id,
                                 @AuthenticationPrincipal User user
    ) {
        try {
            long userId = Long.parseLong(id);
            if (userRepo.findById(userId) == null) {
                return "redirect:/home";
            }

            User userProfile = userRepo.findById(userId);
            userService.returnUserProfileData(userProfile, model);

        } catch (NumberFormatException e) {
            return "redirect:/home";
        }

        return "userProfile";
    }
}
