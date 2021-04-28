package com.example.ProjectTool.repos;

import com.example.ProjectTool.models.Project;
import com.example.ProjectTool.models.Task;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepo extends JpaRepository<Task, Long> {
    List<Task> findAllByProject(Project project);
    Task findById(long id);
}
