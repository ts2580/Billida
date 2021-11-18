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

		RentHistoryAndLocker reviewInfo = reviewService.selectReviews(historyIndex);
		
		model.addAttribute("reviewInfo", reviewInfo);
		session.setAttribute("rentHistoryLocker", reviewInfo);

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
		commandMap.put("lockerId", rentInfo.getLockerId());//lockerId

		reviewService.insertReview(commandMap);
		
		return "redirect:/";
	}

	@GetMapping("rent-list")
	public String reviewList(Model model, HttpSession session, RedirectAttributes redirectAttr, Criteria cri) {
		
		Member member = (Member) session.getAttribute("authentication");

		if (member == null) {
			redirectAttr.addFlashAttribute("message", "로그인 후 이용 가능합니다");
			return "redirect:/member/login";
		}
			
		String userCode = member.getUserCode();
		List<Integer> historyindexs = new ArrayList<Integer>();
		historyindexs= reviewService.findReviewList(userCode);
		
		cri.setAmount(3);
		int amount = cri.getAmount();
		
		System.out.println("기본페이지넘 : " + cri.getPageNum());
		Map<String, Object> criMap = new HashMap<String, Object>();
		criMap.put("pageNum", cri.getPageNum());
		criMap.put("amount", amount);
		criMap.put("userCode", userCode);
		
		List<Map<String, Object>> list = reviewService.getListPaging(criMap);
		System.out.println("페이징처리할 대여목록 리스트 : " + list);
		Map<String, Object> map = new HashMap<String, Object>();
		
		//유저코드에 해당하는 사물함대여리스트 갯수 받아오기
		int total = reviewService.getTotal(userCode);
		Paging paging = new Paging(cri, total);
		
		map.put("list", list);
		map.put("paging", paging);
		model.addAllAttributes(map);
		
		
		
//		RentHistoryAndLocker list;
//		List<RentHistoryAndLocker> rentList = new ArrayList<RentHistoryAndLocker>();
//		Map<String, Object> commandMap = new HashMap<String, Object>();
//		
//		for (int i = 0; i < historyindexs.size(); i++) {
//			list = reviewService.selectReviews(historyindexs.get(i));
//			rentList.add(i, list);	
//		}
//		
//		commandMap.put("rentList", rentList);
//		model.addAllAttributes(commandMap);
		
		return "review/rent-list";
	}

	
	
	
	

}
