package com.kh.billida.rental;

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
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class rentalTest {
	
	@Autowired //의존성 주입받기
	WebApplicationContext wac;
	MockMvc mockMvc;
	
	@Before
	public void set() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Test
	public void rentalHistoryTest() throws Exception {
		mockMvc.perform(post("/rentalLocker/rental-form")
				.param("histroyIndex", "106")
				.param("lockerId", "86")
				.param("userCode", "26")
				.param("rentStart", "2021/12/26")
				.param("rentEnd", "2021/12/28")
				.param("rentCost", "6000"))
		.andExpect(status().isOk()) 
		.andDo(print());
	}
}
