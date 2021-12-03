package com.kh.billida.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.common.paging.Paging;
import com.kh.billida.main.model.dto.Main;
import com.kh.billida.member.common.code.ErrorCode;
import com.kh.billida.member.common.exception.HandlableException;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;
import com.kh.billida.review.model.dto.Review;
import com.kh.billida.review.model.service.ReviewService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("review")
public class ReviewController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private final ReviewService reviewService;
	
	@GetMapping("rent-list")
	public String rentList(Model model, HttpSession session, RedirectAttributes redirectAttr, Criteria cri) {

		Member member = (Member) session.getAttribute("authentication");
		String userCode = member.getUserCode();

		Map<String, Object> criMap = new HashMap<String, Object>();
		criMap.put("pageNum", cri.getPageNum());
		criMap.put("amount", cri.getAmount());
		criMap.put("userCode", userCode);
		
		List<Map<String, Object>> list = reviewService.getRentListPaging(criMap);
		//유저코드에 해당하는 사물함대여리스트 갯수 받아오기
		int total = reviewService.getRentTotal(userCode);
		Paging paging = new Paging(cri, total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);
		map.put("authentication", member);
		model.addAllAttributes(map);
		
		return "review/rent-list";
	}
	
	@PostMapping("upload-review")
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
	
	@GetMapping("review-list")
	public String reviewList(Model model, HttpSession session, RedirectAttributes redirectAttr, Criteria cri) {
		Member member = (Member) session.getAttribute("authentication");
		
		String userCode = member.getUserCode();
		Map<String, Object> criMap = new HashMap<String, Object>();
		criMap.put("pageNum", cri.getPageNum());
		criMap.put("amount", cri.getAmount());
		criMap.put("userCode", userCode);
		
		List<Map<String, Object>> list = reviewService.getReviewListPaging(criMap);
		
		int total = reviewService.getReviewTotal(userCode);
		Paging paging = new Paging(cri, total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);
		model.addAllAttributes(map);
		session.setAttribute("reviewList", list);
		System.out.println("컨트롤러 리뷰리스트 : " + map);
		return "review/review-list";
	}
	
	@GetMapping("review-form")// href=/review/review-form?historyIndex=인덱스번호
	public void reviewFormInfo(Model model, int historyIndex, HttpSession session) {

		RentHistoryAndLocker reviewInfo = reviewService.selectRentInfo(historyIndex);
		
		model.addAttribute("list", reviewInfo);
		session.setAttribute("rentHistoryLocker", reviewInfo);
	}

	@GetMapping("review-modifyForm") //review-modify?reviewNum=리뷰번호
	public void modifyReview(Model model, String reviewNum, HttpSession session) {
		
		RentHistoryAndLocker reviewInfo = reviewService.selectReviewInfo(reviewNum);
		model.addAttribute("list", reviewInfo);
		session.setAttribute("modifyFormInfo", reviewInfo);
	}
	
	@PostMapping("modify-review")
	public String modifyReview(Model model
						, @ModelAttribute Review reviewForm
						, @SessionAttribute(value="modifyFormInfo", required = false) RentHistoryAndLocker modifyInfo
						) {
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("score", (float)reviewForm.getScore()); //별점
		commandMap.put("content", reviewForm.getContent()); //리뷰내용
		commandMap.put("reviewNum", modifyInfo.getReviewNum()); //리뷰넘버
		
		reviewService.modifyReview(commandMap);
		
		return "redirect:/review/review-list";
	}
	
	@GetMapping("delete-review")
	public String deleteReview(String reviewNum) {

		reviewService.deleteReview(reviewNum);
		int historyIndex = reviewService.getHistoryIndex(reviewNum);
		
		Map<String, Object> rentHistoryMap = new HashMap<String, Object>();
		rentHistoryMap.put("yn", "N");
		rentHistoryMap.put("historyIndex", historyIndex);
		reviewService.updateRentHistoryReviewYn(rentHistoryMap);
		
		return "redirect:/review/review-list";
	}
	
	@GetMapping("myLocker-list")
	public void myLockerList(Model model, HttpSession session, RedirectAttributes redirectAttr, Criteria cri) {
		
		Member member = (Member) session.getAttribute("authentication");
		
		String userCode = member.getUserCode();
		Map<String, Object> criMap = new HashMap<String, Object>();
		criMap.put("pageNum", cri.getPageNum());
		criMap.put("amount", cri.getAmount());
		criMap.put("userCode", userCode);
		
		List<Map<String, Object>> lockerList = reviewService.getMyLockerListPaging(criMap);
		
		int total = reviewService.getLockerTotal(userCode);
		Paging paging = new Paging(cri, total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", lockerList);
		map.put("paging", paging);
		model.addAllAttributes(map);
		
	}
	
	@GetMapping("locker-reviews")
	public void lockerReviews(Model model, int lockerId, Criteria cri){
		Map<String, Object> criMap = new HashMap<String, Object>();
		criMap.put("pageNum", cri.getPageNum());
		criMap.put("amount", cri.getAmount());
		criMap.put("lockerId", lockerId);
		
		List<Map<String, Object>> lockerReviews = reviewService.getLockerReviewsPaging(criMap);
		
		int total = reviewService.getLockerReviewTotal(lockerId);
		Paging paging = new Paging(cri, total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", lockerReviews);
		map.put("paging", paging);
		model.addAllAttributes(map);
	}
	
	
	

}
