package com.pickmeup.jobstartup.dao;

import com.pickmeup.jobstartup.dto.TestDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TestDAO {

    public List<TestDTO> selectTest();

}
