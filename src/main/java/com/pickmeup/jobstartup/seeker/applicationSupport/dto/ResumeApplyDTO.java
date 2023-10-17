package com.pickmeup.jobstartup.seeker.applicationSupport.dto;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
public class ResumeApplyDTO {

    private int status_no;
    private int resume_no; //이력서 글번호
    private int member_no; //작성한 회원번호
    private int posting_no;
    private String first_pass;
    private String final_pass;
    private Date interview_date;

    @Builder
    public ResumeApplyDTO (ResumeApplyDTO resumeApplyDTO) {
        this.status_no = resumeApplyDTO.getStatus_no();
        this.resume_no = resumeApplyDTO.getResume_no();
        this.member_no = resumeApplyDTO.getMember_no();
        this.posting_no = resumeApplyDTO.getPosting_no();
        this.first_pass = resumeApplyDTO.getFirst_pass();
        this.final_pass = resumeApplyDTO.getFinal_pass();
        this.interview_date = resumeApplyDTO.getInterview_date();
    }
}
