package com.pickmeup.jobstartup.recruiter.companypage.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CompanypageFileConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler( "/image/companyPage/**")
                .addResourceLocations("file:///C:/jobStartUp_fileUpload/company/logo/")
                .addResourceLocations("file:///C:/jobStartUp_fileUpload/company/file/");
    }

}
