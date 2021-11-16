package com.kh.billida.review.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.billida.main.model.service.MainService;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.review.model.dto.RentHistoryAndLocker;
import com.kh.billida.review.model.service.ReviewService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("review")
public class ReviewController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private final ReviewService reviewService;
	
	@GetMapping("review-form")// href=/review/review-form?historyIndex=인덱스번호
	public void reviewFormInfo(Model model, int historyIndex) {

		RentHistoryAndLocker reviews = reviewService.selectReviews(historyIndex);
		System.out.println(reviews);
		
		model.addAttribute("reviews", reviews);
	}
	
	
	@PostMapping("upload-review")
	public String uploadReview(@SessionAttribute("reviews") RentHistoryAndLocker reviews
								,@SessionAttribute("authentication") Member member
								,@RequestParam List<MultipartFile> reviewInfo
								,RentHistoryAndLocker rentInfo
								,String starScore) {
		
		rentInfo.setUserCode(member.getUserCode());
		reviewService.insertReview(reviewInfo, rentInfo);
		
		
		return "index";
	}
	 
	
	
	
	

}
