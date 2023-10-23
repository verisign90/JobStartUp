package com.pickmeup.jobstartup;

import com.pickmeup.jobstartup.notice.service.NoticeService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class JobstartupApplicationTests {

	@Autowired
	private NoticeService noticeService;


	@Test
	void contextLoads() {
	}




}
