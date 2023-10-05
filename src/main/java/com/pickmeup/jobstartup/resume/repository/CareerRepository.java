package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.CareerDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CareerRepository {
    public int insertCareer (List<CareerDTO> careerDTO);
}
