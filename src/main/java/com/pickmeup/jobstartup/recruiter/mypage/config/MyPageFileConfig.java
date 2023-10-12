package com.pickmeup.jobstartup.recruiter.mypage.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyPageFileConfig implements WebMvcConfigurer {

    //기업 마이페이지 file 관련 경로
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler( "/image/mypage/**")
                .addResourceLocations("file:///C:/jobStartUp_fileUpload/recruiterApply/");
    }

}
