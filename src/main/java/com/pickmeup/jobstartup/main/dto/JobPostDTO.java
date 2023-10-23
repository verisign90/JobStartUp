package com.pickmeup.jobstartup.main.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class JobPostDTO {
    private Long company_no;
    private String company_name;
    private String company_address_detail;
    private String logo_savname;
    private Long posting_no;
    private String posting_title;
    private String posting_career;
    private String posting_academy;
    private String posting_labor;
    private String posting_salary;
    private LocalDateTime posting_sdate;
    private LocalDateTime posting_edate;
}
