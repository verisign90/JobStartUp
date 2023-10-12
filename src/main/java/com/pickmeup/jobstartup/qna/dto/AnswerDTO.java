package com.pickmeup.jobstartup.qna.dto;

import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AnswerDTO {
    private long a_no;
    private String a_content;
    private LocalDateTime a_regDate;
    private LocalDateTime a_modDate;
    private long member_no;
    private long q_no;
    private List<AnswerFileDTO> answerFileDTOList;

    @Builder
    public AnswerDTO(String a_content, long member_no, long q_no) {
        this.a_content = a_content;
        this.member_no = member_no;
        this.q_no = q_no;
    }
}
