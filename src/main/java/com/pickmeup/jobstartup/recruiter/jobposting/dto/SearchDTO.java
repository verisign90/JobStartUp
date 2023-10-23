package com.pickmeup.jobstartup.recruiter.jobposting.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SearchDTO {
    private String lowerLocSelected;
    private String posting_jobCode;
    private String keyword;
}
