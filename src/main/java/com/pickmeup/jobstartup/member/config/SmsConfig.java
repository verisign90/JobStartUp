package com.pickmeup.jobstartup.member.config;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SmsConfig {
    @Bean
    public DefaultMessageService messageService() {
        return NurigoApp.INSTANCE.initialize("NCSSZCCQWSFFYWTR", "4LMR44FDIHRNAI8X6CYLAUFGJA3D9QFL", "https://api.coolsms.co.kr");
    }
}
