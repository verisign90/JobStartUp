package com.pickmeup.jobstartup.message.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MessageDTO {
    private long mes_no;
    private long mes_sender;
    //sender_id
    private String member_id;
    private String mes_content;
    private LocalDateTime mes_regDate;
    private long mes_receiver;
    private String sender_del;
    private String receiver_del;
    private String mes_read;

    @Builder
    public MessageDTO(long mes_sender, String mes_content, long mes_receiver) {
        this.mes_sender = mes_sender;
        this.mes_content = mes_content;
        this.mes_receiver = mes_receiver;
    }
}
