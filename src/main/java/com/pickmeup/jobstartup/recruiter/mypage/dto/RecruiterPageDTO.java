package com.pickmeup.jobstartup.recruiter.mypage.dto;

import com.pickmeup.jobstartup.common.paging.Criteria;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class RecruiterPageDTO {

    private int strPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int totalCount;
    private RecruiterCriteria criteria;

    @Builder
    public RecruiterPageDTO(RecruiterCriteria criteria, int totalCount){
        this.criteria = criteria;
        this.totalCount = totalCount;
        this.endPage = (int) (Math.ceil(criteria.getCurrentPageNo() / 10.0)) * 10;
        this.strPage = this.endPage - 9;

        int finalEnd = (int) (Math.ceil((totalCount + 10) * 1.0)/ criteria.getRecordsPerPage());
        if (finalEnd < this.endPage) {
            this.endPage = finalEnd;
        }

        this.prev = this.strPage > 1;
        this.next = this.endPage < finalEnd;
    }


}
