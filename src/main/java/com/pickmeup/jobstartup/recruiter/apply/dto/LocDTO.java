package com.pickmeup.jobstartup.recruiter.apply.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class LocDTO {
//    private String parent_code;
    private String detail_code_num;
    private String detail_name;
    private String group_code;
    private int code_level;

   /* @Builder
    public LocDTO (LocDTO locDTO){
        this.parentCode = locDTO.getParentCode();
        this.detailName = locDTO.getDetailName();
        this.detailCodeNum = locDTO.getDetailCodeNum();
        this.groupCode = locDTO.getGroupCode();
        this.codeLevel = locDTO.getCodeLevel();
    }*/
}
