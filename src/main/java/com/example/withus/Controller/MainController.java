package com.example.withus.Controller;

import com.example.withus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String firstPage() {
        return "first";
    }

    @RequestMapping("/post")
    public String postPage() {
        return "post";
    }
}