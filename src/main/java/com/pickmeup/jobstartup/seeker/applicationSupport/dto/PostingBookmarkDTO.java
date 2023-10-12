package com.pickmeup.jobstartup.seeker.applicationSupport.dto;

import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class PostingBookmarkDTO {

    private int jpbookmark_no; //PK.북마크 번호
    private Number posting_no; //FK.공고글 번호
    private int member_no; //FK.회원번호

    private List<JobPostingDTO> jobPostingDTOList;

    @Builder
    public PostingBookmarkDTO(int jpbookmark_no, int posting_no, int member_no) {
        this.jpbookmark_no = jpbookmark_no;
        this.posting_no = posting_no;
        this.member_no = member_no;
    }
}
