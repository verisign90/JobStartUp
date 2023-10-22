package com.pickmeup.jobstartup.qna.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MailDTO {
    private String address;
    private String title;
    private String message;
}
