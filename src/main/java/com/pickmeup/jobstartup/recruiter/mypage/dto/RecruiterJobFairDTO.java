package com.pickmeup.jobstartup.recruiter.mypage.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@NoArgsConstructor
@ToString
public class RecruiterJobFairDTO {
    private int jobfairentry_no;
    private int company_no;
    private int jobfair_no;
    private String jobfair_status;
    private String jobfair_title;
    private String jobfair_place;
    private Date jobfair_sdate;
    private Date jobfair_edate;
}
