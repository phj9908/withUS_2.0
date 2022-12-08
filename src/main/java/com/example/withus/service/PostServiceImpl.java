package com.example.withus.service;

import com.example.withus.mapper.PostMapper;
import com.example.withus.vo.PostVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

    private final PostMapper postMapper;

    @Override
    public void upload(PostVo postVo) {
        int mbr_sn = postVo.getMbr_sn();

        postVo.setRgtr_id(mbr_sn);
        postVo.setRgtr_dt(LocalDateTime.now());

        postMapper.insertPost(postVo);
    }

    public List<PostVo> getPostList(Integer group) { return postMapper.getPostList(group); }
}
