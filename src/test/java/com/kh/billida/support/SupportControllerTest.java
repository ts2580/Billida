package com.kh.billida.support;


import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;

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

import com.kh.billida.support.model.dto.Support;
import com.kh.billida.support.model.repository.SupportRepository;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class SupportControllerTest {

Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//MockMvc : http 요청 및 응답 상황 테스트를 위한 객체
	@Autowired //의존성 주입받기
	
	WebApplicationContext wac;
	MockMvc mockMvc;
	
	@Autowired
	private SupportRepository supportRepository;
	private Support support;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void reportMainPostTest() throws Exception {
		
		mockMvc.perform(post("/support/report-main")
				.param("userId", "asdf")
				.param("reportTitle", "aaaa")
				.param("reportContent", "bbbb")
				.param("reportDate", "2021-11-22")
				.param("reportResult", "0")
				)
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	@Test
	public void dummypostTest() throws Exception{
		
		for (int i = 0; i < 100; i++) {
			Support support = new Support();
			support.setReportIdx(i);
			support.setUserId("test" + i);
			support.setReportTitle("testTitle" + i);
			support.setReportContent("testReportCon" + i);
			support.setReportDate("2021-11-27");
			support.setReportResult("0");
			
			mockMvc.perform(post("/support/report-main"))
					.andExpect(status().isOk())
					.andDo(print());
			
		}
		
	
	}
	
}
