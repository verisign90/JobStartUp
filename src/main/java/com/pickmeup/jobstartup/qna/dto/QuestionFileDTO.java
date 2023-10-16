package com.pickmeup.jobstartup.qna.dto;

import lombok.*;

@Setter
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class QuestionFileDTO {
    private long qFile_no;
    private long q_no;
    private String qFile_orgName;
    private String qFile_savName;
    private String qFile_type;

    @Builder
    public QuestionFileDTO(long q_no, String qFile_orgName, String qFile_savName, String qFile_type) {
        this.q_no = q_no;
        this.qFile_orgName = qFile_orgName;
        this.qFile_savName = qFile_savName;
        this.qFile_type = qFile_type;
    }

}
