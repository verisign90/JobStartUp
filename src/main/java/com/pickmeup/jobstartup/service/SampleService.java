package com.pickmeup.jobstartup.service;

import com.pickmeup.jobstartup.dao.SampleDAO;
import com.pickmeup.jobstartup.dto.SampleDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SampleService {

    @Autowired
    public SampleDAO sampleDAO;

    public List<SampleDTO> selectSample() {
        return sampleDAO.selectSampleDTOs();
    }
}
