package com.pickmeup.jobstartup.member.dto;

import lombok.*;

import java.io.Serial;
import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MenuDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    private String menu_id;
    private String hir_menu_id;
    private String menu_name;
    private String menu_url;
    private long group_no;
    private long menu_level;
    private String member_type;
}