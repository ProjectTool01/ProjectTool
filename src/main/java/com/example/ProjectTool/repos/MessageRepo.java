package com.example.ProjectTool.repos;

import com.example.ProjectTool.models.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MessageRepo extends JpaRepository<Message, Long> {

    @Query(value = "SELECT m FROM Message m WHERE m.toProject.id = :projectId ORDER BY m.messageTime")
    List<Message> findMessagesByProjectId(@Param("projectId") long projectId);
}
