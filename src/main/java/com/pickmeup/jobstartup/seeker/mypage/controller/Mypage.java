package com.pickmeup.jobstartup.seeker.mypage.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping ("/seeker")
public class Mypage {

    //마이페이지 홈
    @PreAuthorize("isAuthenticated()")
    @RequestMapping("/mypageHome")
    public String mypageHome (Principal principal) {

        if  (principal == null) {
            return "redirect: /join";
        }

        return "seeker/mypage/home";
    }
}
