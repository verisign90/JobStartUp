package com.pickmeup.jobstartup.recruiter.jobposting.controller;

import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.service.JobPostingService;
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

    /*공고등록 폼*/
    @GetMapping("/write")
    public String writeForm(Model model) throws Exception {
        List<LocDTO> upperLoc = jobPostingService.getUpperLoc();
        /*RecruiterMyPageDTO jobPostingWrite= jobPostingService.selectCompany();*/
        model.addAttribute("upperLoc", upperLoc);
        /*model.addAttribute("jobPostingWrite",jobPostingWrite);*/
        return "recruiter/jobPosting/JPwriteForm";
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
        System.out.println(JPdetail.toString());
        model.addAttribute("JPdetail", JPdetail);
        return "recruiter/jobPosting/JPdetail";
    }

    // 수정 페이지로 이동
   /* @GetMapping("/modify/{posting_no}")
    public ModelAndView modify(@PathVariable int posting_no) throws Exception {
        JobPostingDTO jobPostingDTO = jobPostingService.selectJPdetail(posting_no);
        // 수정 페이지로 이동하는 로직 작성
        // postingNo를 사용하여 해당 채용 정보를 가져와 수정 페이지로 전달
        ModelAndView modelAndView = new ModelAndView("JPwriteForm");
        modelAndView.addObject("jobPosting", jobPostingDTO);
        // 필요한 데이터를 모델에 추가
        return modelAndView;
    }*/

    @GetMapping("/modify/{posting_no}")
    public String modify(@PathVariable("posting_no") int posting_no, Model model) throws Exception {
        JobPostingDTO jobPostingDTO = jobPostingService.selectJPdetail(posting_no);
        model.addAttribute("jobPostingDTO", jobPostingDTO);
        return "recruiter/jobPosting/JPwriteForm"; // 현재 페이지를 수정 페이지로 재사용
    }

   /* // 수정 작업 처리
    @PostMapping("/modify/{postingNo}")
    public String modify(@PathVariable Long postingNo, @ModelAttribute JobPosting jobPosting) {
        // 수정 작업을 처리하는 로직 작성
        // jobPosting을 사용하여 해당 채용 정보를 업데이트
        return "redirect:/recruiter/JPlist"; // 수정 후 목록 페이지로 리다이렉트
    }*/

    /*// 삭제 작업 처리
    @GetMapping("/delete/{postingNo}")
    public String deleteJobPosting(@PathVariable Long postingNo) {
        // 삭제 작업을 처리하는 로직 작성
        // postingNo를 사용하여 해당 채용 정보를 삭제
        return "redirect:/recruiter/JPlist"; // 삭제 후 목록 페이지로 리다이렉트
    }*/

    //상위지역에 따른 하위지역 목록 불러오기
    @GetMapping("/getLowerLoc")
    @ResponseBody
    public List<LocDTO> getLowerLoc(@RequestParam String upperLoc) {
        return jobPostingService.getLowerLoc(upperLoc);
    }
}
