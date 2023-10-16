package com.pickmeup.jobstartup.jobfair.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class JobFairFileDTO {

    private Long JBFILE_NO;
    private Long JOBFAIR_NO;
    private String JBFILE_ORGNAME;
    private String JBFILE_SAVNAME;
    private String JBFILE_TYPE;
}
