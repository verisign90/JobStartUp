package com.pickmeup.jobstartup.recruiter.mypage.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
public class RecruiterGeneralInfoDTO {

    private int member_no;
    private String member_id;
    private String member_type;
    private String member_name;
    private String member_pw;
    private String member_sex;
    private String member_hp;
    private String member_email;
    private String member_loc;
    private String member_birth;
    private int company_no;

}
