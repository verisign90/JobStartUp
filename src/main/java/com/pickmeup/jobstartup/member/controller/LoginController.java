package com.pickmeup.jobstartup.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/login")
public class LoginController {

    @RequestMapping
    public String login(@RequestParam(required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다");
        }
        return "member/login";
    }

//    @GetMapping("/logout")
//    public String logout() {
//        return "logout";
//    }


}
