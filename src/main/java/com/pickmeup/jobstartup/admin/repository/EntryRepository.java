package com.pickmeup.jobstartup.admin.repository;

import com.pickmeup.jobstartup.jobfair.dto.EntryCompanyDTO;
import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface EntryRepository {

    List<EntryCompanyDTO> selectEntryCompanyList();

    List<EntryCompanyDTO> paginationEntryCompany(Map<String, Integer> params);

    int countEntryCompany();

    void applyEntryCompany(Long jobFairEntryNo);

    void updateMemberType(Long companyNo);

    int countJobFairByCompanyNo(Long companyNo);

    void updateRejectCompany(Long companyNo);

    void rejectEntryCompany(Long jobFairEntryNo);

}
