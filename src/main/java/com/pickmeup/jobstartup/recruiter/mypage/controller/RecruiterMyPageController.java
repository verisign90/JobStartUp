package com.pickmeup.jobstartup.recruiter.mypage.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppManageDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterCalendarDTO;
import com.pickmeup.jobstartup.recruiter.mypage.service.RecruiterMyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    @PostMapping("/myPage")
    public String companyInfo(@RequestParam int company_no, Model model){
        //Business Logic
        AppManageDTO appManageDTO = recruiterMyPageService.selectRecruiterInfo(company_no);
        //Model
        model.addAttribute("appManageDTO",appManageDTO);
        return "/recruiter/mypage/recruiterMyPage";
    }

    //기업 페이지: 1) 박람회 현황
    @PostMapping("/recJobFairList")
    public String companyJobFairList(){


        return "";
    }


    //기업 페이지: 2) 공고 관리
    @PostMapping("/recApprovalList")
    public String companyApprovalList(){


        return "";
    }


    //기업 페이지: 3) 지원자 관리
    @PostMapping("/manageAppList")
    public String companyManageAppList(){


        return "";
    }

    //기업 페이지: 정보 수정 리스트 (또는 approval 담당의 jsp 이용)
    @PostMapping("/editCompanyInfoList")
    public String editCompanyInfoList(){

        return "";
    }


    //기업 페이지: 정보 수정
    @PostMapping("/editCompanyInfo")
    public String editCompanyInfo(){

        return "";
    }


    //기업 페이지: 사진 수정
    @PostMapping("/editCompanyProfile")
    public String editCompanyProfile(){


        return "";
    }

    //기업 페이지: pagination





    //기업 페이지: calendar 페이지
    @GetMapping("/calendar")
    public String companyCalendar(@RequestParam int company_no, Model model){
        //Business Logic
        List<RecruiterCalendarDTO> recruiterCalendarDTOS = recruiterMyPageService.selectRecruCalendar(company_no);
        //Model
        ObjectMapper objectMapper = new ObjectMapper();
        String json = null;
        try {
            json = objectMapper.writeValueAsString(recruiterCalendarDTOS);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("recruiterCalendarDTOS",json);
        System.out.println(model);
        //View
        return "/recruiter/mypage/recruiterCalendar";
    }

    //기업 페이지: 캘린더 팝업
    @GetMapping("/calendarPopup")
    public String companyCalendarPop(){


        return "/recruiter/mypage/recruiterCalendarPopUp";
    }


}
