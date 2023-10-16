package com.pickmeup.jobstartup.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
public class RegDateDTO {

    private LocalDateTime REGDATE_ONLY;
    private Long COUNT;
}
