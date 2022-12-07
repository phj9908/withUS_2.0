package com.example.withus.service;

import com.example.withus.mapper.MapMapper;
import com.example.withus.vo.MapVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MapServiceImpl implements MapService{

    private final MapMapper mapMapper;
    @Override
    public void upload(MapVo mapVo) {
        mapMapper.insertMap(mapVo);
    }
    @Override
    public List<MapVo> getMapList(Integer mapListGroup){
        return mapMapper.getMapList(mapListGroup);
    }
}
