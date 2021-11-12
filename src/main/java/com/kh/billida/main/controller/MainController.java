package com.kh.billida.main.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.billida.main.model.dto.Main;
import com.kh.billida.main.model.service.MainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final MainService mainService;
	
	@GetMapping("/") //처음 페이지 들어갔을 때 동작하는 메서드
	public String main(Model model) {
		
		List<Main> mainList = new ArrayList<Main>();
		mainList = mainService.selectLockerList();

		Map<String, Object> commandMap = new HashedMap();
		commandMap.put("mainList", mainList);
		model.addAllAttributes(commandMap);

		return "index";
	}
	
	@GetMapping("/search")
	public String searchLocker(String search, @RequestParam(required = false, defaultValue = "1") int page
								, Model model, RedirectAttributes redirectAttr) {
	
		Map<String, Object> commandMap = mainService.selectLockerByKeyword(search, page);		 
		model.addAllAttributes(commandMap);
	
		logger.debug(commandMap.toString());	
		return "main/search";
	}
	
	
}
