package com.example.withus.mapper;

import com.example.withus.vo.ScheduleVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ScheduleMapper {
    List<ScheduleVo> getScheduleList(Integer mbr_sn);

    void insertSchedule(ScheduleVo scheduleVo);
}
