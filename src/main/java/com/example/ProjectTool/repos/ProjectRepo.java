package com.example.ProjectTool.repos;

import com.example.ProjectTool.models.Project;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectRepo extends JpaRepository<Project, Long> {
    Project findByProjectIdentifier(String projectIdentifier);
}
