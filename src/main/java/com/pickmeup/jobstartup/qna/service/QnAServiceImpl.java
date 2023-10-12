package com.pickmeup.jobstartup.qna.service;

import com.pickmeup.jobstartup.qna.dto.QuestionDTO;
import com.pickmeup.jobstartup.qna.dto.QuestionFileDTO;
import com.pickmeup.jobstartup.qna.repository.QnARepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class QnAServiceImpl implements QnAService{

    private final QnARepository qnARepository;
    private String uploadPath = "C:/jobStartUp_fileUpload/qna/";

    @Override
    public void write(QuestionDTO questionDTO, MultipartFile[] multipartFiles) throws Exception {
        if(multipartFiles==null || multipartFiles[0].isEmpty()){
            qnARepository.insertQuestion(questionDTO);
        } else {
            QuestionFileDTO questionFileDTO = new QuestionFileDTO();
            File directory = new File(uploadPath);
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
                File saveFile = new File(uploadPath, qFile_savName);
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
}
