package com.pickmeup.jobstartup.recruiter.jobposting.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.service.JobPostingService;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterMyPageDTO;
import com.pickmeup.jobstartup.recruiter.mypage.service.RecruiterMyPageService;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.PostingBookmarkServiceImpl;
import com.pickmeup.jobstartup.seeker.resume.dto.ResumeDTO;
import com.pickmeup.jobstartup.seeker.resume.service.ResumeServiceImpl;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class JobPostingController {

    private final JobPostingService jobPostingService;

    @Autowired
    private PostingBookmarkServiceImpl postingBookmarkService;

    @Autowired
    private ResumeServiceImpl resumeService;

    /*공고등록 폼*/
    @GetMapping("/JPwrite")
    public String JPwriteForm(Model model) throws Exception {
        List<LocDTO> upperLoc = jobPostingService.getUpperLoc();
        model.addAttribute("upperLoc", upperLoc);
        return "/recruiter/jobPosting/JPwriteForm";
    }

    /*게시글 등록*/
    @PostMapping("/JPwrite")
    public ModelAndView JPwrite(JobPostingDTO jobPostingDTO,
                          @RequestParam("posting_content") String content, ModelAndView modelAndView) throws Exception {

        System.out.println("getPosting_career"+jobPostingDTO.getPosting_career());
        System.out.println("getPosting_labor"+jobPostingDTO.getPosting_labor());

        jobPostingDTO.setCompany_no(0L);
        jobPostingDTO.setPosting_content(content);
        jobPostingService.insertJobPostingDTO(jobPostingDTO);
        modelAndView.setViewName("redirect:/recruiter/JPlist");
        return modelAndView;
    }

    //공고리스트
    @GetMapping("/JPlist")
    public String JPlist(Model model) throws Exception {
        List<JobPostingDTO> JPlist = jobPostingService.selectJPlist();
        List<LocDTO> upperLoc = jobPostingService.getUpperLoc();
        model.addAttribute("JPlist", JPlist);
        model.addAttribute("upperLoc", upperLoc);
        return "recruiter/jobPosting/JPlist";
    }

    //상세조회
    @GetMapping("/JPdetail/{posting_no}")
    public String detail(@PathVariable("posting_no") int posting_no, Model model) throws Exception {
        JobPostingDTO JPdetail = jobPostingService.selectJPdetail(posting_no);

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

        System.out.println(JPdetail.toString());
        model.addAttribute("JPdetail", JPdetail);
        model.addAttribute("postingNo", posting_no);
        model.addAttribute("memberNo", memberNo);
        model.addAttribute("resumeList",resumeList);
        return "recruiter/jobPosting/JPdetail";
    }

    // 수정 페이지로 이동
    @GetMapping("/JPmodify/{posting_no}")
    public String modifyForm(@PathVariable("posting_no") int posting_no, Model model) throws Exception {
        JobPostingDTO jobPostingDTO = jobPostingService.selectJPdetail(posting_no);
        List<LocDTO> upperLoc = jobPostingService.getUpperLoc();
        ObjectMapper mapper = new ObjectMapper();
        String posting_career = mapper.writeValueAsString(jobPostingDTO.getPosting_career());
        String posting_academy = mapper.writeValueAsString(jobPostingDTO.getPosting_academy());
        String posting_labor = mapper.writeValueAsString(jobPostingDTO.getPosting_labor());
        String posting_salary = mapper.writeValueAsString(jobPostingDTO.getPosting_salary());
        String posting_working_day = mapper.writeValueAsString(jobPostingDTO.getPosting_working_day());
        String posting_swork = mapper.writeValueAsString(jobPostingDTO.getPosting_swork());
        System.out.println(jobPostingDTO.getPosting_swork());
        String posting_ework = mapper.writeValueAsString(jobPostingDTO.getPosting_ework());
        System.out.println(jobPostingDTO.getPosting_ework());
        String posting_sdate = mapper.writeValueAsString(jobPostingDTO.getPosting_sdate());
        String posting_edate = mapper.writeValueAsString(jobPostingDTO.getPosting_edate());
        model.addAttribute("jobPostingDTO", jobPostingDTO);
        model.addAttribute("posting_career", posting_career);
        model.addAttribute("posting_academy", posting_academy);
        model.addAttribute("posting_labor", posting_labor);
        model.addAttribute("posting_salary", posting_salary);
        model.addAttribute("posting_working_day", posting_working_day);
        model.addAttribute("posting_swork", posting_swork);
        model.addAttribute("posting_ework", posting_ework);
        model.addAttribute("PostingSdate", posting_sdate);
        model.addAttribute("PostingEdate", posting_edate);
        model.addAttribute("upperLoc", upperLoc);
        return "recruiter/jobPosting/JPmodify";
    }

    // 수정 작업 처리
    @PostMapping("/JPmodify")
    public String JPmodify(@RequestParam Map<String, Object> map) throws Exception {
        jobPostingService.JPmodify(map);
        // jobPosting을 사용하여 해당 채용 정보를 업데이트
        return "redirect:/recruiter/JPlist"; // 수정 후 목록 페이지로 리다이렉트
    }

    // 삭제 작업 처리
    @GetMapping("/JPdelete/{posting_no}")
    public ModelAndView JPdelete(@PathVariable("posting_no") int posting_no,ModelAndView modelAndView) throws Exception {
        jobPostingService.JPdelete(posting_no);
        modelAndView.setViewName("redirect:/recruiter/JPlist"); // 삭제 후 목록 페이지로
        return modelAndView;
    }

    //상위지역에 따른 하위지역 목록 불러오기
    @GetMapping("/getJPLowerLoc")
    @ResponseBody
    public List<LocDTO> getLowerLoc(@RequestParam String upperLoc) {
        System.out.println("upperLoc = " + upperLoc);
        return jobPostingService.getLowerLoc(upperLoc);
    }
}
