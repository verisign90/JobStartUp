package com.pickmeup.jobstartup.admin.service;

import com.pickmeup.jobstartup.admin.dto.AdminNoticeDTO;
import com.pickmeup.jobstartup.admin.repository.AdminNoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminNoticeService {

    @Autowired
    public AdminNoticeRepository noticeRepository;

    public List<AdminNoticeDTO> getAllNotice() {
        return noticeRepository.selectNoticeList();
    }
}
