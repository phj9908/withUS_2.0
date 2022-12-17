package com.example.withus.service;

import com.example.withus.vo.FreeVo;

import java.util.List;

public interface FreeService {
    void insertFree(FreeVo freeVo);
    List<FreeVo> clickFree(int mbr_sn);
    List<FreeVo> getFree(String Y);
    List<FreeVo> choiceFree(FreeVo freeVo);
    Integer getNtcSn(Integer ntc_sn);

}
