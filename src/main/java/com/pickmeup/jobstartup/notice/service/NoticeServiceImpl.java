package com.pickmeup.jobstartup.notice.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.Pagination;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.notice.dto.NoticeDTO;
import com.pickmeup.jobstartup.notice.dto.NoticeFileDTO;
import com.pickmeup.jobstartup.notice.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeRepository noticeRepository;

    @Override
    public void write(NoticeDTO noticeDTO, MultipartFile[] multipartFiles) throws Exception {
        String uploadPath = "C:/upload/notice/";
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            noticeRepository.insertNoticeDTO(noticeDTO);
        } else {
            NoticeFileDTO noticeFileDTO = new NoticeFileDTO();
            File directory = new File(uploadPath);
            if(!directory.exists()) {
                directory.mkdirs();
            }
            noticeRepository.insertNoticeDTO(noticeDTO);
            long no = noticeRepository.selectNoticeNo();
            for(MultipartFile noticefiles : multipartFiles){
                String notFile_orgName = noticefiles.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String notFile_savName = uuid.toString()+"_"+notFile_orgName;
                String notFile_type = noticefiles.getContentType();
                File saveFile = new File(uploadPath, notFile_savName);
                noticefiles.transferTo(saveFile);
                noticeFileDTO = NoticeFileDTO.builder()
                        .not_no(no)
                        .notFile_orgName(notFile_orgName)
                        .notFile_savName(notFile_savName)
                        .notFile_type(notFile_type)
                        .build();
                noticeRepository.insertNoticeFileDTO(noticeFileDTO);
            }
        }
    }

    @Override
    public PagingResponse<NoticeDTO> getList(Criteria criteria) throws Exception {
       int noticeCnt = noticeRepository.selectNoticeCnt(criteria);

       //조건에 해당하는 데이터가 없을 경우
       if (noticeCnt < 1) {
           return new PagingResponse<>(Collections.emptyList(), null);
       }

       //Paging 정보를 criteria에 저장
       Pagination pagination = new Pagination(noticeCnt, criteria);
       criteria.setPagination(pagination);

       //Paging 정보의 일부(firstRecordIndex, lastRecordIndex) 기준으로 데이터 조회 후, 응답 데이터 반환
       List<NoticeDTO> list = noticeRepository.selectNoticeList(criteria);
        return new PagingResponse<>(list, pagination);
    }

}
