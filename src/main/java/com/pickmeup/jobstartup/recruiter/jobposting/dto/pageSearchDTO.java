package com.pickmeup.jobstartup.recruiter.jobposting.dto;

import lombok.Data;

@Data
public class pageSearchDTO {

    private int page;
    private int recordSize;
    private int pageSize;

    private String keyword;
    private String searchType;

    public void SearchDTO(){
        this.page = 1;
        this.recordSize = 10;
        this.pageSize = 10;
    }

    public int getOffset(){
        return  (page -1) * recordSize;
    }





}
