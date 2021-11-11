package com.kh.billida.dummy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.billida.dummy.model.service.DummyService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class DummyController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	private DummyService dummyService;
	
	
	
}
