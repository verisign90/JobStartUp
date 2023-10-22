package com.pickmeup.jobstartup.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CountDataDTO {

    private int TOTAL_MEMBERS;
    private int TODAY_MEMBERS;
    private int PRESENT_JOB_FAIRS;
    private int ACTIVE_JOB_POSTINGS;
    private int MALE_MEMBERS;
    private int FEMALE_MEMBERS;
}
