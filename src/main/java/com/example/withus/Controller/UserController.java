package com.example.withus.Controller;

import com.example.withus.service.UserService;
import com.example.withus.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/signup")
    public String toSignupPage() {  //회원가입 페이지
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(UserVo userVo) { // 회원가입
        try {
            userService.signup(userVo);
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
    public String login(String mbr_id, String password, HttpSession session) { // 로그인
        Integer id = userService.login(mbr_id, password);
        if (id == null) { // 로그인 실패
            return "redirect:/login";
        }
        session.setAttribute("userId", id);
        return "redirect:/main";
    }

    @PostMapping("/logout")
    public String logout(HttpSession session) { // 로그아웃
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/update")
    public String toUpdatePage(HttpSession session, Model model) { // 회원 정보 수정 페이지
        Integer id = (Integer) session.getAttribute("userId");
        UserVo userVo = userService.getUserById(id);
        model.addAttribute("user", userVo);
        return "update";
    }

    @PostMapping("/update")
    public String modifyInfo(HttpSession session, UserVo userVo) { // 회원 정보 수정
        Integer id = (Integer) session.getAttribute("userId");
        userVo.setMbr_sn(id);
        userService.modifyInfo(userVo);
        return "redirect:/";
    }

    @PostMapping("/delete")
    public String withdraw(HttpSession session) { // 회원 탈퇴
        Integer id = (Integer) session.getAttribute("userId");
        if (id != null) {
            userService.withdraw(id);
        }
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        List<UserVo> userList = userService.getUserList();
        model.addAttribute("list", userList);
        return "userList";
    }
}
