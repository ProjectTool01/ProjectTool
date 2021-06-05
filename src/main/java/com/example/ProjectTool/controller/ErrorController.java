package com.example.ProjectTool.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ErrorController {

    @GetMapping("/error")
    public String handleError(HttpServletRequest request) {

        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());

            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                return "redirect:/home";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return "redirect:/home";
            } else if (statusCode == HttpStatus.FORBIDDEN.value()) {
                return "redirect:/home";
            } else if (statusCode == HttpStatus.UNAUTHORIZED.value()) {
                return "redirect:/home";
            } else if (statusCode == HttpStatus.BAD_REQUEST.value()) {
                return "redirect:/home";
            }
        }
        return "redirect:/home";
    }
}
