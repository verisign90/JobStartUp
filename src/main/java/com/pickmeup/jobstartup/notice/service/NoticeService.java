package com.pickmeup.jobstartup.notice.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.notice.dto.NoticeDTO;
import org.springframework.web.multipart.MultipartFile;

public interface NoticeService {
    public void write(NoticeDTO noticeDTO, MultipartFile[] multipartFiles) throws Exception;

    //게시글 목록 조회 - 페이징
    public PagingResponse<NoticeDTO> getList(Criteria criteria) throws Exception;
    
    //게시글 상세 조회
    public NoticeDTO readDatail(long notNo);
    
    //게시글 수정 - file 추가
    public void modify(NoticeDTO noticeDTO, MultipartFile[] multipartFiles) throws Exception;

    //게시글 수정 - file 삭제 및 추가
    public void modify(NoticeDTO noticeDTO, MultipartFile[] multipartFiles, long[] preFileNo) throws Exception;

    //게시글 삭제 - notNo
    void delete(long notNo) throws Exception;

}
