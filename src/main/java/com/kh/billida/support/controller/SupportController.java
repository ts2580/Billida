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
									, Support support
									, Criteria cri
									, HttpSession session
									) {

			//리스트 정보 입력
			HashMap<String, Object> reportListMap = new HashMap<String, Object>();
			//가져온 정보 출력
			List<Map<String, Object>> getReportList = supportService.getReportList(reportListMap);
			
			model.addAttribute("getReportList",getReportList);
			
			
			
			
			
			Map<String, Object> criMap = new HashMap<String, Object>();
			
			criMap.put("pageNum", cri.getPageNum());
			criMap.put("amount", cri.getAmount());
			model.addAttribute(criMap);
			//List<Map<String, Object>> list = supportService.getReportListPaging(criMap);
			
			//리포트의 게시글 수를 total에 받아옴
			int total = supportService.getSupportTotal();
			
			Paging paging = new Paging(cri, total);
			
			List<Support> selectPage = supportService.selectPage(paging);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", selectPage);
			map.put("paging", paging);
			model.addAllAttributes(map);
			//session.setAttribute("reportList", getReportList);
			logger.info("selectPage : " + selectPage);
			logger.info("getReportList : " + getReportList);
			logger.info("criMap : "+ criMap);
			//logger.info("getReportListPaging : " + getReportListPaging);
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
	
	
	
//	@PostMapping("report-board")
//	public String reportBoardList(Model model
//								,@RequestParam(defaultValue="1") int currentPage
//								, String search
//								, String keyword
//								, HttpSession session
//								,Criteria cri) {
//		Member member = (Member) session.getAttribute("authentication");
//		String userCode = member.getUserCode();
//
//		Map<String, Object> commandMap = new HashMap<String, Object>();
//		commandMap.put("pageNum", cri.getPageNum());
//		commandMap.put("amount", cri.getAmount());
//		
//		
//		List<Map<String, Object>> list = supportService.getSupportListPaging(commandMap);
//		//유저코드에 해당하는 사물함대여리스트 갯수 받아오기
//		int total = supportService.getSupportListPaging(commandMap);
//		Paging paging = new Paging(cri, total);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("paging", paging);
//		map.put("authentication", member);
//		model.addAllAttributes(map);
//		
//		return "review/rent-list";
//			}
	
	
	// 신고 내용 입력 후 전송
	//@PostMapping("report-main")
	//public String reportInsert(Support support) {
	//	supportService.reportInsert(support);
	//	return "report-main";
	//}
	
	
	
	
}
