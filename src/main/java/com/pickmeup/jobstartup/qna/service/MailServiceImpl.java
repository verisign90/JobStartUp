package com.pickmeup.jobstartup.qna.service;

import com.pickmeup.jobstartup.qna.dto.MailDTO;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@AllArgsConstructor
public class MailServiceImpl implements MailService{

    @Autowired
    private JavaMailSender javaMailSender;

    @Transactional
    @Override
    public void mailSend(MailDTO mailDTO) throws Exception {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mailDTO.getAddress());
        message.setSubject(mailDTO.getTitle());
        message.setText(mailDTO.getMessage());
        javaMailSender.send(message);
    }
}
