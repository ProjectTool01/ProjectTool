package com.example.ProjectTool.models;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "project")
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "project_owner_id")
    private User projectOwner;

    @ManyToMany
    @JoinTable(
            name = "user_project",
            joinColumns = {@JoinColumn(name = "project_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")}
    )
    private Set<User> users = new HashSet<>();

    private String projectText;
    private boolean deleted;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getProjectOwner() {
        return projectOwner;
    }

    public void setProjectOwner(User projectOwner) {
        this.projectOwner = projectOwner;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public String getProjectText() {
        return projectText;
    }

    public void setProjectText(String projectText) {
        this.projectText = projectText;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
