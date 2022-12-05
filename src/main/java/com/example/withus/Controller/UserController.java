package com.example.withus.Controller;

import com.example.withus.service.UserService;
import com.example.withus.service.UserServiceImpl;
import com.example.withus.vo.LoginResponse;
import com.example.withus.vo.UserVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class UserController {

//    @Autowired
    private final UserServiceImpl userServiceImpl;

    @GetMapping("/signup")
    public String toSignupPage() {  //회원가입 페이지
        return "signup";
    }

    @PostMapping("/signup")
    public String signUp(UserVo userVo) { // 회원가입
//        String mbrNm = userVo.getMbr_nm();
//        String mbrId = userVo.getMbr_id();
//        String mbrPswd = userVo.getPassword();
//        // 유효성 검사
//        if(StringUtils.isEmpty(mbrNm) || StringUtils.isEmpty(mbrId) || StringUtils.isEmpty(mbrPswd)) {
//            return "signup";
//        }
        try {
            userServiceImpl.signUp(userVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String toLoginPage(HttpSession session) { // 로그인 페이지
        Integer id = (Integer) session.getAttribute("userId");
        if (id != null) { // 로그인된 상태
            return "redirect:/main";
        }
        return "login"; // 로그인되지 않은 상태
    }

    @PostMapping("/login")
    public String login(UserVo userVo, ModelMap model, HttpSession session) { // 로그인
        String mbrId = userVo.getMbr_id();
        String mbrPswd = userVo.getPassword();
        // 유효성 검사
        if (StringUtils.isEmpty(mbrId) || StringUtils.isEmpty(mbrPswd)) {
            model.addAttribute("message", "모든 정보를 입력해주세요");
            return "login";
        }

        //로그인하는 login매서드 사용
        LoginResponse loginResponse = userServiceImpl.login(userVo);

        if (!loginResponse.isSuccess()) {
            model.addAttribute("message", loginResponse.getMessage());
            return "login";
        }

        UserVo loginMember = loginResponse.getLoginMember();
        session.setAttribute("userId", loginResponse);
        return "redirect:/main";
    }
//        Integer id = userServiceImpl.login(userVo);
//        if (id == null) { // 로그인 실패
//            modelMap.addAttribute("message", "실패");
//            return "redirect:/login";
//        }
//        session.setAttribute("userId", loginResponse);


    @PostMapping("/logout")
    public String logout(HttpSession session) { // 로그아웃
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/update")
    public String toUpdatePage(HttpSession session, Model model) { // 회원 정보 수정 페이지
        Integer id = (Integer) session.getAttribute("userId");
        UserVo userVo = userServiceImpl.getUserById(id);
        model.addAttribute("user", userVo);
        return "update";
    }

    @PostMapping("/update")
    public String modifyInfo(HttpSession session, UserVo userVo) { // 회원 정보 수정
        Integer id = (Integer) session.getAttribute("userId");
        userVo.setMbr_sn(id);
        userServiceImpl.modifyInfo(userVo);
        return "redirect:/";
    }

    @PostMapping("/delete")
    public String withdraw(HttpSession session) { // 회원 탈퇴
        Integer id = (Integer) session.getAttribute("userId");
        if (id != null) {
            userServiceImpl.withdraw(id);
        }
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        List<UserVo> userList = userServiceImpl.getUserList();
        model.addAttribute("list", userList);
        return "userList";
    }
}
