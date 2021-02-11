package com.example.ProjectTool.repos;

import com.example.ProjectTool.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String Username);
    User findByActivationCode(String code);
}