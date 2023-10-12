package com.pickmeup.jobstartup.seeker.applicationSupport.dto;

import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class CompanyFollowDTO {

    private int follow_no; //PK.팔로우번호
    private int company_no; //FK.회사번호
    private int member_no; //FK.회원번호

    private List<ApplyDTO> applyDTOList;
    private List<JobPostingDTO> jobPostingDTOList;

    @Builder
    public CompanyFollowDTO(int follow_no, int company_no, int member_no) {
        this.follow_no = follow_no;
        this.company_no = company_no;
        this.member_no = member_no;
    }
}
