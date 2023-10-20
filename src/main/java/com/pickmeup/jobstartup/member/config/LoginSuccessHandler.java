package com.pickmeup.jobstartup.member.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Set;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        HttpSession session = request.getSession();
        session.setAttribute("memberNo", ((CustomUserDetails) authentication.getPrincipal()).getMemberNo());
        Long companyNo = ((CustomUserDetails) authentication.getPrincipal()).getCompanyNo();
        if (roles.contains("COMMON")) {
            session.setAttribute("role", 1);
            response.sendRedirect("/");
        } else if (roles.contains("COMPANY")) {
            session.setAttribute("role", 2);
            session.setAttribute("companyNo", companyNo);
            response.sendRedirect("/recruiter/myPage?company_no=" + companyNo);
        } else if (roles.contains("ADMIN")) {
            session.setAttribute("role", 3);
            response.sendRedirect("/admin/dashboard");
        } else if (roles.contains("UNAPPROVED_COMPANY")) {
            session.setAttribute("role", 4);
            session.setAttribute("companyNo", ((CustomUserDetails) authentication.getPrincipal()).getCompanyNo());
            response.sendRedirect("/apply/apply");
        } else {
            session.setAttribute("role", 9);
            response.sendRedirect("/login");
        }
    }
}
