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
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("userId", support.getUserId());
		commandMap.put("reportTitle", support.getReportTitle());
		commandMap.put("reportContent", support.getReportContent());
		Object put = commandMap.put("reportDate", now);
		supportService.reportInsertPost(commandMap);
		
		System.out.println(now);
		System.out.println(commandMap);
		return "redirect:/support/support-index";
	}
	
	// 신고 게시판 접속
		@GetMapping("report-board")
		public String reportBoardList(Model model
									, Criteria cri
									, HttpSession session
									) {

			//페이지 정보 입력받을 criMap생성
			Map<String, Object> criMap = new HashMap<String, Object>();
			// pageNum에 cri.getPgeNum() 입력
			criMap.put("pageNum", cri.getPageNum());
			// amount에 cri.getAmount()입력
			criMap.put("amount", cri.getAmount());
			//criMap에 정보 추가
			
			//가져온 정보 입력
			List<Map<String, Object>> getReportListPaging = supportService.getReportListPaging(criMap);
			
			//리포트의 게시글 수를 total에 받아옴
			int total = supportService.getSupportTotal();
			
			//페이징 호출 후 cri값, total값 입력
			Paging paging = new Paging(cri, total);
			
			Map<String, Object> map = new HashMap<String, Object>();
			//List<Map<String, Object>> selectPage = supportService.getReportListPaging(map);
			//list에 reportListMap정보 입력
			map.put("list", getReportListPaging);
			//paging에 paging정보 입력
			map.put("paging", paging);
			//map에 정보 입력
			model.addAllAttributes(map);

			logger.info("criMap : "+ criMap);
			logger.info("getReportListPaging : " + getReportListPaging);
			logger.info("paging : " + paging);
			
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
	
	
	//메인페이지에서 검색어 입력 시 수행되는 메서드
	@RequestMapping("report-board-search")
	public String reportBoardListSearch(Model model
										, Criteria cri
										, @RequestParam(defaultValue = "all") String searchOption
										, @RequestParam(defaultValue = "") String keyword) {
			
		//페이지 정보 입력받을 criMap생성
		Map<String, Object> criMap = new HashMap<String, Object>();
		// pageNum에 cri.getPgeNum() 입력
		criMap.put("pageNum", cri.getPageNum());
		// amount에 cri.getAmount()입력
		criMap.put("amount", cri.getAmount());
		//criMap에 정보 추가
		criMap.put("keyword", keyword);
		criMap.put("searchOption", searchOption);
			
		//각 페이지에 들어갈 게시물들 정보 뽑아오기
		List<Map<String, Object>> list = supportService.getListPagingforSearch(criMap);
			
		//맵에 담은 후 모델에 전달
		Map<String, Object> map = new HashMap<String, Object>();
			
		//리포트의 게시글 수를 total에 받아옴
		int total = supportService.getSupportTotal();
			
		//페이징 호출 후 cri값, total값 입력
		Paging paging = new Paging(cri, total);
			
		map.put("list", list);
		map.put("paging", paging);
		model.addAllAttributes(map);
		
		logger.info("list : " + list);
		logger.info("paging : " + paging);
		logger.info("map : " + map);
			
		return "support/report-board-search";

			
		}

	
	
	
	
}
