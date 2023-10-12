package com.pickmeup.jobstartup.jobfair.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
public class JobFairDTO {

    private Long JOBFAIR_NO;
    private String JOBFAIR_TITLE;
    private String JOBFAIR_PLACE;
    private String JOBFAIR_TARGET;
    private String JOBFAIR_HOST;
    private String JOBFAIR_SITE;
    private String JOBFAIR_LOC_CODE;
    private String JOBFAIR_CONTENT;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime JOBFAIR_SDATE;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime JOBFAIR_EDATE;

    public String getStringJOBFAIR_SDATE() {
        return JOBFAIR_SDATE.toLocalDate().toString();
    }

    public String getStrigJOBFAIR_EDATE() {
        return JOBFAIR_EDATE.toLocalDate().toString();
    }
}
