package com.example.withus.service;

import com.example.withus.mapper.ScheduleMapper;
import com.example.withus.vo.ScheduleVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl {
    private final ScheduleMapper scheduleMapper;
    public List<ScheduleVo> getScheduleList(Integer mbr_sn){
        return scheduleMapper.getScheduleList(mbr_sn);

    }

    public void insertSchedule(ScheduleVo scheduleVo){

        scheduleMapper.insertSchedule(scheduleVo);

    }

}
