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

import java.security.Principal;
import java.util.List;
import java.util.Map;

@RequestMapping("/recruiter/*")
@RequiredArgsConstructor
@Controller
public class JobPostingController {

    private final JobPostingService jobPostingService;

    @Autowired
    private PostingBookmarkServiceImpl postingBookmarkService;

    @Autowired
    private ResumeServiceImpl resumeService;

    /*공고등록 폼*/
    @GetMapping("/write")
    public String writeForm(Model model) throws Exception {
        List<LocDTO> upperLoc = jobPostingService.getUpperLoc();
        /*RecruiterMyPageDTO jobPostingWrite= jobPostingService.selectCompany();*/
        model.addAttribute("upperLoc", upperLoc);
        /*model.addAttribute("jobPostingWrite",jobPostingWrite);*/
        return "/recruiter/jobPosting/JPwriteForm";
    }

    /*게시글 등록*/
    @PostMapping("/write")
    public String write(JobPostingDTO jobPostingDTO,
                        @RequestParam("posting_content") String content) throws Exception {
        jobPostingDTO.setCompany_no(0L);
        jobPostingDTO.setPosting_content(content);
        jobPostingService.write(jobPostingDTO);
        return "recruiter/jobPosting/JPlist";
    }

    //공고리스트
    @GetMapping("/JPlist")
    public String list(Model model) throws Exception {
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
    @GetMapping("/modify/{posting_no}")
    public String modifyForm(@PathVariable("posting_no") int posting_no, Model model) throws Exception {
        JobPostingDTO jobPostingDTO = jobPostingService.selectJPdetail(posting_no);
        List<LocDTO> upperLoc = jobPostingService.getUpperLoc();
        ObjectMapper mapper = new ObjectMapper();
        String posting_title = mapper.writeValueAsString(jobPostingDTO.getPosting_title());
        String posting_career = mapper.writeValueAsString(jobPostingDTO.getPosting_career());
        String posting_academy = mapper.writeValueAsString(jobPostingDTO.getPosting_academy());
        String posting_labor = mapper.writeValueAsString(jobPostingDTO.getPosting_labor());
        String posting_salary = mapper.writeValueAsString(jobPostingDTO.getPosting_salary());
        String posting_working_day = mapper.writeValueAsString(jobPostingDTO.getPosting_working_day());
        String posting_swork = mapper.writeValueAsString(jobPostingDTO.getPosting_swork());
        String posting_ework = mapper.writeValueAsString(jobPostingDTO.getPosting_ework());
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
        return "recruiter/jobPosting/JPmodify"; // 현재 페이지를 수정 페이지로 재사용
    }


  // 수정 작업 처리
    @PostMapping("/modify")
    public String modify(@RequestParam Map<String, Object> map, Model model) throws Exception {
        jobPostingService.modify(map);
        // jobPosting을 사용하여 해당 채용 정보를 업데이트
        return "redirect:/recruiter/JPlist"; // 수정 후 목록 페이지로 리다이렉트
    }

    // 삭제 작업 처리
    @GetMapping("/delete/{postingNo}")
    public String delete(@PathVariable int postingNo) {
        // 삭제 작업을 처리하는 로직 작성
        // postingNo를 사용하여 해당 채용 정보를 삭제
        return "/recruiter/jobPosting/JPlist"; // 삭제 후 목록 페이지로 리다이렉트
    }

    //상위지역에 따른 하위지역 목록 불러오기
    @GetMapping("/getLowerLoc")
    @ResponseBody
    public List<LocDTO> getLowerLoc(@RequestParam String upperLoc) {
        System.out.println("upperLoc = " + upperLoc);
        return jobPostingService.getLowerLoc(upperLoc);
    }
}
