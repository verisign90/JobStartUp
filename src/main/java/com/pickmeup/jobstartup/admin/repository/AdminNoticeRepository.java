package com.pickmeup.jobstartup.admin.repository;

import com.pickmeup.jobstartup.admin.dto.AdminNoticeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AdminNoticeRepository {

    public List<AdminNoticeDTO> selectNoticeList();
}
