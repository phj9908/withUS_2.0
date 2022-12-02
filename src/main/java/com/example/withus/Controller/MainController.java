package com.example.withus.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/main")
    public String mainPage() {

        return "mainPage";
    }

    @RequestMapping("/post")
    public String postPage() {

        return "post";
    }

}