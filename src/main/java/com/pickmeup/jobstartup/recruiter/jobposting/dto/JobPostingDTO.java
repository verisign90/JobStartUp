package com.pickmeup.jobstartup.recruiter.jobposting.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class JobPostingDTO {
    /* 회사 정보 */
    private Long company_no;
    private String company_name;
    private String company_address_detail;
    private String company_type;
    private String company_site;
    private String company_est;
    private String company_sales;
    private String logo_savname;
    /* 채용 공고 정보 */
    private Long posting_no;
    private String posting_title;
    private String posting_career;
    private String posting_academy;
    private String posting_jobCode;
    private String posting_type;
    private String posting_labor;
    private String posting_preferential;
    private String posting_skill;
    private String posting_salary;
    private LocalDateTime posting_sdate;
    private LocalDateTime posting_edate;
    private int posting_cnt;
    private String isshow;
    private String posting_content;
    private String posting_working_day;
    private String posting_position;
    private String posting_swork;
    private String posting_ework;
}
