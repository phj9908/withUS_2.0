package com.example.withus.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.naming.directory.SearchControls;
import java.util.Date;

@Data
@Getter
@Setter
public class UserVo {
    private Integer mbr_sn;
    private Integer gr_sn;
    private String mbr_id;
    private String password;
    private String mbr_nm;
    private String mbr_nick;
    private String mbr_date;
    private String mbr_gen;
    private String mbr_tel;
    private String mbr_email;
}
