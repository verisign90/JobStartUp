package com.pickmeup.jobstartup.recruiter.jobposting.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class JobPostingConfig implements WebMvcConfigurer  {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler( "/image/mypage/**")
                .addResourceLocations("file:///C:/jobStartUp_fileUpload/company/logo/");
    }
}
