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
            .authorizeRequests((authorizeHttpRequests) -> authorizeHttpRequests
                    .requestMatchers(new MvcRequestMatcher(introspector, "/admin/dashboard"),
                                     new MvcRequestMatcher(introspector, "/jobfair/**")).hasAuthority("ADMIN")
                    .requestMatchers(new MvcRequestMatcher(introspector, "/admin/dashboard"),
                                     new MvcRequestMatcher(introspector, "/jobfair/**")).hasAuthority("ADMIN")
                    .requestMatchers(new AntPathRequestMatcher("/apply/**")).hasAuthority("UNAPPROVED_COMPANY")
                    .requestMatchers(new AntPathRequestMatcher("/recruiter/**")).hasAuthority("COMPANY")
                    .requestMatchers(new AntPathRequestMatcher("/seeker/**")).hasAuthority("COMMON")
                    .requestMatchers(new AntPathRequestMatcher("/**")).permitAll())
            .exceptionHandling(authenticationManager -> authenticationManager
                    .accessDeniedHandler(new CustomAccessDeniedHandler()))
            .headers((headers) -> headers.addHeaderWriter(new XFrameOptionsHeaderWriter(
                    XFrameOptionsHeaderWriter.XFrameOptionsMode.SAMEORIGIN)))
            .formLogin((formLogin)->formLogin
                    .loginPage("/login")
                    .successHandler(loginSuccessHandler)
                    .failureUrl("/login?error=true"))
            .logout((logout) -> logout
                    .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                    .logoutSuccessUrl("/login")
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
