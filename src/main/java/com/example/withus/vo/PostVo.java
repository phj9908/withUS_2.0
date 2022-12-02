package com.example.withus.vo;

import lombok.Data;

import java.util.Date;

@Data
public class PostVo {
    private Integer txtSn;
    private Integer grSn;
    private Integer mbrSn;
    private String txtNm;
    private String txtCn;
    private Date txtDate;
    private String txtPlace;
    private String txtPic;
}