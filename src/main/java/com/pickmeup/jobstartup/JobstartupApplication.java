package com.pickmeup.jobstartup;

import com.pickmeup.jobstartup.config.FileUploadProperties;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties({
        FileUploadProperties.class
})
public class JobstartupApplication {

    public static void main(String[] args) {
        SpringApplication.run(JobstartupApplication.class, args);
    }

}
