package com.pickmeup.jobstartup.qna.service;

import com.pickmeup.jobstartup.qna.dto.MailDTO;

public interface MailService {
    public void mailSend(MailDTO mailDTO) throws Exception;
}
