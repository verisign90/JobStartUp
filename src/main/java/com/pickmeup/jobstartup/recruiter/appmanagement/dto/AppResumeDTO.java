package com.pickmeup.jobstartup.recruiter.appmanagement.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
public class AppResumeDTO {

    private int resume_no;
    private int member_no;
    private String resume_title;
    private int resume_money;
    private String resume_skill;
    private String resume_url;

}
