package com.pickmeup.jobstartup.notice.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
    private long not_no;
    @NotBlank(message = "제목을 입력해주세요.")
    private String not_title;
    @NotBlank(message = "내용을 입력해주세요.")
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
