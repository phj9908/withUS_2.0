package com.example.withus.service;

import com.example.withus.mapper.UserMapper;
import com.example.withus.vo.UserVo;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
        String enc = encryptPassword(userVo.getPassword(), userVo.getMbr_id());
        userVo.setPassword(enc);
        userVo.setMbr_id(userVo.getMbr_id());
        userMapper.insertUser(userVo);
    }

    public Integer login(UserVo userVo) {
        UserVo loginMember = userMapper.getUserByEmail(userVo);
//        if (userVo.getPassword().equals(encryptPassword)) {
//            return userVo.getMbr_sn();
//        }
//        return null;
        if(comparePassword(userVo.getPassword(), loginMember.getPassword(), userVo.getMbr_id())) {
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

    // 비밀번호 암호화
    public static String encryptPassword(String password, String id) {
        if (password == null) return "";
        if (id == null) return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)

        byte[] hashValue = null; // 해쉬값

        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        md.reset();
        md.update(id.getBytes());

        hashValue = md.digest(password.getBytes());

        return new String(Base64.encodeBase64(hashValue));
    }

    //비밀번호 암호화된거로 로그인
    public static boolean comparePassword(String password, String encryptPassword, String mbr_id) {
        return encryptPassword(password, mbr_id).equals(encryptPassword);
    }
}
