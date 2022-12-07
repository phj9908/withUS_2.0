package com.example.withus.mapper;

import com.example.withus.vo.MapVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MapMapper {
    List<MapVo> getMapList(Integer mapListGroup); // 테이블 가져오기
    void insertMap(MapVo mapVo);
}
