package com.pickmeup.jobstartup.member.config;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CustomUserDetails extends User {
    private static final long serialVersionUID = 1L;
    private int memberNo;
    private Long companyNo;

    public CustomUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities, int memberNo) {
        super(username, password, authorities);
        this.memberNo = memberNo;
    }

    public CustomUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities, int memberNo, Long companyNo) {
        super(username, password, authorities);
        this.memberNo = memberNo;
        this.companyNo = companyNo;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public Long getCompanyNo() {
        return companyNo;
    }
}
