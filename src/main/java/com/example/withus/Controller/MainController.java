package com.example.withus.Controller;

import com.example.withus.service.UserService;
import com.example.withus.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String firstPage() {
        return "first";
    }
    @RequestMapping("/main")
    public String mainPage() {

        return "main";
    }

    @RequestMapping("/post")
    public String postPage() {

        return "post";
    }
}