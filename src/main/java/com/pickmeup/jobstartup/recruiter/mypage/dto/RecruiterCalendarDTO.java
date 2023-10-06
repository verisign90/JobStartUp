package com.pickmeup.jobstartup.recruiter.mypage.dto;

import lombok.Data;

@Data
public class RecruiterCalendarDTO {

    private int schedule_no;
    private String schedule_title;
    private String schedule_start;
    private String schedule_end;
    private String schedule_memo;
    private int company_no;

}
