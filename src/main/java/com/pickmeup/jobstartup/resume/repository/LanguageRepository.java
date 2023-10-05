package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.LanguageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface LanguageRepository {

    public int insertLanguage (List<LanguageDTO> languageDTO);
}
