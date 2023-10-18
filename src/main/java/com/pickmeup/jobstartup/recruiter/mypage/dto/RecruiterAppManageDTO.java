package com.pickmeup.jobstartup.recruiter.mypage.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
@NoArgsConstructor
public class RecruiterAppManageDTO {

    private int status_no;
    private int member_no;
    private int posting_no;
    private String first_pass;
    private String final_pass;
    private Date interview_date;
    private String resume_title;
    private int resume_no;

}
