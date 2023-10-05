package com.pickmeup.jobstartup.jobfair.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
@ToString
public class JobFairDTO {

    private Long JOBFAIR_NO;
    private String JOBFAIR_TITLE;
    private LocalDateTime JOBFAIR_SDATE;
    private LocalDateTime JOBFAIR_EDATE;
    private String JOBFAIR_PLACE;
    private String JOBFAIR_TARGET;
    private String JOBFAIR_HOST;
    private String JOBFAIR_SITE;
    private String JOBFAIR_LOC_CODE;
    private String JOBFAIR_CONTENT;

    public String getJOBFAIR_SDATE() {
        return JOBFAIR_SDATE.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
    }

    public String getJOBFAIR_EDATE() {
        return JOBFAIR_EDATE.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
    }
}
