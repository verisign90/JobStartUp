package com.pickmeup.jobstartup.notice.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.Pagination;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.notice.dto.NoticeDTO;
import com.pickmeup.jobstartup.notice.dto.NoticeFileDTO;
import com.pickmeup.jobstartup.notice.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeRepository noticeRepository;
    private String uploadPath = "C:/jobStartUp_fileUpload/notice/";

    @Override
    @Transactional
    public void write(NoticeDTO noticeDTO, MultipartFile[] multipartFiles) throws Exception {
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

    @Override
    public NoticeDTO readDatail(long notNo) {
        NoticeDTO noticeDTO = noticeRepository.selectNotice(notNo);
        List<NoticeFileDTO> noticeFileDTOList = noticeRepository.selectNoticeFile(notNo);
        if(noticeFileDTOList.isEmpty()) {
            return noticeDTO;
        } else {
            noticeDTO.setFileDTOList(noticeFileDTOList);
        }
            return noticeDTO;
    }

    @Override
    @Transactional
    public void modify(NoticeDTO noticeDTO, MultipartFile[] multipartFiles) throws Exception {
        //기존에 저장된 file 목록 조회
        long notNo = noticeDTO.getNot_no();
        List<NoticeFileDTO> noticeFileDTOList = noticeRepository.selectNoticeFile(notNo);

        if(noticeFileDTOList!=null) {
            // 저장된 모든 파일 삭제 - local
            for(NoticeFileDTO noticeFileDTO : noticeFileDTOList) {
                Path file = Paths.get(uploadPath+noticeFileDTO.getNotFile_savName());
                Files.deleteIfExists(file);
            }
            // 저장된 모든 파일 삭제 - DB
            noticeRepository.deleteFileAll(notNo);
        }

        //notice update 및 file 추가
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            noticeRepository.updateNoticeDTO(noticeDTO);
        } else {
            NoticeFileDTO noticeFileDTO = new NoticeFileDTO();
            File directory = new File(uploadPath);
            if(!directory.exists()) {
                directory.mkdirs();
            }
            noticeRepository.updateNoticeDTO(noticeDTO);
            for(MultipartFile noticefiles : multipartFiles){
                String notFile_orgName = noticefiles.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String notFile_savName = uuid.toString()+"_"+notFile_orgName;
                String notFile_type = noticefiles.getContentType();
                File saveFile = new File(uploadPath, notFile_savName);
                noticefiles.transferTo(saveFile);
                noticeFileDTO = NoticeFileDTO.builder()
                        .not_no(notNo)
                        .notFile_orgName(notFile_orgName)
                        .notFile_savName(notFile_savName)
                        .notFile_type(notFile_type)
                        .build();
                noticeRepository.insertNoticeFileDTO(noticeFileDTO);
            }
        }
    }

    @Override
    @Transactional
    public void modify(NoticeDTO noticeDTO, MultipartFile[] multipartFiles, long[] preFileNo) throws Exception {
        long notNo = noticeDTO.getNot_no();
        //기존에 저장된 file 목록 조회
        List<NoticeFileDTO> noticeFileDTOList = noticeRepository.selectNoticeFile(notNo);
        if(noticeFileDTOList!=null) {
            // 저장된 모든 파일 삭제 - local
            List<Long> delteNoList = new ArrayList<>();
            for (NoticeFileDTO noticeFileDTO : noticeFileDTOList) {
                long notFile_no = noticeFileDTO.getNotFile_no();
                boolean found = false;
                for (long fileNo : preFileNo) {
                    if (notFile_no == fileNo) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    delteNoList.add(notFile_no);
                }
            }
            //삭제 될 file 목록 조회
            for(Long notFileNo : delteNoList){
                NoticeFileDTO deleteFileDTO = noticeRepository.selectNoticeFileByFileNo(notFileNo);
                Path file = Paths.get(uploadPath+deleteFileDTO.getNotFile_savName());
                Files.deleteIfExists(file);
                noticeRepository.deleteFileByFileNo(notFileNo);
            }
        }

        //notice update 및 file 추가
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            noticeRepository.updateNoticeDTO(noticeDTO);
        } else {
            NoticeFileDTO noticeFileDTO = new NoticeFileDTO();
            File directory = new File(uploadPath);
            if(!directory.exists()) {
                directory.mkdirs();
            }
            noticeRepository.updateNoticeDTO(noticeDTO);
            long no = noticeDTO.getNot_no();
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
    public void delete(long notNo) throws Exception {
        List<NoticeFileDTO> noticeFileDTOList = noticeRepository.selectNoticeFile(notNo);
        if(noticeFileDTOList!=null) {
            // 저장된 모든 파일 삭제 - local
            for(NoticeFileDTO noticeFileDTO : noticeFileDTOList) {
                Path file = Paths.get(uploadPath+noticeFileDTO.getNotFile_savName());
                Files.deleteIfExists(file);
            }
            // 저장된 모든 파일 삭제 - DB
            noticeRepository.deleteFileAll(notNo);
        }
        noticeRepository.deleteNoticeByNo(notNo);
    }

}
