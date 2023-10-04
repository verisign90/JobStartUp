package com.pickmeup.jobstartup.admin.service;

import com.pickmeup.jobstartup.admin.dto.NoticeDTO;
import com.pickmeup.jobstartup.admin.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    @Autowired
    public NoticeRepository noticeRepository;

    public List<NoticeDTO> getAllNotice() {
        return noticeRepository.selectNoticeList();
    }
}
