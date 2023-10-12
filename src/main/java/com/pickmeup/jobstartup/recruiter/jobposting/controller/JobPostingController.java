package com.pickmeup.jobstartup.recruiter.jobposting.controller;

import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.service.JobPostingService;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterMyPageDTO;
import com.pickmeup.jobstartup.recruiter.mypage.service.RecruiterMyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class JobPostingController {

   private final JobPostingService jobPostingService;
   private final RecruiterMyPageService recruiterMyPageService;

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
    public String write(JobPostingDTO jobPostingDTO, @RequestParam("posting_content") String content) throws Exception {
        System.out.println("write 호출");
        System.out.println("내용 : "+content);
        jobPostingDTO.setCompany_no(4L);
        jobPostingDTO.setPosting_content(content);
        System.out.println(jobPostingDTO.toString());
        jobPostingService.write(jobPostingDTO);
        return "/recruiter/jobPosting/JPlist";
    }

    //공고리스트
    @GetMapping("/JPlist")
    public String list(Model model) throws Exception {
       List<JobPostingDTO> JPlist = jobPostingService.selectJPlist();
       model.addAttribute("JPlist", JPlist);
        return "/recruiter/jobPosting/JPlist";
    }

    //상세조회
    @GetMapping ("/JPdetail/{posting_no}")
    public String detail(@PathVariable("posting_no") int posting_no, Model model) throws Exception {
        JobPostingDTO JPdetail = jobPostingService.selectJPdetail(posting_no);
        model.addAttribute("JPdetail",JPdetail);
        return "/recruiter/jobPosting/JPdetail";
    }

    //상위지역에 따른 하위지역 목록 불러오기
    @GetMapping("/getLowerLoc")
    @ResponseBody
    public List<LocDTO> getLowerLoc(@RequestParam String upperLoc) {
        return jobPostingService.getLowerLoc(upperLoc);
    }
}
