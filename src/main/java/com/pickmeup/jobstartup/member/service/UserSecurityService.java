package com.pickmeup.jobstartup.member.service;

import com.pickmeup.jobstartup.member.config.UserRole;
import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.entity.MemberType;
import com.pickmeup.jobstartup.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class UserSecurityService implements UserDetailsService {
    private final MemberRepository memberRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member member = memberRepository.findByUsername(username);
        if (member == null) {
            throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + username);
        }

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        MemberType memberType = member.getMember_type();

        UserRole userRole = UserRole.valueOf(memberType.name());
        grantedAuthorities.addAll(userRole.getGrantedAuthorities());

        return new User(
            member.getMember_id(),
            member.getMember_pw(),
            grantedAuthorities
        );
    }
}
