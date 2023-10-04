package com.pickmeup.jobstartup;

import com.pickmeup.jobstartup.notice.dto.NoticeDTO;
import com.pickmeup.jobstartup.notice.service.NoticeService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@SpringBootTest
class JobstartupApplicationTests {

	@Autowired
	private NoticeService noticeService;

	@Test
	void contextLoads() {
	}

	@Test
	void insertTest() throws Exception {
		NoticeDTO notice = new NoticeDTO();
		for(int i = 21; i<100; i++){
			notice = notice.builder()
					.not_title("페이징"+i)
					.not_content("페이징내용"+i)
					.build();
			noticeService.write(notice, null);
		}
	}
}
