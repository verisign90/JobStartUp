package com.pickmeup.jobstartup.recruiter.mypage.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class RecruiterCriteria {

    private int company_no;
    private int currentPageNo;
    private int recordsPerPage;

    public RecruiterCriteria(){
        this.currentPageNo = 1;
        this.recordsPerPage = 10;
    }

    public RecruiterCriteria(int currentPageNo, int recordsPerPage){
        this.currentPageNo = currentPageNo;
        this.recordsPerPage = recordsPerPage;
    }

}
