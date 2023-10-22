package com.pickmeup.jobstartup.seeker.resume.controller;

import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.recruiter.apply.dto.JobDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.apply.service.ApplyService;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.PostingBookmarkServiceImpl;
import com.pickmeup.jobstartup.seeker.resume.dto.ResumeDTO;
import com.pickmeup.jobstartup.seeker.resume.service.ResumeService;
import com.pickmeup.jobstartup.seeker.resume.service.ResumeServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/seeker")
public class ResumeController {

    private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);

    @Autowired
    private ResumeServiceImpl resumeService;

    @Autowired
    private PostingBookmarkServiceImpl postingBookmarkService;

    //이력서 목록
    @RequestMapping("/resumeList")
    public String resumeList (Model model) {
        logger.info("ResumeController-resumeList() 진입");

        int memberNo = 0;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                Member member = postingBookmarkService.findMemberByUsername(((UserDetails) principal).getUsername());
                memberNo = member.getMember_no();
            }
        }

        List<ResumeDTO> resumeList = resumeService.selectResumeList(memberNo);
        logger.info("resumeList: {}", resumeList);
        model.addAttribute("resumeList",resumeList);
        return "seeker/resume/resumeList";
    }

    //이력서 상세 조회
    @RequestMapping ("/resumeDetail/{resume_no}")
    public String resumeDetail (Model model, @PathVariable int resume_no) {
        logger.info("ResumeController-resumeDetail() 진입");
        ResumeDTO resumeDetial = resumeService.selectResumeDetail(resume_no);
        logger.info("resumeDetail: {}", resumeDetial);
        model.addAttribute("resumeDetail",resumeDetial);
        return "seeker/resume/resumeDetail";
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
    @PreAuthorize("isAuthenticated()")
    @GetMapping ("/resumeWrite")
    public String resumeWriteForm (Model model, Principal principal) {
        logger.info("ResumeController-resumeWriteForm() 진입");

        Member member = postingBookmarkService.findMemberByUsername(principal.getName());


        List<LocDTO> upperLoc = resumeService.getUpperLoc();
        List<JobDTO> upperJob = resumeService.getBusiness_type_code_up();
        model.addAttribute("upperLoc", upperLoc);
        model.addAttribute("upperJob", upperJob);
        model.addAttribute("member", member);
        //return "seeker/resume/resumeWriteForm";
        return "seeker/resume/resumeWriteForm";
    }

    //이력서 작성 처리
    @PostMapping ("/resumeWrite")
    public String resumeWrite (@ModelAttribute ResumeDTO resumeDTO,
                               @RequestParam MultipartFile profileOrgNameFile,
                               @RequestParam MultipartFile resumeOrgNameFile,
                               Principal principal) throws IOException {
        logger.info("ResumeController-resumeWrite() 진입");

        Member member = postingBookmarkService.findMemberByUsername(principal.getName());
        int memberNo = member.getMember_no();

        resumeDTO.setMember_no(memberNo);
        String profileOrgName = profileOrgNameFile.getOriginalFilename();
        String resumeOrgName = resumeOrgNameFile.getOriginalFilename();

        resumeDTO.setProfile_orgname(profileOrgName);
        resumeDTO.setResume_orgname(resumeOrgName);

        logger.info("resumeDTO : {}", resumeDTO);

        resumeService.insertResumeAttached(resumeDTO, profileOrgNameFile, resumeOrgNameFile);
        return String.format("redirect:/seeker/resumeList");
    }

    //이력서 수정폼 요청
    @GetMapping ("/resumeModify/{resume_no}")
    public String resumeModifyForm (@PathVariable int resume_no,
                                    @ModelAttribute ResumeDTO modifyResumeDTO,
                                    Model model) {
        logger.info("ResumeController-resumeModifyForm() 진입");

        ResumeDTO originalResumeDTO = resumeService.selectResumeDetail(resume_no);

        modifyResumeDTO.setMember_no(originalResumeDTO.getMember_no());
        modifyResumeDTO.setResume_title(originalResumeDTO.getResume_title());

        modifyResumeDTO.setProfile_orgname(originalResumeDTO.getProfile_orgname());
        modifyResumeDTO.setProfile_savname(originalResumeDTO.getProfile_savname());

        modifyResumeDTO.setResume_money(originalResumeDTO.getResume_money());
        modifyResumeDTO.setResume_skill(originalResumeDTO.getResume_skill());

        modifyResumeDTO.setResume_orgname(originalResumeDTO.getResume_orgname());
        modifyResumeDTO.setResume_savname(originalResumeDTO.getResume_savname());

        modifyResumeDTO.setResume_url(originalResumeDTO.getResume_url());
        modifyResumeDTO.setCareerDTOList(originalResumeDTO.getCareerDTOList());
        modifyResumeDTO.setCertificateDTOList(originalResumeDTO.getCertificateDTOList());
        modifyResumeDTO.setLanguageDTOList(originalResumeDTO.getLanguageDTOList());
        modifyResumeDTO.setLanguageCertificateDTOList(originalResumeDTO.getLanguageCertificateDTOList());
        modifyResumeDTO.setResumeLocDTOList(originalResumeDTO.getResumeLocDTOList());

        model.addAttribute("modifyResumeDTO", modifyResumeDTO);

        return "seeker/resume/resumeModifyForm";
    }

    //이력서 수정 처리
    @PostMapping ("/resumeModify/{resume_no}")
    public String resumeModify (@PathVariable int resume_no,
                                @ModelAttribute ResumeDTO modifyResumeDTO,
                                @RequestParam MultipartFile profileOrgNameFile,
                                @RequestParam MultipartFile resumeOrgNameFile
                                ) {
        logger.info("ResumeController-resumeModify() 진입");

        resumeService.modifyResume (resume_no, modifyResumeDTO, profileOrgNameFile, resumeOrgNameFile);

        return String.format("redirect:/seeker/resumeDetail/{resume_no}");
    }

    //상위지역에 따른 하위지역 목록 불러오기
    @GetMapping("/getLowerLoc")
    @ResponseBody
    public List<LocDTO> getLowerLoc(@RequestParam("upperLoc") String upperLoc) {
        System.out.println("upperLoc = " + upperLoc);
        return resumeService.getLowerLoc(upperLoc);
    }

    //하위 업종코드 받아오기
    @GetMapping("/getBusiness_type_code_up")
    @ResponseBody
    public List<JobDTO> getBusiness_type_code(@RequestParam String business_type_code_up) {
        return resumeService.getBusiness_type_code(business_type_code_up);
    }

}