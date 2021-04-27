package com.example.ProjectTool.models;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "project")
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne
    @JoinColumn(name = "project_owner_id")
    private User projectOwner;

    private String name;

    @Column(name = "project_identifier")
    private String projectIdentifier;

    @ManyToMany(mappedBy = "projects",
            cascade = {CascadeType.PERSIST, CascadeType.REMOVE, CascadeType.REFRESH},
            fetch = FetchType.EAGER)
    private Set<User> users = new HashSet<>();

    private String projectText;
    private boolean deleted;

    public Project() {
    }

    public Project(User projectOwner, String name, String projectText) {
        this.projectOwner = projectOwner;
        this.name = name;
        this.projectText = projectText;
        this.deleted = false;
        this.projectIdentifier = UUID.randomUUID().toString().replace("-", "");
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProjectIdentifier() {
        return projectIdentifier;
    }

    public void setProjectIdentifier(String projectIdentifier) {
        this.projectIdentifier = projectIdentifier;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", users=" + users +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Project project = (Project) o;
        return id == project.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
