package com.example.withus.mapper;

import com.example.withus.vo.PostVo;
import com.example.withus.vo.UserVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
    List<PostVo> getPostList(); // User 테이블 가져오기
    void insertPost(PostVo postVo);
}
