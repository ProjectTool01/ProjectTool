package com.example.ProjectTool.repos;

import com.example.ProjectTool.models.Project;
import com.example.ProjectTool.models.User;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Set;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String Username);
    User findByActivationCode(String code);
    User findById(long id);

    @Query(value = "SELECT u FROM User u WHERE LOWER(u.username) LIKE %:user_name% ORDER BY u.username")
    List<User> findUsersByUsername(@Param("user_name") String username);

}