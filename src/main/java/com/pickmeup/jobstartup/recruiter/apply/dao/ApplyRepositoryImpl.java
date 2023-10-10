package com.pickmeup.jobstartup.recruiter.apply.dao;

import com.pickmeup.jobstartup.recruiter.apply.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ApplyRepositoryImpl implements ApplyRepository {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertInfo(ApplyDTO applyDTO){
        System.out.println("repository의 insertInfo까지왔음");
        sqlSession.insert("apply.insertInfo",applyDTO);
    }

    public List<LocDTO> getUpperLoc() {
        return sqlSession.selectList("apply.getUpperLoc");
    }

    public List<LocDTO> getLowerLoc(String upperLoc){
        return sqlSession.selectList("apply.getLowerLoc",upperLoc);}


    public void insertFile(FileDTO fildDTO) {
        sqlSession.insert("apply.insertFile",fildDTO);
    }

    public ApplyDTO getCompanyNo() {

       return sqlSession.selectOne("apply.getCompanyNo");
    }
    public List<JobDTO> getBusiness_type_code_up(){
        return sqlSession.selectList("apply.getBusiness_type_code_up");
    }

    public List<JobDTO> getBusiness_type_code(String business_type_code_up){
        return sqlSession.selectList("apply.getBusiness_type_code",business_type_code_up);
    }

    public void insertTest(TestDTO testDTO){
        sqlSession.insert("apply.insertTest",testDTO);
    }
}
