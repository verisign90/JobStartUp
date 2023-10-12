package com.pickmeup.jobstartup.jobfair.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EntryDTO {

    private int JOBFAIRENTRY_NO;
    private int COMPANY_NO;
    private int JOBFAIR_NO;

    private String COMPANY_NAME;
    private String LOGO_SAVNAME;
}
