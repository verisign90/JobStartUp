package com.pickmeup.jobstartup.admin.service;

import com.pickmeup.jobstartup.admin.repository.EntryRepository;
import com.pickmeup.jobstartup.jobfair.dto.EntryCompanyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EntryService {

    @Autowired
    EntryRepository entryRepository;

    public List<EntryCompanyDTO> getAllEntryCompany() {
        return entryRepository.selectEntryCompanyList();
    }

    public Map<String, Object> getAllEntryCompany(int page, int size) {
        int offset = (page - 1) * size;

        Map<String, Integer> paramMap = new HashMap<>();
        paramMap.put("offset", offset);
        paramMap.put("size", size);

        List<EntryCompanyDTO> entryCompanyList = entryRepository.paginationEntryCompany(paramMap);
        int totalCount = entryRepository.countEntryCompany();
        int totalPages = (int) Math.ceil((double) totalCount / size);

        Map<String, Object> result = new HashMap<>();
        result.put("entryCompanyList", entryCompanyList);
        result.put("totalPages", totalPages);
        return result;
    }

    public void applyEntryCompany(Long jobFairEntryNo, Long companyNo) {
        entryRepository.applyEntryCompany(jobFairEntryNo);
        entryRepository.updateMemberType(companyNo);
    }

    public void rejectEntryCompany(Long jobFairEntryNo, Long companyNo) {
        int cnt = entryRepository.countJobFairByCompanyNo(companyNo);

        if (cnt < 2) {
            entryRepository.updateRejectCompany(companyNo);
        }
        entryRepository.rejectEntryCompany(jobFairEntryNo);
    }
}
