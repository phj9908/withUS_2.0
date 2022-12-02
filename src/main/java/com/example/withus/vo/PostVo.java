package com.example.withus.vo;

import lombok.Data;

import java.util.Date;

@Data
public class PostVo {
    private Integer txt_sn;
    private Integer gr_sn;
    private Integer mbr_sn;
    private String txt_nm;
    private String txt_cn;
    private Date txt_date;
    private String txt_place;
    private String txt_pic;
}