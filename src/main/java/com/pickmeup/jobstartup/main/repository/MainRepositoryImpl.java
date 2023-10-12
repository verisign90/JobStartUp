package com.pickmeup.jobstartup.main.repository;

import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MainRepositoryImpl implements MainRepository{

    @Autowired
    private SqlSession sqlSession;
    public List<ApplyDTO> getCompanyList(){
        return sqlSession.selectList("main.getCompanyList");
    }

    public ApplyDTO getCompanyNO(int companyNo){
        return sqlSession.selectOne("main.getCompanyNo",companyNo);
    }

    public List<JobFairDTO> getJobFairList(){
        return sqlSession.selectList("main.getJobFairList");
    }
}
