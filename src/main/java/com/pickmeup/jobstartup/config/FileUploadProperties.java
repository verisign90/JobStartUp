package com.pickmeup.jobstartup.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "file")
public class FileUploadProperties {

    private String jobFair;
}
