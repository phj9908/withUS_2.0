package com.example.withus.service;

import com.example.withus.mapper.UserMapper;
import com.example.withus.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    public List<UserVo> getUserList() {
        return userMapper.getUserList();
    }
    public UserVo getUserById(Integer mbr_sn) {
        return userMapper.getUserById(mbr_sn);
    }
    public void signup(UserVo userVo) {
        userMapper.insertUser(userVo);
    }

    public Integer login(String mbr_id, String password) {
        UserVo userVo = userMapper.getUserByEmail(mbr_id);
        if (userVo.getPassword().equals(password)) {
            return userVo.getMbr_sn();
        }
        return null;
    }

    public void modifyInfo(UserVo userVo) {
        userMapper.updateUser(userVo);
    }
    public void withdraw(Integer mbr_sn) {
        userMapper.deleteUser(mbr_sn);
    }
}
