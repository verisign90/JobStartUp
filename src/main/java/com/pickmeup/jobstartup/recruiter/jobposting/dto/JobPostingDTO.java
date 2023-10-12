package com.pickmeup.jobstartup.recruiter.jobposting.dto;

import lombok.*;

import java.sql.Timestamp;

@Data
@ToString
@NoArgsConstructor
public class JobPostingDTO {

    private Number company_no;
    private Number posting_no;
    private String posting_title;
    private String posting_career;
    private String posting_academy;
    private String posting_jobCode;
    private String posting_type;
    private String posting_labor;
    private String posting_preferential;
    private String posting_skill;
    private Number posting_salary;
    private Timestamp posting_sdate;
    private Timestamp posting_edate;
    private Number posting_cnt;
    private String isshow;
    private String posting_content;
    private String posting_working_day;
    private String posting_position;


}
