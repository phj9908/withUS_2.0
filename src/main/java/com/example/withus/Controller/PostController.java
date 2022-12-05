package com.example.withus.Controller;

import com.example.withus.service.PostService;
import com.example.withus.vo.PostVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PostController {

    @Autowired
    private PostService postService;


    @GetMapping("/post")
    public String toPost() {  //회원가입 페이지
        return "post";
    }

    @PostMapping("/post")
    public String postUpload(PostVo postVo) {
        try {
            postService.upload(postVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/main";
    }


}
