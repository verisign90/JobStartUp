package com.pickmeup.jobstartup.member.config;

import com.pickmeup.jobstartup.member.dto.MenuDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.ArrayList;
import java.util.Collection;

@Getter
@Setter
@ToString
public class CustomUserDetails extends User {
    private static final long serialVersionUID = 1L;
    private int memberNo;
    private Long companyNo;
    private String name;
    private ArrayList<MenuDTO> hirMenuList;
    private ArrayList<MenuDTO> menuList;
    private ArrayList<MenuDTO> downMenuList;

    public CustomUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities, int memberNo, ArrayList<MenuDTO> hirMenuList, ArrayList<MenuDTO> menuList, ArrayList<MenuDTO> downMenuList) {
        super(username, password, authorities);
        this.name = username;
        this.memberNo = memberNo;
        this.hirMenuList = hirMenuList;
        this.menuList = menuList;
        this.downMenuList = downMenuList;
    }

    public CustomUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities, int memberNo, Long companyNo) {
        super(username, password, authorities);
        this.name = username;
        this.memberNo = memberNo;
        this.companyNo = companyNo;
    }

    public CustomUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities, int memberNo, Long companyNo, ArrayList<MenuDTO> hirMenuList, ArrayList<MenuDTO> menuList, ArrayList<MenuDTO> downMenuList) {
        super(username, password, authorities);
        this.name = username;
        this.memberNo = memberNo;
        this.companyNo = companyNo;
        this.hirMenuList = hirMenuList;
        this.menuList = menuList;
        this.downMenuList = downMenuList;
    }
}
