package com.kh.spring.member;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.member.model.dto.Member;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.Map;

import javax.servlet.http.Cookie;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class MemberControllerTest {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//MockMVC : http 요청 및 응답 상황 테스트를 위한 객체
	
	@Autowired //주입받기
	WebApplicationContext wac;
	@Autowired
	JavaMailSenderImpl mailSender;
	MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void joinTest() throws Exception {
		mockMvc.perform(post("/member/join")  //post요청
				.param("userId", "testMethod3") //param 메서드를 사용해서 요청파라미터를 지정
				.param("password", "1234")
				.param("tell", "01022223333")
				.param("email", "aaa@gbb.com"))
		.andExpect(status().isOk()) //요청 보내기(200번인지 확인)
		.andDo(print());
	}
	
	@Test
	public void joinWithJson() throws Exception{ 
		Member member = new Member();
		member.setUserId("testJson");
		member.setPassword("1234");
		member.setEmail("json@pclass.com");
		member.setTell("010-0000-2222");
		
		//자바객체를 제이슨으로 변환
		ObjectMapper mapper = new ObjectMapper();
		String memberJson = mapper.writeValueAsString(member);
		logger.debug(memberJson);
		//제이슨으로 만든 member를 다시 member또는 map으로 역직렬화
		logger.debug(mapper.readValue(memberJson, Map.class).toString());
		
		mockMvc.perform(post("/member/join-json")  //경로 지정
				.contentType(MediaType.APPLICATION_JSON) //메세지 방식 지정?
				.content(memberJson)) //우리가 위에서 만든 제이슨문자열 넘겨줌
		.andExpect(status().isOk())
		.andDo(print());
		
	}
	
	@Test
	public void loginImpl() throws Exception{
		mockMvc.perform(post("/member/login")
				.param("userId", "test")
				.param("password", "1234"))
		.andExpect(status().is3xxRedirection())
		.andDo(print());
	}
	
	@Test
	public void mypage() throws Exception{
		Member member = new Member();
		member.setUserId("testJson");
		member.setPassword("1234");
		member.setEmail("json@pclass.com");
		member.setTell("010-0000-2222");
		
		mockMvc.perform(get("/member/mypage")
				.cookie(new Cookie("JSESSIONID", "2862409F9EA541E1F4BE674F1E221A8E")) //쿠키가 있다고 가정하고 테스트
				.sessionAttr("authentication", member)) //세션이 있다고 가정하고 테스트
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	@Test
	public void idCheck() throws Exception{
		mockMvc.perform(get("/member/id-check?userId=test"))
		.andExpect(status().isOk())
		.andDo(print());
	}
	
	

	

}
