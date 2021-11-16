package com.kh.billida.review;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Date;

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

import com.kh.billida.review.model.dto.Review;
import com.kh.billida.review.model.repository.ReviewRepository;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class ReviewControllerTest {
	
Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//MockMvc : http 요청 및 응답 상황 테스트를 위한 객체
	@Autowired //의존성 주입받기
	WebApplicationContext wac;
	MockMvc mockMvc;
	
	@Autowired
	private ReviewRepository reviewRepository;
	private Review review;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void insertReviewTest() throws Exception {
		
		Date date = new Date(211116);
		
		mockMvc.perform(post("/review/upload-review")
				.param("userCode", "100")
				.param("historyIndex", "2")
				.param("lockerId", "1")
				.param("content", "테스트")
				.param("score", "4.5")
				.param("createDate", "211116"))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	
	
	

}
