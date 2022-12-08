package com.example.withus.Controller;

import com.example.withus.service.PostServiceImpl;
import com.example.withus.service.UserService;
import com.example.withus.service.UserServiceImpl;
import com.example.withus.vo.LoginResponse;
import com.example.withus.vo.PostVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private PostServiceImpl postServiceImpl;

    @RequestMapping("/")
    public String firstPage() {
        return "first";
    }

//    @RequestMapping("/post")
//    public String postPage() {
//        return "post";
//    }

    @RequestMapping("/postList")
    public String postListPage() {
        return "postList";
    }

    @RequestMapping("/date")
    public String datePage() {
        return "date";
    }

    @RequestMapping("/main")
    public String postList(HttpSession session, Model model) {

        Integer group = 1;
        List<PostVo> postList = postServiceImpl.getPostList(group);
        model.addAttribute("postlist", postList);

        Integer mbr_sn = (Integer) session.getAttribute("userSn");
        List<PostVo> postmbrlist = postServiceImpl.getmbrPostList(mbr_sn);
        model.addAttribute("postmbrlist", postmbrlist);
        return "main";
    }

}