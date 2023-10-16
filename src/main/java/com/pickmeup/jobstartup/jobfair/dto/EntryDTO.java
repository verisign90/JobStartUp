package com.pickmeup.jobstartup.jobfair.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EntryDTO {

    private Long JOBFAIRENTRY_NO;
    private Long COMPANY_NO;
    private Long JOBFAIR_NO;

    private String COMPANY_NAME;
    private String LOGO_SAVNAME;
    private String JOBFAIR_TITLE;
}
