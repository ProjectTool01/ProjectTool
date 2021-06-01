package com.example.ProjectTool.controller;

import com.example.ProjectTool.models.Message;
import com.example.ProjectTool.models.Project;
import com.example.ProjectTool.models.Task;
import com.example.ProjectTool.models.User;
import com.example.ProjectTool.repos.MessageRepo;
import com.example.ProjectTool.repos.ProjectRepo;
import com.example.ProjectTool.repos.TaskRepo;
import com.example.ProjectTool.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Set;

@Controller
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
public class ProjectController {

    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private ProjectRepo projectRepo;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private TaskRepo taskRepo;

    @GetMapping("/projects")
    public ModelAndView getProjects(@AuthenticationPrincipal User user,
                                    @RequestParam(required = false, defaultValue = "") String err) {

        ModelAndView modelAndView = new ModelAndView("projects");
        Set<Project> projects = user.getProjects();
        modelAndView.addObject("projects", projects);
        switch (err) {
            case "1":
                modelAndView.addObject("message", "Имя и описание не должны быть пустыми!");
                break;
            case "2":
                modelAndView.addObject("message", "Такого проекта не существует!");
                break;
            case "3":
                modelAndView.addObject("message", "Вы не состоите в этом проекте!");
                break;
            case "":
                break;
            default:
                modelAndView.addObject("message", "Неизвестная ошибка: " + err + "!");
                break;
        }
        return modelAndView;
    }

    @GetMapping("/project{id}")
    public ModelAndView getProject(@PathVariable String id,
                                   @AuthenticationPrincipal User user) {

        ModelAndView modelAndView = new ModelAndView("redirect:projects");
        try {
            long projectId = Long.parseLong(id);
            if (projectRepo.findById(projectId) == null) {
                modelAndView.addObject("err", "2");
                return modelAndView;
            }
            if (!user.getProjects().contains(projectRepo.findById(projectId))) {
                modelAndView.addObject("err", "3");
                return modelAndView;
            }
            List<Task> tasks = taskRepo.findAllByProject(projectRepo.findById(projectId));
            List<Message> messages = messageRepo.findMessagesByProjectId(projectId);
            modelAndView.setViewName("projectPage");
            modelAndView.addObject("tasks", tasks);
            modelAndView.addObject("messages", messages);
            modelAndView.addObject("project", projectRepo.findById(projectId));

        } catch (NumberFormatException e) {
            modelAndView.addObject("err", "2");
            return modelAndView;
        }
        return modelAndView;
    }

    @PostMapping("/addProject")
    public ModelAndView postAddProjects(@AuthenticationPrincipal User user,
                                        @RequestParam String projectIdentifier) {

        ModelAndView modelAndView = new ModelAndView("redirect:/home");
        if (projectRepo.findByProjectIdentifier(projectIdentifier) == null) {
            modelAndView.addObject("err", "2");
        } else {
            projectService.addProject(user, projectIdentifier);
        }
        return modelAndView;
    }

    @PostMapping("/createProject")
    public ModelAndView postCreateProject(@AuthenticationPrincipal User user,
                                          @RequestParam String name,
                                          @RequestParam String text) {


        ModelAndView modelAndView = new ModelAndView("redirect:/home");

        if (!name.isEmpty() && !text.isEmpty()) {
            projectService.createProject(user, name, text);
        } else {
            modelAndView.addObject("err", "1");
        }
        return modelAndView;
    }

    @PostMapping("/createTask")
    public String postCreateTask(@AuthenticationPrincipal User user,
                                 @RequestParam String name,
                                 @RequestParam String text,
                                 @RequestParam String id) {

        long projectId = Long.parseLong(id);
        Project project = projectRepo.findById(projectId);
        projectService.createTask(project, user, name, text);
        return "redirect:/tasks?pid=" + id;
    }

    @PostMapping("/takeTask")
    public String postTakeTask(@AuthenticationPrincipal User user,
                                     @RequestParam String taskId,
                                     @RequestParam String projectId){

        Project project = projectRepo.findById(Long.parseLong(projectId));
        Task task = taskRepo.findById(Long.parseLong(taskId));
        projectService.takeTask(task, user);
        return "redirect:/tasks?pid=" + project.getId();
    }

    @PostMapping("/doneTask")
    public String postDoneTask(@RequestParam String taskId,
                               @RequestParam String projectId){

        Project project = projectRepo.findById(Long.parseLong(projectId));
        Task task = taskRepo.findById(Long.parseLong(taskId));
        projectService.doneTask(task);
        return "redirect:/tasks?pid=" + project.getId();
    }

    @PostMapping("/sendMessage")
    public String postSendMessage(@AuthenticationPrincipal User user,
                                  @RequestParam String text,
                                  @RequestParam String id){

        long projectId = Long.parseLong(id);
        Project project = projectRepo.findById(projectId);
        if(!text.isEmpty() && project != null){
            projectService.addMessage(project, user, text);
        }
        return "redirect:/messages?pid=" + id;
    }

    @PostMapping("/deleteProject")
    public String postDeleteProject(@AuthenticationPrincipal User user,
                                    @RequestParam String id){

        long projectId = Long.parseLong(id);
        Project project = projectRepo.findById(projectId);
        if(project != null && project.getProjectOwner().getId() == user.getId()){
            projectService.deleteProject(project);
        }
        return "redirect:/projects?pid=" + id;
    }

    @GetMapping("/messages")
    public ModelAndView getMessages(@RequestParam(defaultValue = "", required = false) String pid,
                             @AuthenticationPrincipal User user) {

        ModelAndView modelAndView = new ModelAndView("messages");
        Set<Project> projects = user.getProjects();
        modelAndView.addObject("projects", projects);
        if(!pid.isEmpty()){
            long projectId = Long.parseLong(pid);
            if (!user.getProjects().contains(projectRepo.findById(projectId))) {
                modelAndView.setViewName("redirect:/messages");
                return modelAndView;
            }
            Project project = projectRepo.findById(projectId);
            modelAndView.addObject("project", project);
            List<Message> messages = messageRepo.findMessagesByProjectId(projectId);
            modelAndView.addObject("messages", messages);
        }
        return modelAndView;
    }

    @GetMapping("/tasks")
    public ModelAndView getTasks(@RequestParam(defaultValue = "", required = false) String pid,
                             @AuthenticationPrincipal User user) {

        ModelAndView modelAndView = new ModelAndView("tasks");
        Set<Project> projects = user.getProjects();
        modelAndView.addObject("projects", projects);
        if(!pid.isEmpty()){
            long projectId = Long.parseLong(pid);
            if (!user.getProjects().contains(projectRepo.findById(projectId))) {
                modelAndView.setViewName("redirect:/tasks");
                return modelAndView;
            }
            Project project = projectRepo.findById(projectId);
            modelAndView.addObject("project", project);
            List<Task> tasks = taskRepo.findAllByProject(projectRepo.findById(projectId));
            modelAndView.addObject("tasks", tasks);
        }
        return modelAndView;
    }

}
