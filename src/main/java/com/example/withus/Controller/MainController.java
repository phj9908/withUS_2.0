package com.example.withus.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/main")
    public String mainPage() {

        return "templates/mainPage.html";
    }

    @RequestMapping("/post")
    public String postPage() {

        return "templates/post.html";
    }

}