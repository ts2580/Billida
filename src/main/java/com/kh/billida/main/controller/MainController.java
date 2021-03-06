package com.kh.billida.main.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.common.paging.Paging;
import com.kh.billida.main.model.dto.Main;
import com.kh.billida.main.model.service.MainService;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.mileage.model.dto.Mileage;
import com.kh.billida.mileage.model.service.MileageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final MainService mainService;
	private final MileageService mileageService;
	
	@GetMapping("/") //처음 페이지 들어갔을 때 동작하는 메서드
	public String main(Model model, HttpSession session, Member member) {
		
		List<Object> lockerIds = mainService.getLockerIds(); //리뷰의 별점 높은 순서로 4개의 락커번호 뽑아옴

		List<Main> mainList = new ArrayList<Main>();
		for (Object lockerId : lockerIds) {
			mainList.addAll(mainService.selectLockerList(lockerId));
		}

		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("mainList", mainList);
		
		model.addAllAttributes(commandMap);
		
		member = (Member)session.getAttribute("authentication");
		
		try {
			String userCode = member.getUserCode();
			member = mainService.isDegraded(userCode);
			// 왜 authentication에서 받은 유저를 다시 리포지토리에서 받아올까?
			// 부정행위해서 grade가 다운되더라도 다시 로그인하지 않는이상 authentication의 grade는 그대로임
			// 따라서 리포지토리에 메소드 하나 파고 다시 DB서 grade받아줌;
			
			if(member.getGrade().equals("00")) {
				model.addAttribute("zeroGradeMember", "zeroGradeMember");				
			}
			if(member.getGrade().equals("99")) {
				model.addAttribute("admin","admin");
			}
		} catch (NullPointerException e) {
			return "index";
		}
		
		return "index";
	}
	
	//메인페이지에서 검색어 입력 시 수행되는 메서드
	@GetMapping("/search")
	public String lockerList(Model model, Criteria cri, String keyword) {
		
		//맵에 값들 담아서 넘겨주기
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("pageNum", cri.getPageNum());
		commandMap.put("amount", cri.getAmount());
		commandMap.put("keyword", keyword);
		
		//각 페이지에 들어갈 게시물들 정보 뽑아오기
		List<Map<String, Object>> list = mainService.getListPaging(commandMap);
		
		//맵에 담은 후 모델에 전달
		Map<String, Object> map = new HashMap<String, Object>();
		
		//검색어에 해당하는 게시물 갯수 구해오기
		int total = mainService.getTotal(cri);
		Paging paging = new Paging(cri, total);
		
		map.put("list", list);
		map.put("paging", paging);
		model.addAllAttributes(map);
		
		return "main/search";
	}
	
	
}
