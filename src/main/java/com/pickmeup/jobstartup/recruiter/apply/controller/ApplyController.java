package com.pickmeup.jobstartup.recruiter.apply.controller;

import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.FileDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;

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


    @GetMapping("/apply")
    public String selectSample(Model model) {
        List<LocDTO> upperLoc = applyService.getUpperLoc();
        System.out.println("여기는 apply 컨트롤러");
        model.addAttribute("upperLoc", upperLoc);
        System.out.println(upperLoc);

        return "recruiter/approvalRequest";
    }



    @PostMapping("/apply")
    public String insertInfo(@ModelAttribute ApplyDTO applyDTO,@RequestParam("document") MultipartFile[] files,@RequestParam("logo") MultipartFile logoFile){
        System.out.println("여기는 apply post컨트롤러1");
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
        applyService.insertInfo(applyDTO);
        applyService.getCompanyNo();
        for (FileDTO fileDTO : fileDTOList) {
            System.out.println("test FileDTO" + fileDTO);
        }
        applyService.insertFile(fileDTOList);
        System.out.println("여기는 apply post컨트롤러2");
        return "recruiter/approvalRequest";
    }

    @GetMapping("/getLowerLoc")
    @ResponseBody
    public List<LocDTO> getLowerLoc(@RequestParam String upperLoc) {
        System.out.println(applyService.getLowerLoc(upperLoc));
        return applyService.getLowerLoc(upperLoc);
    }




























}
