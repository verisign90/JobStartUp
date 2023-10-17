package com.pickmeup.jobstartup.seeker.applicationSupport.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.ApplicationStatusServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping ("/seeker")
public class ApplicationStatusController {

    @Autowired
    private ApplicationStatusServiceImpl applicationStatusService;

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

    /*@PostMapping("/seeker/resumeApply")
    public String handleResumeApply(@RequestParam("memberNo") Long memberNo,
                                    @RequestParam("postingNo") Long postingNo,
                                    @RequestParam("resume_no") Long resumeNo) {
        // memberNo, postingNo, resumeNo를 사용하여 작업 수행

        // 예를 들어, 데이터베이스에 저장하거나 처리 작업 수행
        applicationStatusService.insertResumeApply(resumeApplyDTO);
        return "redirect:/successPage"; // 적절한 응답을 반환
    }*/
}
