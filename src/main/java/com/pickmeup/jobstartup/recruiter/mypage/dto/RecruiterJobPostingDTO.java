package com.pickmeup.jobstartup.recruiter.mypage.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
@NoArgsConstructor
public class RecruiterJobPostingDTO {
    private int posting_no;
    private String posting_title;
    private Date posting_sdate;
    private Date posting_edate;
    private String isshow;
}
