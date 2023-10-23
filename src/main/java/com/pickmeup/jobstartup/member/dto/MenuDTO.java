package com.pickmeup.jobstartup.member.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MenuDTO {
    private String menu_id;
    private String hir_menu_id;
    private String menu_name;
    private String menu_url;
    private long group_no;
    private long menu_level;
    private String member_type;
}
