package com.example.ProjectTool.repos;

import com.example.ProjectTool.models.Message;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepo extends JpaRepository<Message, Long> {
}
