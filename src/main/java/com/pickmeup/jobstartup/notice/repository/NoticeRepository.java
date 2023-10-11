package com.pickmeup.jobstartup.notice.repository;

import com.pickmeup.jobstartup.notice.dto.NoticeDTO;
import com.pickmeup.jobstartup.notice.dto.NoticeFileDTO;
import com.pickmeup.jobstartup.common.paging.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface NoticeRepository {
    //공지글 입력
    public void insertNoticeDTO(NoticeDTO noticeDTO) throws DataAccessException;
    public void insertNoticeFileDTO(NoticeFileDTO noticeFileDTO) throws DataAccessException;
    
    //공지글 최신 번호 조회
    public long selectNoticeNo() throws DataAccessException;

    //공지글 목록 조회 - 페이징
    public List<NoticeDTO> selectNoticeList(Criteria criteria) throws DataAccessException;

    //공지글 개수
    public int selectNoticeCnt(Criteria criteria) throws DataAccessException;

    //공지게시글 상세페이지
    public NoticeDTO selectNotice(long notNo);

    //공지게시글 파일리스트
    public List<NoticeFileDTO> selectNoticeFile(long notNo);

    //공지 게시글 파일 조회
    public NoticeFileDTO selectNoticeFileByFileNo(long notFileNo);

    // 공지게시글 수정
    public void updateNoticeDTO(NoticeDTO noticeDTO);

    // 파일 모두 삭제
    public void deleteFileAll(long notNo);
    
    // 파일 부분 삭제
    public void deleteFileByFileNo(long notFileNo);

    public void deleteNoticeByNo(long notNo);
}
