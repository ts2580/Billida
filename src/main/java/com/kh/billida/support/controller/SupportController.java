package com.kh.billida.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("support")
public class SupportController {
	
	// 문의&신고 페이지 접속
	@GetMapping("support-index")
	public void supportIndex() {}

	// 신고 페이지 접속
	@GetMapping("report-main")
	public void reportMain() {}
	
	// 신고 내용 입력 후 전송
	//@PostMapping("report-main")
	//public String reportInsert(Support support) {
	//	supportService.reportInsert(support);
	//	return "report-main";
	//}
	
	// 신고 게시판 목록
	@GetMapping("report-board")
	public void reportBoard() {}
	
	
	
}
