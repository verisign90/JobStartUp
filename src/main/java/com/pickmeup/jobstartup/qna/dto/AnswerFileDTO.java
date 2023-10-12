package com.pickmeup.jobstartup.qna.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AnswerFileDTO {
    private long aFile_no;
    private long a_no;
    private String aFile_orgName;
    private String aFile_savName;
    private String aFile_tye;

    @Builder
    public AnswerFileDTO(long a_no, String aFile_orgName, String aFile_savName, String aFile_tye) {
        this.a_no = a_no;
        this.aFile_orgName = aFile_orgName;
        this.aFile_savName = aFile_savName;
        this.aFile_tye = aFile_tye;
    }
}
