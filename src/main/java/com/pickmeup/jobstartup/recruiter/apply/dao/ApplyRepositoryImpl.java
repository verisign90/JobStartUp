package com.pickmeup.jobstartup.recruiter.apply.dao;

import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.FileDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
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
}
