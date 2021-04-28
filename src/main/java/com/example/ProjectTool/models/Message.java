package com.example.ProjectTool.models;

import javax.persistence.*;
import java.sql.Timestamp;

@SuppressWarnings("ALL")
@Entity
@Table(name = "message")
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String text;

    @ManyToOne
    @JoinColumn(name = "from_user")
    private User fromUser;

    @ManyToOne
    @JoinColumn(name = "to_project")
    private Project toProject;

    @Column(name = "message_time")
    private Timestamp messageTime;

    public Message() {
    }

    public Message(Project toProject, User fromUser, String text) {
        this.text = text;
        this.fromUser = fromUser;
        this.toProject = toProject;
        this.messageTime = new Timestamp(System.currentTimeMillis());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getFromUser() {
        return fromUser;
    }

    public void setFromUser(User fromUser) {
        this.fromUser = fromUser;
    }

    public Project getToProject() {
        return toProject;
    }

    public void setToProject(Project toProject) {
        this.toProject = toProject;
    }

    public Timestamp getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Timestamp messageTime) {
        this.messageTime = messageTime;
    }
}