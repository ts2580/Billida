package com.kh.billida.main.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		System.out.println(commandMap);
		return "index";
	}
	
	
}
