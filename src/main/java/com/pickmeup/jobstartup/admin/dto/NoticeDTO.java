package com.pickmeup.jobstartup.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
@ToString
public class NoticeDTO {

    private int NOT_NO;
    private String NOT_TITLE;
    private String NOT_CONTENT;
    private LocalDateTime NOT_REGDATE;

    public String getNOT_REGDATE() {
        return NOT_REGDATE.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
    }
}
