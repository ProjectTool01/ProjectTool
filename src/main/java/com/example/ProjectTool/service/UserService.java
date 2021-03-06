package com.example.ProjectTool.service;

import com.example.ProjectTool.models.Role;
import com.example.ProjectTool.models.User;
import com.example.ProjectTool.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("${upload.path}")
    private String uploadPath;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public boolean addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null) {
            return false;
        }

        user.setAvatar("defaultAvatar.jpg");
        user.setActive(false);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setNewEmail(user.getEmail());
        userRepo.save(user);
        sendMessage(user);
        return true;
    }

    private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Здравствуйте, %s! \n" +
                            "Ваша ссылка на активацию: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );
            mailSender.send(user.getEmail(), "Activation code", message);
        }
    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);
        if (user == null) {
            return false;
        }
        if (!user.getNewEmail().equals(user.getEmail())) {
            user.setEmail(user.getNewEmail());
        }
        user.setActivationCode(null);
        user.setActive(true);
        userRepo.save(user);
        return true;
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepo.save(user);
    }

    public void returnUserProfileData(User user, Model model) {
        String nameAndSurname = user.getName() + " " + user.getSurname();
        model.addAttribute("avatar", user.getAvatar());
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("name", nameAndSurname);
    }

    @SuppressWarnings("ResultOfMethodCallIgnored")
    public void changeUserData(User user, String password, String email, MultipartFile file) {
        boolean isEmailChanged = (!email.isEmpty() && !email.equals(user.getEmail()));
        if (isEmailChanged) {
            user.setNewEmail(email);
            if (!StringUtils.isEmpty(email)) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }

        if (!StringUtils.isEmpty(password)) {
            user.setPassword(passwordEncoder.encode(password));
        }

        if (file != null && !Objects.requireNonNull(file.getOriginalFilename()).isEmpty()) {

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String resultFileName = UUID.randomUUID() + "." + file.getOriginalFilename();

            try {
                file.transferTo(new File(uploadPath + resultFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }

            if (!user.getAvatar().equals("defaultAvatar.jpg")) {
                File oldAvatar = new File(uploadPath + user.getAvatar());
                oldAvatar.delete();
            }
            user.setAvatar(resultFileName);
        }

        userRepo.save(user);
        if (isEmailChanged) {
            sendMessage(user);
        }
    }
}