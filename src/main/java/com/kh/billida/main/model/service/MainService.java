package com.kh.billida.main.model.service;

import java.util.List;
import java.util.Map;

import com.kh.billida.main.model.dto.Main;

public interface MainService {

	List<Main> selectLockerList();

	Map<String, Object> selectLockerByKeyword(String search, int page);



}
