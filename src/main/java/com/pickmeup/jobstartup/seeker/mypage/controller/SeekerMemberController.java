package com.pickmeup.jobstartup.seeker.mypage.controller;

import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.service.MemberServiceImpl;
import com.pickmeup.jobstartup.seeker.applicationSupport.controller.ApplicationStatusController;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.PostingBookmarkServiceImpl;
import com.pickmeup.jobstartup.seeker.mypage.service.SeekerMemberService;
import com.pickmeup.jobstartup.seeker.mypage.service.SeekerMemberServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequestMapping ("/seeker")
public class SeekerMemberController {

    private static final Logger logger = LoggerFactory.getLogger(SeekerMemberController.class);

    @Autowired
    private SeekerMemberServiceImpl seekerMemberService;

    @Autowired
    private PostingBookmarkServiceImpl postingBookmarkService;

    @Autowired
    private MemberServiceImpl memberService;

    @RequestMapping("/userInfoUpdate")
    public String updateMemberinfoForm (/*@ModelAttribute Member memberDTO*/Principal principal, Model model) {

        if  (principal == null) {
            return "redirect: /join";
        }

        Member member = postingBookmarkService.findMemberByUsername(principal.getName());
        model.addAttribute("member", member);
        logger.info("member: {}", member);

        return "seeker/mypage/personUpdate";
    }

    @PostMapping ("/userInfoUpdate")
    public String updateMemberInfo (@ModelAttribute Member modMemberDTO, Principal principal) {

        Member orgMemberDTO = postingBookmarkService.findMemberByUsername(principal.getName());
        orgMemberDTO.setMember_id(orgMemberDTO.getMember_id());
        orgMemberDTO.setMember_birth(modMemberDTO.getMember_birth());
        orgMemberDTO.setMember_sex(modMemberDTO.getMember_sex());
        orgMemberDTO.setMember_hp(modMemberDTO.getMember_hp());
        orgMemberDTO.setMember_email(modMemberDTO.getMember_email());
        orgMemberDTO.setMember_loc(modMemberDTO.getMember_loc());
        orgMemberDTO.setIs_show("Y");


        logger.info("orgMemberDTO: {}", orgMemberDTO);

        seekerMemberService.updateMemberinfo(orgMemberDTO);
        return "seeker/mypage/home";
    }


    //마이페이지에서 비밀번호 폼 요청
    @RequestMapping ("/userPWUpdate")
    public String updateMemberPWForm (Principal principal, Model model) {
        if  (principal == null) {
            return "redirect: /join";
        }

        Member member = postingBookmarkService.findMemberByUsername(principal.getName());
        model.addAttribute("member", member);
        logger.info("member: {}", member);

        return "seeker/mypage/seekerPWUpdateForm";
    }


    //마이페이지에서 비밀번호 변경하기
    @PostMapping ("/userPWUpdate")
    public String updateMemberPW (Principal principal, @RequestParam String member_pw) {

        Member member = postingBookmarkService.findMemberByUsername(principal.getName());

        memberService.updatePassword(member.getMember_id(), member_pw);
        return "seeker/mypage/home";
    }

}
