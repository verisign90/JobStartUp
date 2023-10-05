package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.ResumeLocDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ResumeLocRepository {

    public int insertResumeLoc (List<ResumeLocDTO> resumeLocDTO);
}
