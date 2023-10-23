package com.pickmeup.jobstartup.seeker.applicationSupport.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.ApplicationStatusService;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.ApplicationStatusServiceImpl;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.PostingBookmarkServiceImpl;
import com.pickmeup.jobstartup.seeker.resume.controller.ResumeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping ("/seeker")
public class ApplicationStatusController {

    private static final Logger logger = LoggerFactory.getLogger(ApplicationStatusController.class);

    @Autowired
    private ApplicationStatusServiceImpl applicationStatusService;

    @Autowired
    private PostingBookmarkServiceImpl postingBookmarkService;

    //지원하기 버튼 클릭시
    @PostMapping("/resumeApply")
    public String resumeApply (@RequestParam("member_no") int member_no,
                               @RequestParam("posting_no") int posting_no,
                               @RequestParam("resume_no") int resume_no) {
        System.out.println("ApplicationStatusController-resumeApply()진입");

        Map<String, Integer> resumeApplyMap = new HashMap<>();
        resumeApplyMap.put("member_no", member_no);
        resumeApplyMap.put("posting_no", posting_no);
        resumeApplyMap.put("resume_no", resume_no);

        System.out.println("resume_no: " + resume_no);
        System.out.println("member_no: " + member_no);
        System.out.println("posting_no: " + posting_no);

        applicationStatusService.insertResumeApply(resumeApplyMap);
        return "seeker/resume/resumeApplySuccess";
    }

    @RequestMapping ("resumeApplyDone")
    public String success () {
        return "seeker/resume/resumeApplySuccess";
    }

    //이력서 지원현황
    @RequestMapping("/applyStatus")
    public String selectApplyStatus (Model model) {
        logger.info("ApplicationStatusController-selectApplyStatus() 진입");

        int member_no = 0;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                Member member = postingBookmarkService.findMemberByUsername(((UserDetails) principal).getUsername());
                member_no = member.getMember_no();
            }
        }

        List<ResumeApplyDTO> statusList = applicationStatusService.selectApplyStatus(member_no);
        logger.info("statusList: {}", statusList);

        model.addAttribute("statusResult", statusList);
        return "seeker/applicationSupport/applyStatus";
    }

    //면접일정 확인하기
    @RequestMapping("/interviewStatus")
    public String selectInterviewStatus (Model model) {
        logger.info("ApplicationStatusController-selectInterviewStatus() 진입");

        Member member = null;
        int member_no = 0;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                member = postingBookmarkService.findMemberByUsername(((UserDetails) principal).getUsername());
                member_no = member.getMember_no();
            }
        }

        List<ResumeApplyDTO> statusList = applicationStatusService.selectApplyStatus(member_no);
        List<ResumeApplyDTO> todayList = applicationStatusService.selectToday(member_no);
        List<ResumeApplyDTO> planList = applicationStatusService.selectPlan(member_no);
        logger.info("statusList: {}", statusList);

        model.addAttribute("statusResult", statusList);
        model.addAttribute("todayList", todayList);
        model.addAttribute("member", member);
        model.addAttribute("planList", planList);

        return "seeker/applicationSupport/interviewStatus";
    }

    //면접일정 확인하기
    @RequestMapping("/interviewStatusPlan")
    public String selectInterviewStatusPlan (Model model) {
        logger.info("ApplicationStatusController-selectInterviewStatus() 진입");

        Member member = null;
        int member_no = 0;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                member = postingBookmarkService.findMemberByUsername(((UserDetails) principal).getUsername());
                member_no = member.getMember_no();
            }
        }

        List<ResumeApplyDTO> statusList = applicationStatusService.selectApplyStatus(member_no);
        List<ResumeApplyDTO> todayList = applicationStatusService.selectToday(member_no);
        List<ResumeApplyDTO> planList = applicationStatusService.selectPlan(member_no);
        logger.info("statusList: {}", statusList);

        model.addAttribute("statusResult", statusList);
        model.addAttribute("todayList", todayList);
        model.addAttribute("member", member);
        model.addAttribute("planList", planList);

        return "seeker/applicationSupport/interviewStatusPlan";
    }
}
