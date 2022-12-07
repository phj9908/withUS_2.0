package com.example.withus.Controller;

import com.example.withus.service.PostServiceImpl;
import com.example.withus.vo.PostVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class PostController {
    @Autowired
    private PostServiceImpl postServiceImpl;

    @GetMapping("/post")
    public String toPost() {  //회원가입 페이지
        return "post";
    }

    @PostMapping("/post")
    public String postUpload(PostVo postVo) {
        try {
            postServiceImpl.upload(postVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/main";
    }

    @RequestMapping("/main")
    public String postList(Model model) {
        Integer group = 1;
        List<PostVo> postList = postServiceImpl.getPostList(group);
        System.out.println(postList);
        model.addAttribute("postlist", postList);
        return "main";
    }
}
