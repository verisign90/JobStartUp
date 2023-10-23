package com.pickmeup.jobstartup.jobfair.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EntryCompanyDTO {

    private Long JOBFAIRENTRY_NO;
    private Long COMPANY_NO;
    private Long JOBFAIR_NO;
    private String JOBFAIR_NAME;
    private String COMPANY_NAME;
}
