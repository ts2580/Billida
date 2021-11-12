package com.kh.billida.member;

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
public class MemberControolerTest {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	WebApplicationContext wac;
	MockMvc mockMvc;
	
	@Before
	public void set() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void joinTest() throws Exception {
		mockMvc.perform(post("/member/signUp")
				.param("Id", "test2")
				.param("password", "1234")
				.param("name", "테스트맨")
				.param("nick", "테스트")
				.param("tell", "01000000000")
				.param("postCode", "06959")
				.param("address", "서울")
				.param("addressDetail", "집")
				.param("email", "aaa@gbb.com"))
		.andExpect(status().isOk()) // 200번아닐경우 에러뜸
		.andDo(print());
	}
}
