package com.pickmeup.jobstartup.admin.repository;

import com.pickmeup.jobstartup.admin.dto.SampleDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SampleDAO {

    public List<SampleDTO> selectSampleDTOs();
}
