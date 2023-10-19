package com.pickmeup.jobstartup.recruiter.mypage.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class RecruiterPagingDTO {

    private RecruiterCriteria criteria;
    private int strPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int totalCount;

    public RecruiterPagingDTO(RecruiterCriteria criteria, int totalCount){
        this.criteria = criteria;
        this.totalCount = totalCount;
        this.endPage = (int) (Math.ceil(criteria.getCurrentPageNo() / 10.0)) * 10;
        this.strPage = this.endPage - 9;
        this.prev = this.strPage > 1;
        int finalEnd = (int) (Math.ceil((totalCount * 1.0)/ criteria.getRecordsPerPage()));
        if (finalEnd < this.endPage) {
            this.endPage = finalEnd;
        }
        this.next = this.endPage < finalEnd;
    }
}
