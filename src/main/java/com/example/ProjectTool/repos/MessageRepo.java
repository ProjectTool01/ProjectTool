package com.example.ProjectTool.repos;

import com.example.ProjectTool.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Integer> {

}