package com.example.withus.service;

import com.example.withus.vo.MapVo;

import java.util.List;

public interface MapService {
    void upload(MapVo mapVo);
    List<MapVo> getMapList(Integer mapListGroup);
}
