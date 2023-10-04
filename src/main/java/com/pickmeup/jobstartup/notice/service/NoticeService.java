package com.pickmeup.jobstartup.notice.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.notice.dto.NoticeDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    public void write(NoticeDTO noticeDTO, MultipartFile[] multipartFiles) throws Exception;

    //게시글 목록 조회 - 페이징
    public PagingResponse<NoticeDTO> getList(Criteria criteria) throws Exception;

    //게시글 검색 - 페이징
}
