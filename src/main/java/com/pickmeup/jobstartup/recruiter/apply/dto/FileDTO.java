package com.pickmeup.jobstartup.recruiter.apply.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class FileDTO {
    private int company_no;
    private String cfile_orgname;
    private String cfile_savname;
    private String cfile_type;

}
