package com.kh.billida.support.controller;

import java.time.LocalDate;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.common.paging.Paging;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.support.model.dto.Support;
import com.kh.billida.support.model.service.SupportService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("support")
public class SupportController {
	
	private final SupportService supportService;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 문의&신고 페이지 접속
	@GetMapping("support-index")
	public void supportIndex() {}

	// 신고 페이지 접속
	@GetMapping("report-main")
	public void reportMain() {}
	
	// 신고 페이지 작성 후 DB에 전송
	@PostMapping("report-main")
	public String reportMainPost(Model model 
								,@ModelAttribute Support support
								,HttpSession session) {
		LocalDate now = LocalDate.now();
		
		Member member = (Member) session.getAttribute("authentication");
		
		String userGrade = member.getGrade();
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("userId", support.getUserId());
		commandMap.put("reportTitle", support.getReportTitle());
		commandMap.put("reportContent", support.getReportContent());
		commandMap.put("userGrade", userGrade);
		Object put = commandMap.put("reportDate", now);
		supportService.reportInsertPost(commandMap);
		
		logger.info("commandMap : " + commandMap);
		logger.info("userGrade : " + userGrade);
		System.out.println(now);
		System.out.println(commandMap);
		return "redirect:/support/support-index";
	}
	
	// 신고 게시판 접속
		@RequestMapping("report-board")
		public String reportBoardList(Model model
				, Criteria cri
				, @RequestParam(defaultValue = "all") String searchOption
				, @RequestParam(defaultValue = "") String keyword) {

		//페이지 정보 입력받을 criMap생성
		Map<String, Object> criMap = new HashMap<String, Object>();
		// pageNum에 cri.getPgeNum() 입력
		criMap.put("pageNum", cri.getPageNum());
		// amount에 cri.getAmount()입력
		criMap.put("amount", cri.getAmount());
		//criMap에 keyword 추가
		criMap.put("keyword", keyword);
		//criMap에 searchOption 추가
		criMap.put("searchOption", searchOption);
		
		//각 페이지에 들어갈 게시물들 정보 뽑아오기
		List<Map<String, Object>> list = supportService.getListPagingforSearch(criMap);
		
		//맵에 담은 후 모델에 전달
		Map<String, Object> map = new HashMap<String, Object>();
		
		//리포트의 게시글 수를 total에 받아옴
		int getSearchTotal = supportService.getSearchTotal(criMap);
		
		//페이징 호출 후 cri값, total값 입력
		Paging paging = new Paging(cri, getSearchTotal);
		
		map.put("list", list);
		map.put("paging", paging);
		model.addAllAttributes(map);
		
		logger.info("list : " + list);
		logger.info("getSearchTotal : " + getSearchTotal);
		logger.info("paging : " + paging);
		logger.info("map : " + map);
		logger.info("criMap : " + criMap);
		System.out.println("---------------------------------------------------");	
		return "support/report-board";
			
		}

		
	// 신고 상세 페이지 접속
	@GetMapping("report-detail")
	public void reportDetail(Model model, String reportIdx) {
		Map<String, Object> commandMap = supportService.reportDetailPage(reportIdx);
		model.addAllAttributes(commandMap);
	}
	
	// 신고 상세 페이지에서 '신고처리등록' 클릭시 0->1로 변경
	@PostMapping("report-addResult")
	public String reportAddResult () {
		supportService.reportAddResult();
		System.out.println("돌아가라 대굴대굴");
		return "redirect:/support/report-board";
	}
	
	
//	//메인페이지에서 검색어 입력 시 수행되는 메서드
//	@RequestMapping("report-board-search")
//	public String reportBoardListSearch(Model model
//										, Criteria cri
//										, @RequestParam(defaultValue = "all") String searchOption
//										, @RequestParam(defaultValue = "") String keyword) {
//			
//		//페이지 정보 입력받을 criMap생성
//		Map<String, Object> criMap = new HashMap<String, Object>();
//		// pageNum에 cri.getPgeNum() 입력
//		criMap.put("pageNum", cri.getPageNum());
//		// amount에 cri.getAmount()입력
//		criMap.put("amount", cri.getAmount());
//		//criMap에 keyword 추가
//		criMap.put("keyword", keyword);
//		//criMap에 searchOption 추가
//		criMap.put("searchOption", searchOption);
//			
//		//각 페이지에 들어갈 게시물들 정보 뽑아오기
//		List<Map<String, Object>> list = supportService.getListPagingforSearch(criMap);
//			
//		//맵에 담은 후 모델에 전달
//		Map<String, Object> map = new HashMap<String, Object>();
//			
//		//리포트의 게시글 수를 total에 받아옴
//		int getSearchTotal = supportService.getSearchTotal(criMap);
//			
//		//페이징 호출 후 cri값, total값 입력
//		Paging paging = new Paging(cri, getSearchTotal);
//			
//		map.put("list", list);
//		map.put("paging", paging);
//		model.addAllAttributes(map);
//		
//		logger.info("list : " + list);
//		logger.info("getSearchTotal : " + getSearchTotal);
//		logger.info("paging : " + paging);
//		logger.info("map : " + map);
//		logger.info("criMap : " + criMap);
//		System.out.println("---------------------------------------------------");	
//		return "support/report-board-search";
//
//			
//		}

	
	
	
	
}
