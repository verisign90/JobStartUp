package com.pickmeup.jobstartup.member.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.header.writers.frameoptions.XFrameOptionsHeaderWriter;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
    private final LoginSuccessHandler loginSuccessHandler;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public CustomAccessDeniedHandler accessDeniedHandler() {
        return new CustomAccessDeniedHandler();
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http, HandlerMappingIntrospector introspector) throws Exception {
        http
                .authorizeRequests((authorizeHttpRequests) -> {

                    // "/" 경로는 모든 사용자가 접근 가능
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/jobfair/list"),
                                    new MvcRequestMatcher(introspector, "/jobfair/detail/**"),
                                    new MvcRequestMatcher(introspector, "/recruiter/JPlist"),
                                    new MvcRequestMatcher(introspector, "/recruiter/JPdetail/**"),
                                    new MvcRequestMatcher(introspector, "/")
                            ).permitAll();

                    // "/jobfair/" 관련 경로
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/jobfair/entry")
                            ).access("hasAuthority('UNAPPROVED_COMPANY') or hasAuthority('COMPANY') or hasAnyAuthority('ADMIN')");

                    // "/member/" 관련 경로
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/member/**")
                            ).permitAll();

                    // "/join/" & "/login/" 관련 경로
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/join"),
                                    new MvcRequestMatcher(introspector, "/join/**"),
                                    new MvcRequestMatcher(introspector, "/login"),
                                    new MvcRequestMatcher(introspector, "/login/**")
                            ).permitAll();

                    // "/notice/" 관련 경로
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/notice/list"),
                                    new MvcRequestMatcher(introspector, "/notice/list/**"),
                                    new MvcRequestMatcher(introspector, "/notice/read/**")
                            ).permitAll();

                    // "/qna/" 관련 경로
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/qna/modify"),
                                    new MvcRequestMatcher(introspector, "/qna/modify/**"),
                                    new MvcRequestMatcher(introspector, "/qna/delete"),
                                    new MvcRequestMatcher(introspector, "/qna/delete/**")
                            ).access("hasAuthority('COMMON') or hasAnyAuthority('ADMIN')");

                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/qna/list"),
                                    new MvcRequestMatcher(introspector, "/qna/list/**"),
                                    new MvcRequestMatcher(introspector, "/qna/qfileDownload/**"),
                                    new MvcRequestMatcher(introspector, "/qna/afileDownload/**"),
                                    new MvcRequestMatcher(introspector, "/qna/write"),
                                    new MvcRequestMatcher(introspector, "/qna/write/**"),
                                    new MvcRequestMatcher(introspector, "/qna/recruiter/write"),
                                    new MvcRequestMatcher(introspector, "/qna/recruiter/write/**")
                            ).access("hasAuthority('COMPANY') or hasAuthority('COMMON') or hasAnyAuthority('ADMIN')");


                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/qna/recruiter/boardList"),
                                    new MvcRequestMatcher(introspector, "/qna/recruiter/boardList/**"),
                                    new MvcRequestMatcher(introspector, "/qna/recruiter/list"),
                                    new MvcRequestMatcher(introspector, "/qna/recruiter/list/**"),
                                    new MvcRequestMatcher(introspector, "/qna/answer"),
                                    new MvcRequestMatcher(introspector, "/qna/answer/**"),
                                    new MvcRequestMatcher(introspector, "/qna/modifyAnswer"),
                                    new MvcRequestMatcher(introspector, "/qna/modifyAnswer/**"),
                                    new MvcRequestMatcher(introspector, "/qna/deleteAnswer"),
                                    new MvcRequestMatcher(introspector, "/qna/deleteAnswer/**")
                            ).access("hasAuthority('COMPANY') or hasAnyAuthority('ADMIN')");

                    // "/recruiter/" 관련 경로
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/recruiter"),
                                    new MvcRequestMatcher(introspector, "/recruiter/**")
                            ).access("hasAuthority('COMPANY') or hasAuthority('ADMIN')");

                    // "/seeker/" 관련 경로
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/seeker/**")
                            ).access("hasAuthority('COMMON') or hasAuthority('ADMIN')");

                    // "/message/" 관련 경로
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/message/**"),
                                    new MvcRequestMatcher(introspector, "/message/write"),
                                    new MvcRequestMatcher(introspector, "/message/list"),
                                    new MvcRequestMatcher(introspector, "/message/list/**"),
                                    new MvcRequestMatcher(introspector, "/message/sentList"),
                                    new MvcRequestMatcher(introspector, "/message/read"),
                                    new MvcRequestMatcher(introspector, "/message/sentRead"),
                                    new MvcRequestMatcher(introspector, "/message/receiver/delete"),
                                    new MvcRequestMatcher(introspector, "/message/sender/delete")
                            ).access("hasAuthority('COMPANY') or hasAuthority('COMMON') or hasAnyAuthority('ADMIN')");

                    // ADMIN은 모든 접근 허용
                    authorizeHttpRequests
                            .requestMatchers(
                                    new MvcRequestMatcher(introspector, "/admin/**"),
                                    new MvcRequestMatcher(introspector, "/jabfair/**"),
                                    new MvcRequestMatcher(introspector, "/notice/**"),
                                    new MvcRequestMatcher(introspector, "/qna/**")
                            ).hasAuthority("ADMIN");

                })
                .exceptionHandling(authenticationManager -> authenticationManager
                        .accessDeniedHandler(new CustomAccessDeniedHandler()))
                .headers((headers) -> headers.addHeaderWriter(new XFrameOptionsHeaderWriter(
                        XFrameOptionsHeaderWriter.XFrameOptionsMode.SAMEORIGIN)))
                .formLogin((formLogin) -> formLogin
                        .loginPage("/login")
                        .successHandler(loginSuccessHandler)
                        .failureUrl("/login?error=true"))
                .logout((logout) -> logout
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                        .logoutSuccessUrl("/")
                        .invalidateHttpSession(true))
                .csrf(csrf -> csrf.disable());
        return http.build();
    }

    @Bean
    AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public HttpFirewall defaultHttpFirewall() {
        return new DefaultHttpFirewall();
    }
}