package com.pickmeup.jobstartup.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String loginPage() {
        return "member/login";
    }

//    @GetMapping("/logout")
//    public String logout() {
//        return "logout";
//    }
}
