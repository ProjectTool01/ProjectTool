package com.example.ProjectTool.service;

import com.example.ProjectTool.models.*;
import com.example.ProjectTool.repos.MessageRepo;
import com.example.ProjectTool.repos.ProjectRepo;
import com.example.ProjectTool.repos.TaskRepo;
import com.example.ProjectTool.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
public class ProjectService {

    @Autowired
    private TaskRepo taskRepo;

    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private ProjectRepo projectRepo;

    @Autowired
    private UserRepo userRepo;

    public void createProject(User user, String name, String text) {
        Project project = new Project(user, name, text);
        projectRepo.save(project);
        user.getProjects().add(project);
        Set<Project> projects = new HashSet<>(user.getProjects());
        user.getProjects().clear();
        userRepo.save(user);
        user.setProjects(projects);
        userRepo.save(user);
    }

    public void addProject(User user, String projectIdentifier) {
        user.getProjects().add(projectRepo.findByProjectIdentifier(projectIdentifier));
        Set<Project> projects = new HashSet<>(user.getProjects());
        user.getProjects().clear();
        userRepo.save(user);
        user.setProjects(projects);
        userRepo.save(user);
    }

    public void addMessage(Project project, User user, String text) {
        Message message = new Message(project, user, text);
        messageRepo.save(message);
    }

    public void createTask(Project project, User user, String name, String text) {
        Task task = new Task(project, user, name, text);
        taskRepo.save(task);
    }

    public void takeTask(Task task, User user){
        task.setTaskOwner(user);
        task.setStatus(Status.TAKEN);
        taskRepo.save(task);
    }

    public void doneTask(Task task){
        task.setStatus(Status.DONE);
        taskRepo.save(task);
    }

    public void deleteProject(Project project) {
        project.setDeleted(true);
        projectRepo.save(project);
    }
}
