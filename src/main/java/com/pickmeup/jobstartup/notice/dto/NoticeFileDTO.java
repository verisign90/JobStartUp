package com.pickmeup.jobstartup.notice.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NoticeFileDTO {
    private long notFile_no;
    private long not_no;
    private String notFile_orgName;
    private String notFile_savName;
    private String notFile_type;

    @Builder
    public NoticeFileDTO(long not_no, String notFile_orgName, String notFile_savName, String notFile_type) {
        this.not_no = not_no;
        this.notFile_orgName = notFile_orgName;
        this.notFile_savName = notFile_savName;
        this.notFile_type = notFile_type;
    }
}
