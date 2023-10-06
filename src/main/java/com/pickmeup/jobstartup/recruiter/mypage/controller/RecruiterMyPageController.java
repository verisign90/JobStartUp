package com.pickmeup.jobstartup.recruiter.mypage.controller;

import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterCalendarDTO;
import com.pickmeup.jobstartup.recruiter.mypage.service.RecruiterMyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import java.util.List;


@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class RecruiterMyPageController {

    @Autowired
    RecruiterMyPageService recruiterMyPageService;



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


    //기업 페이지: calendar 페이지
    @GetMapping("/calendar")
    public String companyCalendar(@RequestParam int company_no, Model model){

        //Business Logic
        List<RecruiterCalendarDTO> recruiterCalendarDTOS = recruiterMyPageService.selectRecruCalendar(company_no);

        //Model And View
        model.addAttribute("recruiterCalendarDTOS",recruiterCalendarDTOS);
        return "/recruiter/mypage/recruiterCalendar";
    }

    //기업 페이지: 캘린더 팝업
    @GetMapping("/calendarPopup")
    public String companyCalendarPop(){


        return "/recruiter/mypage/recruiterCalendarPopUp";
    }


}
