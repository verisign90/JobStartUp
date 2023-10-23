package com.pickmeup.jobstartup.member.service;

import com.pickmeup.jobstartup.member.config.CustomUserDetails;
import com.pickmeup.jobstartup.member.config.UserRole;
import com.pickmeup.jobstartup.member.dto.CompanyDTO;
import com.pickmeup.jobstartup.member.dto.MenuDTO;
import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.entity.MemberType;
import com.pickmeup.jobstartup.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserSecurityService implements UserDetailsService {
    private final MemberRepository memberRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member member = memberRepository.findByUsername(username);
        if (member == null) {
            throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + username);
        }

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

        if (member.getMember_id().contains("admin")) {
            grantedAuthorities.addAll(UserRole.ADMIN.getGrantedAuthorities());
            log.info("관리자 권한이 부여된 사용자: {}", username);
        } else {
            MemberType memberType = member.getMember_type();
            UserRole userRole = UserRole.valueOf(memberType.name());
            grantedAuthorities.addAll(userRole.getGrantedAuthorities());
        }
        log.info("시큐리티 서비스 Loaded user: {}, with authorities: {}", username, grantedAuthorities);

        CompanyDTO companyDTO = memberRepository.findCompanyNoByMemberNo(member.getMember_no());
        
        //memberType 분리
        String memberType = null;
        switch (member.getMember_type()) {
            case ADMIN -> memberType = "3";
            case COMMON -> memberType = "1";
            case COMPANY -> memberType = "2";
            case UNAPPROVED_COMPANY -> memberType = "4";
        }
        
        //menuBar 구성
        ArrayList<MenuDTO> hirMenuList = memberRepository.getMenuListBymemberType(memberType, 1L);
        ArrayList<MenuDTO> menuList = memberRepository.getMenuListBymemberType(memberType, 2L);
        ArrayList<MenuDTO> downMenuList = memberRepository.getMenuListBymemberType(memberType, 3L);

        if (companyDTO == null) {
            return new CustomUserDetails(
                    member.getMember_id(),
                    member.getMember_pw(),
                    grantedAuthorities,
                    member.getMember_no(),
                    hirMenuList,
                    menuList,
                    downMenuList
            );
        } else
            return new CustomUserDetails(
                    member.getMember_id(),
                    member.getMember_pw(),
                    grantedAuthorities,
                    member.getMember_no(),
                    companyDTO.getCompany_no(),
                    hirMenuList,
                    menuList,
                    downMenuList
            );
    }
}