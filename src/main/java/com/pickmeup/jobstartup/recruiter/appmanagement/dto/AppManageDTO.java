package com.pickmeup.jobstartup.recruiter.appmanagement.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
@NoArgsConstructor
public class AppManageDTO {

    private int status_no;
    private int member_no;
    private int posting_no;
    private String first_pass;
    private String final_pass;
    private String resume_no;
    private Date interview_date;
    private String member_id;
    private String member_name;
    private String member_sex;
    private String member_hp;
    private String member_email;
    private String company_name;

}
