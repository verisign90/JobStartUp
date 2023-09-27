package com.pickmeup.jobstartup.service;

import com.pickmeup.jobstartup.dao.TestDAO;
import com.pickmeup.jobstartup.dto.TestDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestService {

    @Autowired
    public TestDAO testDAO;

    public List<TestDTO> selectTest(){

        List<TestDTO> testData = testDAO.selectTest();
        return testData;

    };



}
