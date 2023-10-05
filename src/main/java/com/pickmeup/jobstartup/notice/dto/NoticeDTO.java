package com.pickmeup.jobstartup.notice.dto;

import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
    private long not_no;
    private String not_title;
    private String not_content;
    private LocalDateTime not_regDate;
    private LocalDateTime not_modDate;
    private List<NoticeFileDTO> fileDTOList;
    private String not_category;

    @Builder
    public NoticeDTO(String not_title, String not_content) {
        this.not_title = not_title;
        this.not_content = not_content;
    }
}
