package com.pickmeup.jobstartup.recruiter.apply.dao;

import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.FileDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ApplyRepository {

    public void insertInfo(ApplyDTO applyDTO);

    public List<LocDTO> getUpperLoc();

    public List<LocDTO> getLowerLoc(String upperLoc);

    public void insertFile(FileDTO fileDTO);
}
