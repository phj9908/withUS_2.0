package com.example.withus.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginResponse {
    UserVo loginMember;
    boolean isSuccess;
    String message;
}
