package com.kh.billida.review.controller;


import java.util.HashMap;

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
	
	@GetMapping("review-form")// href=/review/review-form?historyIndex=인덱스번호
	public void reviewFormInfo(Model model, int historyIndex, HttpSession session) {

		List<RentHistoryAndLocker> reviewInfo = reviewService.selectReviews(historyIndex);
		System.out.println("reviewInfo : " + reviewInfo);

		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("reviewInfo", reviewInfo);
		System.out.println("리뷰맵 : " + commandMap);
		
		model.addAllAttributes(commandMap);
		session.setAttribute("rentHistoryLocker", commandMap);

	}
	
	@PostMapping("upload-review")
	public String uploadReview(Model model
						, @ModelAttribute Review reviewForm //jsp에서 값 채워진 모델로 받아오기
					//  , @SessionAttribute("authentication") Member member //굳이 필요없을듯..?(나중에 수정)
						, @SessionAttribute(value="rentHistoryLocker", required = false) RentHistoryAndLocker rentInfo
						) {
		
		System.out.println("reviewForm : " + reviewForm);
		System.out.println("rentInfo : " + rentInfo);
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("score", reviewForm.getScore()); //별점
		commandMap.put("content", reviewForm.getContent()); //리뷰내용
		commandMap.put("userCode", rentInfo.getUserCode());//userCode
		commandMap.put("historyIndex", rentInfo.getHistoryIndex());//historyIndex
		commandMap.put("lockerId", rentInfo.getLockerId());//lockerId
		//System.out.println("commandMap : " + commandMap);
		
		reviewService.insertReview(commandMap);
		
		return "redirect:/";
	}

	@GetMapping("review-list")
	public void reviewList(@SessionAttribute("authentication") Member member
						, Model model) {
		String userCode = member.getUserCode();
		List<Integer> historyindexs = new ArrayList<Integer>();
		historyindexs= reviewService.findReviewList(userCode);
		
		List<RentHistoryAndLocker> list = new ArrayList<RentHistoryAndLocker>();
		List<RentHistoryAndLocker> rentList = new ArrayList<RentHistoryAndLocker>();
		Map<String, Object> commandMap = new HashMap<String, Object>();
		
		for (int i = 0; i < historyindexs.size(); i++) {
			list = reviewService.selectReviews(historyindexs.get(i));
			rentList.addAll(i, list);	
		}
		
		commandMap.put("rentList", rentList);
		model.addAllAttributes(commandMap);
		//System.out.println(commandMap);
	
	}

	
	
	
	

}
