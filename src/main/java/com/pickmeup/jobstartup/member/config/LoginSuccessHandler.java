package com.pickmeup.jobstartup.member.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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

        if (roles.contains("COMMON")) {
            response.sendRedirect("/");
        } else if (roles.contains("COMPANY")) {
            response.sendRedirect("/recruiter/myPage");
        } else if (roles.contains("ADMIN")) {
            response.sendRedirect("/admin/dashboard");
        } else if (roles.contains("UNAPPROVED_COMPANY")) {
            response.sendRedirect("/apply/apply");
        } else {
            response.sendRedirect("/login");
        }
    }
}
