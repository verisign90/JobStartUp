package com.pickmeup.jobstartup.qna.dto;

import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class QuestionDTO {
    private long q_no;
    private String q_content;
    private LocalDateTime q_regDate;
    private LocalDateTime q_modDate;
    private long member_no;
    private long company_no;
    private String q_type;
    private String q_category;
    private List<QuestionFileDTO> questionFileDTOList;

    @Builder
    public QuestionDTO(String q_content, long member_no, long company_no, String q_type, String q_category) {
        this.q_content = q_content;
        this.member_no = member_no;
        this.company_no = company_no;
        this.q_type = q_type;
        this.q_category = q_category;
    }
}
