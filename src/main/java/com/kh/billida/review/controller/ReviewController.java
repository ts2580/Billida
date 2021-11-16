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

import com.kh.billida.main.model.service.MainService;
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
	
	/*
	 * @PostMapping("") public String uploadReview() {
	 * 
	 * }
	 */
	
	
	
	

}
