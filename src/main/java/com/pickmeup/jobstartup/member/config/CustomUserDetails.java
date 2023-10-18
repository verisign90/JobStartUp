package com.pickmeup.jobstartup.member.config;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CustomUserDetails extends User {

    private int memberNo;

    public CustomUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities, int memberNo) {
        super(username, password, authorities);
        this.memberNo = memberNo;
    }

    public int getMemberNo(){
        return memberNo;
    }
}
