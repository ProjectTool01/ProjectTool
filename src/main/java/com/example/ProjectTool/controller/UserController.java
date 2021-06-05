package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.Role;
import com.example.ProjectTool.models.User;
import com.example.ProjectTool.repos.UserRepo;
import com.example.ProjectTool.service.UserService;
import com.example.ProjectTool.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
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
    public ModelAndView userList() {

        ModelAndView modelAndView = new ModelAndView("adminControlPanelUserList");
        modelAndView.addObject("users", userService.findAll());

        return modelAndView;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/list/{user}")
    public ModelAndView userEditorForm(@PathVariable User user) {

        ModelAndView modelAndView = new ModelAndView("adminControlPanelUserEdit");
        modelAndView.addObject("user", user);
        modelAndView.addObject("roles", Role.values());

        return modelAndView;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/user/list")
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user) {

        userService.saveUser(user, username, form);

        return "redirect:/user/list";
    }

    @GetMapping("/userlist")
    public ModelAndView userMappingRedirect(@RequestParam(required = false, defaultValue = "") String username,
                                            @RequestParam(required = false, defaultValue = "") String uid) {

        ModelAndView modelAndView = new ModelAndView("userlist");
        List<User> users = userRepo.findAll();
        if (!username.isEmpty()) {
            users = userRepo.findUsersByUsername(username.toLowerCase());
        }
        modelAndView.addObject("filter", username);
        modelAndView.addObject("users", users);
        if(!uid.isEmpty()){
            try {
                long userId = Long.parseLong(uid);
                User user = userRepo.findById(userId);
                modelAndView.addObject("usercard", user);
            } catch (NumberFormatException e) {
                modelAndView.setViewName("redirect:/userlist");
            }
        }

        return modelAndView;
    }

    @GetMapping("/settings")
    public String getChangeMyProfileData() {
        return "userProfileChangeData";
    }

    @PostMapping("/settings")
    public ModelAndView postChangeMyProfileData(@AuthenticationPrincipal User user,
                                                @RequestParam String password,
                                                @RequestParam String email,
                                                @RequestParam("file") MultipartFile file) {

        ModelAndView modelAndView = new ModelAndView("redirect:/home");
        userService.changeUserData(user, password, email, file);
        if (!password.isEmpty()) {
            modelAndView.addObject("changePasswordMessage", "Пароль успешно изменен!");
        }
        if (!email.isEmpty() && !email.equals(user.getEmail())) {
            modelAndView.addObject("changeEmailMessage", "Письмо с подтверждением отправлено на вашу почту!");
        }
        if (!file.isEmpty() && StringHelper.isImage(file.getOriginalFilename())) {
            modelAndView.addObject("changeAvatarMessage", "Аватар успешно изменен!");
        } else if (!StringHelper.isImage(file.getOriginalFilename())) {
            modelAndView.addObject("changeAvatarMessage", "Некорректный файл!");
        }

        return modelAndView;
    }

    @GetMapping("/id{id}")
    public String getUserProfile(Model model, @PathVariable String id) {

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
