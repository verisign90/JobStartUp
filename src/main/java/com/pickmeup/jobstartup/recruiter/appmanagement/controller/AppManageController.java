package com.pickmeup.jobstartup.recruiter.appmanagement.controller;

import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppManageDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppResumeDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppResumeFileDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.service.AppManageService;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

import org.apache.commons.io.FileUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class AppManageController {

    //(주의!!!!!!!!!!!) Session 정보는 로그인 된 이후에 적용 예정, 중간중간 예외처리 및 유효성 검사 넣기
    //(주의!!!!!!!!!!!) 공통 코드 >> 하나의 메서드로 묶기
    //(주의!!!!!!!!!!!) 로직 구현은  >>> Service 영역으로 옮기기

    @Autowired
    private AppManageService appManageService;

    @Resource(name = "AppManageService")
    private AppManageService mailService;

    //Path
    private String filePath = "C:/JobStartUp_fileUpload/resumeFile/";
    private String mappingPath = "/recruiter/appmanagement/";


    //채용관리 지원자 상세 페이지: 1) 지원자 인적 정보, 2) 지원자 이력 정보
    @GetMapping("/managePage")
    public String appManagePage(@RequestParam int status_no, Model model){
        //Business Logic (Common)
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);
        AppResumeFileDTO selectFile = appManageService.selectAppResumeFileByMember(resume_no);
        //Model And View
        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);
        model.addAttribute("selectFile",selectFile);
        return mappingPath+"appManageListDetail";
    }

    //채용관리 지원자 상세 페이지: 2) 지원자 이력 정보 - 파일(지원 서류)
    @RequestMapping("/getAppFile/{status_no}")
    public void getAppResumeProfile(AppResumeFileDTO appResumeFileDTO, @PathVariable int status_no, HttpServletResponse response) throws Exception{
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        appResumeFileDTO = appManageService.selectAppResumeFileByMember(resume_no);
        //FileDownload 기능
        String resume_orgname = appResumeFileDTO.getResume_orgname();
        String resume_savname = appResumeFileDTO.getResume_savname();
        byte[] fileByte = FileUtils.readFileToByteArray(new File(filePath+resume_savname));
        response.setContentType("application/octet-stream");    //파일 유형
        response.setContentLength(fileByte.length);             //파일 길이
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(resume_orgname,"UTF-8")+"\";"); // 데이터형식/성향 설정 (attachment: 첨부 파일)
        response.setHeader("Content-Transfer-Encoding", "binary");   //인코딩 방식 설정
        response.getOutputStream().write(fileByte);             //버퍼의 출력 스트림 출력
        response.getOutputStream().flush();                     //버퍼에 잔류 출력 스트림 출력
        response.getOutputStream().close();                     //출력 스트림 닫음
    }

    //채용관리 지원자 상세 페이지: 1차 면접일자 승인
    @PostMapping("/firstEnroll")
    public String appManageFirstEnroll(@RequestParam String date, @RequestParam String time,
                                       @RequestParam int status_no, Model model){

        //Map 등 컬렉션 프레임워크 통해 파라미터 받아서, Service에서 해당 로직들 수행하는 방법 고민중: 1),2)
        //1) 면접 일자 type변환 (From String to Date)
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date interview_date;
        String interview = date + " " + time;
        try {
            interview_date = dateFormat.parse(interview);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        //2) appManageDTO: parameter input
        AppManageDTO appManageDTO = new AppManageDTO();
        appManageDTO.setInterview_date(interview_date);
        appManageDTO.setStatus_no(status_no);

        //Business Logic
        int firstEnroll = appManageService.updateAppManageFirstEnroll(appManageDTO);

        //Business Logic (Common)
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);
        AppResumeFileDTO selectFile = appManageService.selectAppResumeFileByMember(resume_no);

        //Model And View
        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);
        model.addAttribute("selectFile",selectFile);

        return mappingPath+"appManageListDetail";
    }

    //채용관리 지원자 상세 페이지: 1차 면접일자 반려
    @PostMapping("/firstDenial")
    public String appManageFirstDenial(@RequestParam int status_no, @NotNull Model model){
        //Business Logic
        int firstDenial = appManageService.updateAppManageFirstDenial(status_no);

        //Business Logic (Common)
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);
        AppResumeFileDTO selectFile = appManageService.selectAppResumeFileByMember(resume_no);

        //Model And View
        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);
        model.addAttribute("selectFile",selectFile);
        return mappingPath+"appManageListDetail";
    }

    //채용관리 지원자 상세 페이지: 최종 면접일자 승인
    @PostMapping("/finalEnroll")
    public String appManageLastEnroll(@RequestParam int status_no, @NotNull Model model){
        //Business Logic
        int LastEnroll = appManageService.updateAppManageLastEnroll(status_no);

        //Business Logic (Common)
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);
        AppResumeFileDTO selectFile = appManageService.selectAppResumeFileByMember(resume_no);

        //Model And View
        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);
        model.addAttribute("selectFile",selectFile);
        return mappingPath+"appManageListDetail";
    }

    //채용관리 지원자 상세 페이지: 최종 면접일자 반려
    @PostMapping("/finalDenial")
    public String appManageLastDenial(@RequestParam int status_no, @NotNull Model model){
        //Business Logic
        int LastEnroll = appManageService.updateAppManageLastDenial(status_no);

        //Business Logic (Common)
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);
        AppResumeFileDTO selectFile = appManageService.selectAppResumeFileByMember(resume_no);

        //Model And View
        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);
        model.addAttribute("selectFile",selectFile);
        return mappingPath+"appManageListDetail";
    }

    //채용 관리 지원자 상세 페이지: 1차 메일링(안내)
    @PostMapping("/mailFirstEnroll")
    public String mailFirstEnroll(@NotNull Model model,
                                @RequestParam int status_no,
                                @RequestParam String member_email){
        //Business Logic
        mailService.sendMailFirstEnroll(member_email);

        //Business Logic (Common)
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);
        AppResumeFileDTO selectFile = appManageService.selectAppResumeFileByMember(resume_no);

        //Model And View
        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);
        model.addAttribute("selectFile",selectFile);
        return mappingPath+"appManageListDetail";
    }

    //채용 관리 지원자 상세 페이지: 1차 메일링(불합격)
    @PostMapping("/mailFirstDenial")
    public String mailFirstDenial(@NotNull Model model,
                                @RequestParam int status_no,
                                @RequestParam String member_email){
        //Business Logic
        mailService.sendMailFirstDenial(member_email);

        //Business Logic (Common)
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);
        AppResumeFileDTO selectFile = appManageService.selectAppResumeFileByMember(resume_no);

        //Model And View
        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);
        model.addAttribute("selectFile",selectFile);
        return mappingPath+"appManageListDetail";
    }

    //채용 관리 지원자 상세 페이지: 최종 메일링(합격)
    @PostMapping("/mailLastEnroll")
    public String mailLastEnroll(@NotNull Model model,
                               @RequestParam int status_no,
                               @RequestParam String member_email){
        //Business Logic
        mailService.sendMailLastEnroll(member_email);

        //Business Logic (Common)
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);
        AppResumeFileDTO selectFile = appManageService.selectAppResumeFileByMember(resume_no);

        //Model And View
        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);
        model.addAttribute("selectFile",selectFile);
        return mappingPath+"appManageListDetail";
    }

    //채용 관리 지원자 상세 페이지: 최종 메일링(불합격)
    @PostMapping("/mailLastDenial")
    public String mailLastDenial(@NotNull Model model,
                               @RequestParam int status_no,
                               @RequestParam String member_email){
        //Business Logic
        mailService.sendMailLastDenial(member_email);

        //Business Logic (Common)
        AppManageDTO selectInfo = appManageService.selectAppInfoByMember(status_no);
        int resume_no = Integer.parseInt(selectInfo.getResume_no());
        AppResumeDTO selectResume = appManageService.selectAppResumeByMember(resume_no);
        AppResumeFileDTO selectFile = appManageService.selectAppResumeFileByMember(resume_no);

        //Model And View
        model.addAttribute("selectInfo",selectInfo);
        model.addAttribute("selectResume",selectResume);
        model.addAttribute("selectFile",selectFile);
        return mappingPath+"appManageListDetail";
    }



}
