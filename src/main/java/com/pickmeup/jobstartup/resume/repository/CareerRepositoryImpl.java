package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.CareerDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CareerRepositoryImpl implements CareerRepository{

    @Autowired
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(CareerRepositoryImpl.class);

    @Override
    public int insertCareer (List<CareerDTO> careerDTO) {
        return sqlSession.insert("career.insertCareer", careerDTO);
    }
}
