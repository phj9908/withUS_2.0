package com.example.withus.service;

import com.example.withus.vo.ScheduleVo;

import java.util.List;

public interface ScheduleService {


    public List<ScheduleVo> getScheduleList(Integer mbr_sn);

    public void insertSchedule(ScheduleVo scheduleVo);


}
