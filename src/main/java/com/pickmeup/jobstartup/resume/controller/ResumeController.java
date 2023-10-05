package com.pickmeup.jobstartup.resume.controller;

import com.pickmeup.jobstartup.resume.dto.*;
import com.pickmeup.jobstartup.resume.repository.CertificateRepository;
import com.pickmeup.jobstartup.resume.repository.LanguageRepository;
import com.pickmeup.jobstartup.resume.repository.ResumeRepositoryImpl;
import com.pickmeup.jobstartup.resume.service.ResumeServiceImpl;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
    public String resumeDetail (Model model,@RequestParam int resume_no) {
        logger.info("ResumeController-resumeDetail() 진입");
        ResumeDTO resumeDetial = resumeService.selectResumeDetail(resume_no);
        logger.info("resumeDetail: {}", resumeDetial);
        model.addAttribute("resumeDetail",resumeDetial);
        return "seeker/resumeDetail";
    }

    //이력서 삭제
    @RequestMapping ("/resumeDelete")
    public String resumeDelete (@RequestParam int resume_no) {
        logger.info("ResumeController-resumeDelete() 진입");
        resumeService.deleteResume(resume_no);
        return String.format("redirect:/seeker/resumeList");
    }

    //이력서 작성폼
    @GetMapping ("/resumeWrite")
    public String resumeWriteForm () {
        logger.info("ResumeController-resumeWriteForm() 진입");
        return "seeker/resumeWriteForm";
    }

    //이력서 등록 처리
    /*@PostMapping ("/resumeWrite")
    public String resumeWrite (@ModelAttribute ResumeDTO resumeDTO,
                               @ModelAttribute List<ResumeLocDTO> resumeLocDTO,
                               @ModelAttribute List<CareerDTO> careerDTO,
                               @ModelAttribute List<CertificateDTO> certificateDTO,
                               @ModelAttribute List<LanguageDTO> languageDTO,
                               @ModelAttribute List<LanguageCertificateDTO> languageCertificateDTO,
                               @RequestParam MultipartFile profileOrgNameFile,
                               @RequestParam MultipartFile resumeOrgNameFile) {
        logger.info("ResumeController-resumeWrite() 진입");
        logger.info("resumeDTO: {}", resumeDTO);

        String profileOrgName = profileOrgNameFile.getOriginalFilename();
        String resumeOrgName = resumeOrgNameFile.getOriginalFilename();

        resumeDTO.setProfile_orgname(profileOrgName);
        resumeDTO.setResume_orgname(resumeOrgName);

        resumeService.insertResume(resumeDTO, resumeLocDTO, careerDTO, certificateDTO, languageDTO, languageCertificateDTO);
        return String.format("redirect:/seeker/resumeList");
    }*/

    @PostMapping ("/resumeWrite")
    public String resumeWrite (@ModelAttribute ResumeDTO resumeDTO,
                               @ModelAttribute CareerDTO careerDTO,
                               @ModelAttribute CertificateDTO certificateDTO,
                               @ModelAttribute LanguageDTO languageDTO,
                               @ModelAttribute LanguageCertificateDTO languageCertificateDTO,
                               @ModelAttribute ResumeLocDTO resumeLocDTO,
                               @RequestParam MultipartFile profileOrgNameFile,
                               @RequestParam MultipartFile resumeOrgNameFile) {
        logger.info("ResumeController-resumeWrite() 진입");

        String profileOrgName = profileOrgNameFile.getOriginalFilename();
        String resumeOrgName = resumeOrgNameFile.getOriginalFilename();

        resumeDTO.setProfile_orgname(profileOrgName);
        resumeDTO.setResume_orgname(resumeOrgName);

        logger.info("resumeDTO : {}", resumeDTO);
        logger.info("resumeDTO.getLanguageDTOList() : {}", resumeDTO.getLanguageDTOList());


        resumeService.insertResume(resumeDTO);
        return String.format("redirect:/seeker/resumeList");
    }
}
