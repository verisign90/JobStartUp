package com.pickmeup.jobstartup.qna.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.Pagination;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.qna.dto.AnswerDTO;
import com.pickmeup.jobstartup.qna.dto.AnswerFileDTO;
import com.pickmeup.jobstartup.qna.dto.QuestionDTO;
import com.pickmeup.jobstartup.qna.dto.QuestionFileDTO;
import com.pickmeup.jobstartup.qna.repository.QnARepository;
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
public class QnAServiceImpl implements QnAService{

    private final QnARepository qnARepository;
    private String uploadQPath = "C:/jobStartUp_fileUpload/qna/question/";
    private String uploadAPath = "C:/jobStartUp_fileUpload/qna/answer/";

    @Transactional
    @Override
    public void write(QuestionDTO questionDTO, MultipartFile[] multipartFiles) throws Exception {
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            qnARepository.insertQuestion(questionDTO);
        } else {
            QuestionFileDTO questionFileDTO = new QuestionFileDTO();
            File directory = new File(uploadQPath);
            if(!directory.exists()) {
                directory.mkdirs();
            }
            qnARepository.insertQuestion(questionDTO);
            long qno = qnARepository.selectQno();
            for(MultipartFile qfiles : multipartFiles){
                String qFile_orgName = qfiles.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String qFile_savName = uuid.toString()+"_"+qFile_orgName;
                String qFile_type = qfiles.getContentType();
                File saveFile = new File(uploadQPath, qFile_savName);
                qfiles.transferTo(saveFile);
                questionFileDTO = QuestionFileDTO.builder()
                                .q_no(qno)
                                .qFile_orgName(qFile_orgName)
                                .qFile_savName(qFile_savName)
                                .qFile_type(qFile_type)
                                .build();
                qnARepository.insertQuestionFile(questionFileDTO);
            }
        }
    }
    
    //개인 및 관리자
    @Override
    public PagingResponse<QuestionDTO> getList(long memberNo, Criteria criteria) throws Exception {
        int currentPageNo = criteria.getCurrentPageNo();
        //글 목록 가져오기
        int questionCnt = qnARepository.selectQuestionCnt(memberNo);
        System.out.println(questionCnt);
        if (questionCnt < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }
        //Paging 정보를 criteria에 저장
        criteria.setRecordsPerPage(3);
        criteria.setPageSize(5);
        Pagination pagination = new Pagination(questionCnt, criteria);
        criteria.setPagination(pagination);
        criteria.setCurrentPageNo(currentPageNo);
        List<QuestionDTO> questionList = qnARepository.selectQuestionList(memberNo, criteria);
        for(QuestionDTO questionDTO :questionList) {
            long qNo = questionDTO.getQ_no();
            //fileList
            List<QuestionFileDTO> questionFileDTOList = qnARepository.selectQFileList(qNo);
            if(!questionFileDTOList.isEmpty()) {
                questionDTO.setQuestionFileDTOList(questionFileDTOList);
            }
            //answer
            AnswerDTO answerDTO = qnARepository.selectAnswerByQno(qNo);
            if(answerDTO!=null){
                long aNo = answerDTO.getA_no();
                List<AnswerFileDTO> answerFileDTOList = qnARepository.selectAnswerFileByAno(aNo);
                if(!answerFileDTOList.isEmpty()) {
                    answerDTO.setAnswerFileDTOList(answerFileDTOList);
                }
                questionDTO.setAnswerDTO(answerDTO);
            }
        }
        return new PagingResponse<>(questionList, pagination);
    }
    
    
    //회사 QnA
    @Override
    public PagingResponse<QuestionDTO> getCompanyQnAList(long companyNo, Criteria criteria) {
        int currentPageNo = criteria.getCurrentPageNo();
        //글 목록 가져오기
        int questionCnt = qnARepository.selectCompanyQnACnt(companyNo);
        if (questionCnt < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }
        //Paging 정보를 criteria에 저장
        criteria.setRecordsPerPage(3);
        criteria.setPageSize(5);
        Pagination pagination = new Pagination(questionCnt, criteria);
        criteria.setPagination(pagination);
        criteria.setCurrentPageNo(currentPageNo);
        List<QuestionDTO> questionList = qnARepository.selectCompanyQnAList(companyNo, criteria);

        for(QuestionDTO questionDTO :questionList) {
            long qNo = questionDTO.getQ_no();
            //fileList
            List<QuestionFileDTO> questionFileDTOList = qnARepository.selectQFileList(qNo);
            if(!questionFileDTOList.isEmpty()) {
                questionDTO.setQuestionFileDTOList(questionFileDTOList);
            }
            //answer
            AnswerDTO answerDTO = qnARepository.selectAnswerByQno(qNo);
            if(answerDTO!=null){
                long aNo = answerDTO.getA_no();
                List<AnswerFileDTO> answerFileDTOList = qnARepository.selectAnswerFileByAno(aNo);
                if(!answerFileDTOList.isEmpty()) {
                    answerDTO.setAnswerFileDTOList(answerFileDTOList);
                }
                questionDTO.setAnswerDTO(answerDTO);
            }
        }
        return new PagingResponse<>(questionList, pagination);
    }

    //댓글 달기
    @Override
    @Transactional
    public void answerWrite(AnswerDTO answerDTO, MultipartFile[] multipartFiles) throws Exception {
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            qnARepository.insertAnswer(answerDTO);
        } else {
            AnswerFileDTO answerFileDTO = new AnswerFileDTO();
            File directory = new File(uploadAPath);
            if(!directory.exists()) {
                directory.mkdirs();
            }
            qnARepository.insertAnswer(answerDTO);
            long ano = qnARepository.selectAno();
            for(MultipartFile afiles : multipartFiles){
                String aFile_orgName = afiles.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String aFile_savName = uuid.toString()+"_"+aFile_orgName;
                String aFile_type = afiles.getContentType();
                File saveFile = new File(uploadAPath, aFile_savName);
                afiles.transferTo(saveFile);
                answerFileDTO = AnswerFileDTO.builder()
                        .a_no(ano)
                        .aFile_orgName(aFile_orgName)
                        .aFile_savName(aFile_savName)
                        .aFile_type(aFile_type)
                        .build();
                qnARepository.insertAnswerFile(answerFileDTO);
            }
        }
    }

    @Override
    public QuestionDTO getQuestion(long qNo) throws Exception {
        QuestionDTO questionDTO = qnARepository.selectQuestionByQno(qNo);
        //fileList
        List<QuestionFileDTO> questionFileDTOList = qnARepository.selectQFileList(qNo);
        if(!questionFileDTOList.isEmpty()) {
            questionDTO.setQuestionFileDTOList(questionFileDTOList);
        }
        return questionDTO;
    }

    @Override
    @Transactional
    public void modifyQuestion(QuestionDTO questionDTO, MultipartFile[] multipartFiles) throws Exception {
        //기존에 저장된 file 목록 조회
        long qNo = questionDTO.getQ_no();
        List<QuestionFileDTO> questionFileDTOList = qnARepository.selectQFileList(qNo);

        if(!questionFileDTOList.isEmpty() || questionFileDTOList!=null) {
            // 저장된 모든 파일 삭제 - local
            for(QuestionFileDTO questionFileDTO : questionFileDTOList) {
                Path file = Paths.get(uploadQPath+questionFileDTO.getQFile_savName());
                Files.deleteIfExists(file);
            }
            // 저장된 모든 파일 삭제 - DB
            qnARepository.deleteFileAll(qNo);
        }

        //question update 및 file 추가
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            qnARepository.updateQuestion(questionDTO);
        } else {
            QuestionFileDTO questionFileDTO = new QuestionFileDTO();
            File directory = new File(uploadQPath);
            if(!directory.exists()) {
                directory.mkdirs();
            }
            qnARepository.updateQuestion(questionDTO);
            for(MultipartFile qfiles : multipartFiles){
                String qFile_orgName = qfiles.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String qFile_savName = uuid.toString()+"_"+qFile_orgName;
                String qFile_type = qfiles.getContentType();
                File saveFile = new File(uploadQPath, qFile_savName);
                qfiles.transferTo(saveFile);
                questionFileDTO = QuestionFileDTO.builder()
                        .q_no(qNo)
                        .qFile_orgName(qFile_orgName)
                        .qFile_savName(qFile_savName)
                        .qFile_type(qFile_type)
                        .build();
                qnARepository.insertQuestionFile(questionFileDTO);
            }
        }
    }

    @Override
    @Transactional
    public void modifyQuestion(QuestionDTO questionDTO, MultipartFile[] multipartFiles, long[] preFileNo) throws Exception {
        //기존에 저장된 file 목록 조회
        long qNo = questionDTO.getQ_no();
        List<QuestionFileDTO> questionFileDTOList = qnARepository.selectQFileList(qNo);
        if(!questionFileDTOList.isEmpty() || questionFileDTOList!=null) {
            // 저장된 모든 파일 삭제 - local
            List<Long> delteNoList = new ArrayList<>();
            for(QuestionFileDTO questionFileDTO : questionFileDTOList){
                long qFile_no = questionFileDTO.getQFile_no();
                boolean found = false;
                for (long fileNo : preFileNo) {
                    if (qFile_no == fileNo) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    delteNoList.add(qFile_no);
                }
            }

            //삭제 될 file 목록 조회
            for(Long qFileNo : delteNoList){
                QuestionFileDTO deleteFileDTO = qnARepository.selectQuestionFileByFileNo(qFileNo);
                Path file = Paths.get(uploadQPath+deleteFileDTO.getQFile_savName());
                Files.deleteIfExists(file);
                qnARepository.deleteFileByFileNo(qFileNo);
            }
        }

        //question update 및 file 추가
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            qnARepository.updateQuestion(questionDTO);
        } else {
            QuestionFileDTO questionFileDTO = new QuestionFileDTO();
            File directory = new File(uploadQPath);
            if(!directory.exists()) {
                directory.mkdirs();
            }
            qnARepository.updateQuestion(questionDTO);
            for(MultipartFile qfiles : multipartFiles){
                String qFile_orgName = qfiles.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String qFile_savName = uuid.toString()+"_"+qFile_orgName;
                String qFile_type = qfiles.getContentType();
                File saveFile = new File(uploadQPath, qFile_savName);
                qfiles.transferTo(saveFile);
                questionFileDTO = QuestionFileDTO.builder()
                        .q_no(qNo)
                        .qFile_orgName(qFile_orgName)
                        .qFile_savName(qFile_savName)
                        .qFile_type(qFile_type)
                        .build();
                qnARepository.insertQuestionFile(questionFileDTO);
            }
        }
    }

    @Transactional
    @Override
    public void delete(long qNo) throws Exception {
        List<QuestionFileDTO> questionFileDTOList = qnARepository.selectQFileList(qNo);
        AnswerDTO answerDTO = qnARepository.selectAnswerByQno(qNo);
        //댓글 삭제
        if(answerDTO!=null) {
            long aNo = answerDTO.getA_no();
            List<AnswerFileDTO> answerFileDTOList = qnARepository.selectAnswerFileByAno(aNo);
            if(answerFileDTOList!=null || !answerFileDTOList.isEmpty()) {
                //저장된 모든 댓글 파일 삭제 - local
                for(AnswerFileDTO answerFileDTO : answerFileDTOList){
                    Path file = Paths.get(uploadAPath+answerFileDTO.getAFile_savName());
                    Files.deleteIfExists(file);
                }
                //저장된 모든 댓글 파일 삭제 - DB
                qnARepository.deleteAnswerFileAll(aNo);
            }
            qnARepository.deleteAnswerByNo(aNo);
        }
        if(questionFileDTOList!=null || !questionFileDTOList.isEmpty()) {
            for(QuestionFileDTO questionFileDTO : questionFileDTOList) {
                Path file = Paths.get(uploadQPath+questionFileDTO.getQFile_savName());
                Files.deleteIfExists(file);
            }
            qnARepository.deleteFileAll(qNo);
        }
        qnARepository.deleteQuestionByNo(qNo);
    }

    @Override
    public AnswerDTO detailAnswer(long qNo) throws Exception {
        AnswerDTO answerDTO = qnARepository.selectAnswerByQno(qNo);
        List<AnswerFileDTO> answerFileDTOList = qnARepository.selectAnswerFileByAno(answerDTO.getA_no());
        if(answerFileDTOList!=null || !answerFileDTOList.isEmpty()) {
            answerDTO.setAnswerFileDTOList(answerFileDTOList);
        }
        return answerDTO;
    }

    @Transactional
    @Override
    public void modifyAnswer(AnswerDTO answerDTO, MultipartFile[] multipartFiles) throws Exception {
        //기존에 저장된 file 목록 조회
        long aNo = answerDTO.getA_no();
        List<AnswerFileDTO> answerFileDTOList = qnARepository.selectAnswerFileByAno(aNo);

        if(answerFileDTOList!=null || !answerFileDTOList.isEmpty()) {
            // 저장된 모든 파일 삭제 - local
            for(AnswerFileDTO AnswerFileDTO : answerFileDTOList) {
                Path file = Paths.get(uploadAPath+AnswerFileDTO.getAFile_savName());
                Files.deleteIfExists(file);
            }
            // 저장된 모든 파일 삭제 - DB
            qnARepository.deleteAnswerFileAll(aNo);
        }

        //question update 및 file 추가
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            qnARepository.updateAnswer(answerDTO);
        } else {
            AnswerFileDTO answerFileDTO = new AnswerFileDTO();
            File directory = new File(uploadAPath);
            if(!directory.exists()) {
                directory.mkdirs();
            }
            qnARepository.updateAnswer(answerDTO);
            for(MultipartFile afiles : multipartFiles){
                String aFile_orgName = afiles.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String aFile_savName = uuid.toString()+"_"+aFile_orgName;
                String aFile_type = afiles.getContentType();
                File saveFile = new File(uploadAPath, aFile_savName);
                afiles.transferTo(saveFile);
                answerFileDTO = AnswerFileDTO.builder()
                        .a_no(aNo)
                        .aFile_orgName(aFile_orgName)
                        .aFile_savName(aFile_savName)
                        .aFile_type(aFile_type)
                        .build();
                qnARepository.insertAnswerFile(answerFileDTO);
            }
        }
    }

    @Transactional
    @Override
    public void modifyAnswer(AnswerDTO answerDTO, MultipartFile[] multipartFiles, long[] preFileNo) throws Exception {
        //기존에 저장된 file 목록 조회
        long aNo = answerDTO.getA_no();
        List<AnswerFileDTO> answerFileDTOList = qnARepository.selectAnswerFileByAno(aNo);
        if(answerFileDTOList!=null || !answerFileDTOList.isEmpty()) {
            // 저장된 모든 파일 삭제 - local
            List<Long> delteNoList = new ArrayList<>();
            for(AnswerFileDTO AnswerFileDTO : answerFileDTOList){
                long aFile_no = AnswerFileDTO.getAFile_no();
                boolean found = false;
                for (long fileNo : preFileNo) {
                    if (aFile_no == fileNo) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    delteNoList.add(aFile_no);
                }
            }

            //삭제 될 file 목록 조회
            for(Long aFileNo : delteNoList){
                AnswerFileDTO deleteFileDTO = qnARepository.selectAnswerFileByFileNo(aFileNo);
                Path file = Paths.get(uploadAPath+deleteFileDTO.getAFile_savName());
                Files.deleteIfExists(file);
                qnARepository.deleteFileByFileNo(aFileNo);
            }
        }

        //question update 및 file 추가
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            qnARepository.updateAnswer(answerDTO);
        } else {
            AnswerFileDTO answerFileDTO = new AnswerFileDTO();
            File directory = new File(uploadAPath);
            if(!directory.exists()) {
                directory.mkdirs();
            }
            qnARepository.updateAnswer(answerDTO);
            for(MultipartFile afiles : multipartFiles){
                String aFile_orgName = afiles.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String aFile_savName = uuid.toString()+"_"+aFile_orgName;
                String aFile_type = afiles.getContentType();
                File saveFile = new File(uploadAPath, aFile_savName);
                afiles.transferTo(saveFile);
                answerFileDTO = AnswerFileDTO.builder()
                        .a_no(aNo)
                        .aFile_orgName(aFile_orgName)
                        .aFile_savName(aFile_savName)
                        .aFile_type(aFile_type)
                        .build();
                qnARepository.insertAnswerFile(answerFileDTO);
            }
        }
    }

    @Transactional
    @Override
    public void deleteAnswer(long aNo) throws Exception {
        List<AnswerFileDTO> answerFileDTOList = qnARepository.selectAnswerFileByAno(aNo);
        if (answerFileDTOList!=null || answerFileDTOList.isEmpty()) {
            // 저장된 모든 파일 삭제 - local
            for(AnswerFileDTO answerFileDTO : answerFileDTOList) {
                Path file = Paths.get(uploadAPath+answerFileDTO.getAFile_savName());
                Files.deleteIfExists(file);
            }
            // 저장된 모든 파일 삭제 - DB
            qnARepository.deleteAnswerFileAll(aNo);
        }
        qnARepository.deleteAnswerByNo(aNo);
    }

    @Override
    public QuestionFileDTO getQuestionFile(long qFile_no) throws Exception {
        return qnARepository.selectQuestionFileByFileNo(qFile_no);
    }

    @Override
    public AnswerFileDTO getAnswerFile(long aFile_no) throws Exception {
        return qnARepository.selectAnswerFileByFileNo(aFile_no);
    }


}

