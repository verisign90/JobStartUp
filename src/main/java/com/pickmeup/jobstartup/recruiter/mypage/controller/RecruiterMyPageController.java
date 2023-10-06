package com.pickmeup.jobstartup.recruiter.mypage.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class RecruiterMyPageController {





    //기업 페이지: 회사 정보
    @GetMapping("/myPage")
    public String myPageTest(){
        return "/recruiter/mypage/recruiterMyPage";
    }


    //기업 페이지: 1) 박람회 현황
    //기업 페이지: 2) 공고 관리
    //기업 페이지: 3) 지원자 관리
    //기업 페이지: 정보 수정
    //기업 페이지: 사진 수정
    //기업 페이지: pagination

    //기업 페이지: 캘린더?
    @GetMapping("/calendar")
    public String myCalendarTest(){
        return "/recruiter/mypage/recruiterCalendar";
    }

}
