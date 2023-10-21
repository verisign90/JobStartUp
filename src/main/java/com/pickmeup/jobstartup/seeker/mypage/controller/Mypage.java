package com.pickmeup.jobstartup.seeker.mypage.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.PostingBookmarkServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping ("/seeker")
public class Mypage {

    @Autowired
    private PostingBookmarkServiceImpl postingBookmarkService;

    //마이페이지 홈
    @PreAuthorize("isAuthenticated()")
    @RequestMapping("/mypageHome")
    public String mypageHome (Principal principal, Model model) {

        if  (principal == null) {
            return "redirect: /join";
        }

        Member member = postingBookmarkService.findMemberByUsername(principal.getName());
        model.addAttribute("member", member);

        return "seeker/mypage/home";
    }
}
