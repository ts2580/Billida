package com.kh.billida.locker;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
public class LockerControllerTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	WebApplicationContext wac;
	MockMvc mockMvc;
	
	@Before
	public void set() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void lockerAddTest() throws Exception {
		mockMvc.perform(post("/locker/lockerMain")
				.param("locker_id", "999")
				.param("locker_password", "1234")
				.param("locker_title", "도로변11")
				.param("locker_content", "abc아파트 101동 지하주차장에있어요")
				.param("locker_image", "https://url.kr/8ki6jm")
				.param("locker_size", "Large")
				.param("location", "서울시 구로구 11길 11로")
				.param("rentable_date_start", "2021-11-22")
				.param("rentable_date_end", "2021-11-30")
				.param("user_code", "49"))
		.andExpect(status().isOk()) // 200번아닐경우 에러뜸
		.andDo(print());
		
		
		
	}
	
}
