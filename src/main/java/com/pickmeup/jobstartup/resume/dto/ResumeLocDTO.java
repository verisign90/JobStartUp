package com.pickmeup.jobstartup.resume.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
public class ResumeLocDTO {
    
    private int resume_loc_no; //이력서 희망근무 글번호
    private int resume_no; //이력서 글번호
    private String loc_detail_code_num; //이력서 지역공통코드 번호

    /*@Builder
    public ResumeLocDTO (List<ResumeLocDTO> resumeLocDTO) {
        List<ResumeLocDTO> resumeLocDTOList = new ArrayList<>();

        for (ResumeLocDTO resumeLoc : resumeLocDTO) {

            this.resume_loc_no = resumeLoc.getResume_loc_no();
            this.resume_no = resumeLoc.getResume_no();
            this.loc_detail_code_num = resumeLoc.getLoc_detail_code_num();

            resumeLocDTOList.add(resumeLoc);
        }
    }*/

    @Builder
    public ResumeLocDTO(int resume_loc_no, int resume_no, String loc_detail_code_num) {
        this.resume_loc_no = resume_loc_no;
        this.resume_no = resume_no;
        this.loc_detail_code_num = loc_detail_code_num;
    }
}
