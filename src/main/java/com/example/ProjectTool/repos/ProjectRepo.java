package com.example.ProjectTool.repos;

import com.example.ProjectTool.models.Project;
import com.example.ProjectTool.models.User;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectRepo extends JpaRepository<Project, Long> {
    Project findByProjectIdentifier(String projectIdentifier);
    Project findByProjectOwner(User user);
    Project findById(long id);
}
