package com.example.ProjectTool.models;

import javax.persistence.*;

@Entity
@Table(name = "task")
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "task_starter_id")
    private User taskStarter;

    @OneToOne
    @JoinColumn(name = "task_owner_id")
    private User taskOwner;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE, CascadeType.REFRESH})
    @JoinColumn(name = "project_id")
    private Project project;

    private String name;
    private String taskText;
    private Status status;
    private boolean deleted;

    public Task() {
    }

    public Task(Project project, User taskStarter, String name, String taskText) {
        this.taskStarter = taskStarter;
        this.project = project;
        this.name = name;
        this.taskText = taskText;
        this.status = Status.NEW;
        this.deleted = false;
    }

    public User getTaskOwner() {
        return taskOwner;
    }

    public void setTaskOwner(User taskOwner) {
        this.taskOwner = taskOwner;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public String getTaskText() {
        return taskText;
    }

    public void setTaskText(String taskText) {
        this.taskText = taskText;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public User getTaskStarter() {
        return taskStarter;
    }

    public void setTaskStarter(User taskStarter) {
        this.taskStarter = taskStarter;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
