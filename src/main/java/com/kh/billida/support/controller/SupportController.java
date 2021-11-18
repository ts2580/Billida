package com.kh.billida.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("support")
public class SupportController {

	@GetMapping("support-index")
	public void supportIndex() {}

	@GetMapping("report-main")
	public void reportMain() {}
	
	@GetMapping("report-board")
	public void reportBoard() {}
	
}
