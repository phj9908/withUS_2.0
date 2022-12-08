package com.example.withus.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ScheduleVo {
    private Integer cal_sn;
    private Integer gr_sn;
    private Integer mbr_sn;
    private String cal_ttl;
    private String cal_cn;
    private String cal_str_dt;
    private String cal_end_dt;
    private String cal_loc_lat;
    private String cal_loc_lng;
    private Character use_yn;
    private Integer rgtr_id;
    private LocalDateTime rgtr_dt;
    private Integer mdfr_id;
    private LocalDateTime mdfr_dt;
}
