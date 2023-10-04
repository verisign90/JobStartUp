package com.pickmeup.jobstartup.recruiter.appmanagement.controller;

import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppManageDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppResumeDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.service.AppManageService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class AppManageController {

    //(주의!!!!!!!!!!!) Session 정보는 로그인 된 이후에 적용 예정

    @Autowired
    private AppManageService appManageService;


    //채용관리 지원자 상세 페이지: 1) 지원자 인적 정보
    //채용관리 지원자 상세 페이지: 2) 지원자 이력 정보
    @GetMapping("/managePage")
    public String appManagePage(@RequestParam int status_no,
                                 @RequestParam int resume_no,
                                 Model model
                                 ){

        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);

        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);

        return "/recruiter/appManageListDetail";
    }

    //채용관리 지원자 상세 페이지: 2) 지원자 이력 정보 - 파일 다운로드



    //채용관리 지원자 상세 페이지: 1차 면접일자 승인
/*    @GetMapping("/firstEnroll")
    public String appManageFirstEnroll(){

        return "";
    }*/

    //채용관리 지원자 상세 페이지: 1차 면접일자 반려
    @GetMapping("/firstDenial")
    public String appManageFirstDenial(@RequestParam int status_no){
        int firstDenial = appManageService.updateAppManageFirstDenial(status_no);


        return "";
    }

    //채용관리 지원자 상세 페이지: 최종 면접일자 승인
    @GetMapping("/lastEnroll")
    public String appManageLastEnroll(@RequestParam int status_no){
        int LastEnroll = appManageService.updateAppManageLastEnroll(status_no);

        return "";
    }

    //채용관리 지원자 상세 페이지: 최종 면접일자 반려
    @GetMapping("/lastDenial")
    public String appManageLastDenial(@RequestParam int status_no){
        int LastEnroll = appManageService.updateAppManageLastDenial(status_no);

        return "";
    }

    //채용관리 지원자 상세 페이지: 1차 메일링(안내)



    //채용관리 지원자 상세 페이지: 최종 메일링(안내)





}
