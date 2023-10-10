package com.pickmeup.jobstartup.resume.controller;

import com.pickmeup.jobstartup.resume.dto.*;
import com.pickmeup.jobstartup.resume.service.ResumeServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/seeker")
public class ResumeController {

    private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);

    @Autowired
    private ResumeServiceImpl resumeService;

    //이력서 목록
    @RequestMapping("/resumeList")
    public String resumeList (Model model) {
        logger.info("ResumeController-resumeList() 진입");
        List<ResumeDTO> resumeList = resumeService.selectResumeList();
        logger.info("resumeList: {}", resumeList);
        model.addAttribute("resumeList",resumeList);
        return "seeker/resumeList";
    }

    //이력서 상세 조회
    @RequestMapping ("/resumeDetail")
    public String resumeDetail (Model model, @RequestParam int resume_no) {
        logger.info("ResumeController-resumeDetail() 진입");
        ResumeDTO resumeDetial = resumeService.selectResumeDetail(resume_no);
        logger.info("resumeDetail: {}", resumeDetial);
        model.addAttribute("resumeDetail",resumeDetial);
        return "seeker/resumeDetail";
    }

    //이력서 삭제
    @GetMapping ("/resumeDelete")
    public String resumeDelete (@RequestParam int resume_no, @RequestParam int lang_no) {
        logger.info("ResumeController-resumeDelete() 진입");

        logger.info("ResumeController-resumeDelete lang_no: {}", lang_no);

        resumeService.deleteResumeAttached(resume_no, lang_no);
        return String.format("redirect:/seeker/resumeList");
    }

    //이력서 작성폼
    @GetMapping ("/resumeWrite")
    public String resumeWriteForm () {
        logger.info("ResumeController-resumeWriteForm() 진입");
        return "seeker/resumeWriteForm";
    }

    //이력서 작성 처리
    @PostMapping ("/resumeWrite")
    public String resumeWrite (@ModelAttribute ResumeDTO resumeDTO,
                               @RequestParam MultipartFile profileOrgNameFile,
                               @RequestParam MultipartFile resumeOrgNameFile) throws IOException {
        logger.info("ResumeController-resumeWrite() 진입");

        String profileOrgName = profileOrgNameFile.getOriginalFilename();
        String resumeOrgName = resumeOrgNameFile.getOriginalFilename();

        resumeDTO.setProfile_orgname(profileOrgName);
        resumeDTO.setResume_orgname(resumeOrgName);

        logger.info("resumeDTO : {}", resumeDTO);

        resumeService.insertResumeAttached(resumeDTO, profileOrgNameFile, resumeOrgNameFile);
        return String.format("redirect:/seeker/resumeList");
    }

    //이력서 수정폼 요청
    @GetMapping ("/resumeModify")
    public String resumeModifyForm (@RequestParam int resume_no) {
        logger.info("ResumeController-resumeModifyForm() 진입");

        ResumeDTO resumeDTO = resumeService.selectResumeDetail(resume_no);

        return "seeker/resumeModifyForm";
    }
}