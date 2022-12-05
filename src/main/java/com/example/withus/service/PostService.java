package com.example.withus.service;

import com.example.withus.mapper.PostMapper;
import com.example.withus.mapper.UserMapper;
import com.example.withus.vo.PostVo;
import com.example.withus.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {
    @Autowired
    private PostMapper postMapper;
    private UserMapper userMapper;

    public List<PostVo> getPostList() {
        return postMapper.getPostList();
    }
    public void upload(PostVo postVo) {
        postMapper.insertPost(postVo);
    }
}