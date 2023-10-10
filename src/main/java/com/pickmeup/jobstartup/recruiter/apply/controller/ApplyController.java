package com.pickmeup.jobstartup.recruiter.apply.controller;

import com.pickmeup.jobstartup.recruiter.apply.dto.*;

import com.pickmeup.jobstartup.recruiter.apply.service.ApplyService;
import com.pickmeup.jobstartup.recruiter.apply.service.ApplyServiceImpl;

import com.zaxxer.hikari.util.FastList;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ApplyController {

    @Autowired
    public ApplyServiceImpl applyService;

    @GetMapping("/test")
    public String test(){

        return "recruiter/test";
    }

    @PostMapping("/test")
    public String insertTest(@ModelAttribute TestDTO testDTO){
        System.out.println("testDTO 내용"+testDTO);
        applyService.insertTest(testDTO);
        return String.format("redirect:/test");
    }




    @GetMapping("/apply")
    public String selectSample(Model model) {
        List<LocDTO> upperLoc = applyService.getUpperLoc();
        List<JobDTO> upperJob = applyService.getBusiness_type_code_up();
        System.out.println("여기는 apply 컨트롤러");
        model.addAttribute("upperLoc", upperLoc);
        model.addAttribute("upperJob", upperJob);
        System.out.println(upperLoc);
        System.out.println(upperJob);

        return "recruiter/approvalRequest";
    }



    @PostMapping("/apply")
    public String insertInfo(@ModelAttribute ApplyDTO applyDTO,@RequestParam("document") MultipartFile[] files,@RequestParam("logo") MultipartFile logoFile){
        System.out.println("여기는 apply post컨트롤러1");
        System.out.println("상세주소"+applyDTO.getCompany_address_detail());

        //여기는 로고첨부
        if (!logoFile.isEmpty()) {
            try {
                String originalFilename = logoFile.getOriginalFilename();
                String uploadDir = "C:\\JobStartUp_file"; // 파일을 저장할 경로를 지정하세요.
                String filePath = uploadDir + File.separator + originalFilename;
                File dest = new File(filePath);
                logoFile.transferTo(dest);

                // 파일 업로드가 성공하면 파일 정보를 applyDTO에 저장하거나 다른 처리를 수행할 수 있습니다.
                System.out.println("originalFilename : " + originalFilename);
                applyDTO.setLogo_orgname(originalFilename); // 사진 원본명 저장
                System.out.println("applyDTO의 logo_orgnamer은 : " + applyDTO.getLogo_orgname());
                applyDTO.setLogo_savname(filePath); // 사진 저장명(경로) 저장
            } catch (IOException e) {
                e.printStackTrace();
                // 파일 업로드 중 오류 처리
            }
        }
        System.out.println(applyDTO);


        System.out.println("자료형은"+applyDTO.getCompany_address_code().getClass().getName());
        System.out.println("값은"+applyDTO.getCompany_address_code());
        //여기는 파일첨부
        List<FileDTO> fileDTOList = new ArrayList<>();

        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                try {
                    String originalFileName = file.getOriginalFilename();
                    String uploadDir = "C:\\JobStartUp_file"; // 파일을 저장할 경로를 지정하세요.
                    String filePath = uploadDir + File.separator + originalFileName;
                    File dest = new File(filePath);
                    file.transferTo(dest);

                    // 파일 업로드가 성공하면 FileDTO에 정보를 저장합니다.
                    FileDTO fileDTO = new FileDTO();
                    fileDTO.setCfile_orgname(originalFileName);
                    fileDTO.setCfile_savname(filePath);
                    fileDTOList.add(fileDTO);
                } catch (IOException e) {
                    e.printStackTrace();
                    // 파일 업로드 중 오류 처리
                }
            }
        }
        System.out.println("applyDTO 인설트 전~~~~~~~~~~~~~~~~~");
        System.out.println("applyDTO의 detail_code_num형태"+ applyDTO.getBusiness_type_code().getClass().getName());
        System.out.println("applyDTO의 detail_code_num값"+ applyDTO.getBusiness_type_code());
        //company테이블입력
        applyService.insertInfo(applyDTO);

        //company_no값을 가져오기
        int company_no= applyService.getCompanyNo().getCompany_no();
        System.out.println("company_no는 ~~~~~~~~" + company_no);
        for (FileDTO fileDTO : fileDTOList) {
            System.out.println("test FileDTO" + fileDTO);
            fileDTO.setCompany_no(company_no);
        }
        applyService.insertFile(fileDTOList);
        System.out.println("여기는 apply post컨트롤러2");
        return String.format("redirect:/apply");
    }

    @GetMapping("/getLowerLoc")
    @ResponseBody
    public List<LocDTO> getLowerLoc(@RequestParam String upperLoc) {
        System.out.println(applyService.getLowerLoc(upperLoc));
        return applyService.getLowerLoc(upperLoc);
    }

    @GetMapping("/getBusiness_type_code_up")
    @ResponseBody
    public List<JobDTO> getBusiness_type_code(@RequestParam String business_type_code_up) {
       // System.out.println(applyService.getLowerLoc(business_type_code_up));
        return applyService.getBusiness_type_code(business_type_code_up);
    }




























}
