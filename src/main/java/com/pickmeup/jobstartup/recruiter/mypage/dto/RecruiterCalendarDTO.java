package com.pickmeup.jobstartup.recruiter.mypage.dto;

import lombok.Data;

import java.util.Date;

@Data
public class RecruiterCalendarDTO {

    private int schedule_no;
    private String schedule_title;
    private int company_no;
    private String schedule_memo;
    private String schedule_start;
    private String schedule_end;
    private String textColor;
    private String backgroundColor;
    private String borderColor;


}
