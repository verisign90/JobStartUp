package com.pickmeup.jobstartup.config;

import com.pickmeup.jobstartup.dto.JoinCommonDTO;
import com.pickmeup.jobstartup.entity.Member;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ModelMapperConfig {
    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        return modelMapper;
    }
}