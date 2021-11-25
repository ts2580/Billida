package com.kh.billida.support.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.billida.main.model.service.MainService;
import com.kh.billida.rentalHistory.model.service.RentalService;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;
import com.kh.billida.review.model.dto.Review;
import com.kh.billida.support.model.dto.Support;
import com.kh.billida.support.model.service.SupportService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("support")
public class SupportController {
	
	private final SupportService supportService;
	
	
	// 문의&신고 페이지 접속
	@GetMapping("support-index")
	public void supportIndex() {}

	// 신고 페이지 접속
	@GetMapping("report-main")
	public void reportMain() {
		
	}
	
	// 신고 페이지 작성 후 DB에 전송
	@PostMapping("report-main")
	public String reportMainPost(Model model 
								,@ModelAttribute Support support
								,HttpSession session) {
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("userId", support.getUserId());
		commandMap.put("reportTitle", support.getReportTitle());
		commandMap.put("reportContent", support.getReportContent());
		
		supportService.reportInsertPost(commandMap);
		
		return "report-board";
	}
	/*
	 * 
	 * @PostMapping("upload-review")
	public String uploadReview(Model model
						, @ModelAttribute Review reviewForm //jsp에서 값 채워진 모델로 받아오기
						, @SessionAttribute(value="rentHistoryLocker", required = false) RentHistoryAndLocker rentInfo
						) {
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("score", reviewForm.getScore()); //별점
		commandMap.put("content", reviewForm.getContent()); //리뷰내용
		commandMap.put("userCode", rentInfo.getUserCode());//userCode
		commandMap.put("historyIndex", rentInfo.getHistoryIndex());//historyIndex
		commandMap.put("lockerId", rentInfo.getLockerId());//lockerI
		reviewService.insertReview(commandMap);
		
		
		Map<String, Object> rentHistoryMap = new HashMap<String, Object>();
		rentHistoryMap.put("yn", "Y");
		rentHistoryMap.put("historyIndex", rentInfo.getHistoryIndex());
		reviewService.updateRentHistoryReviewYn(rentHistoryMap); //렌트히스토리테이블 리뷰여부 Y로 업데이트
		
		return "redirect:/review/review-list";
	}
	 * 
	 * 
	 */
	
	
	
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
