package com.kh.billida.support.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.billida.common.paging.Criteria;
import com.kh.billida.common.paging.Paging;
import com.kh.billida.support.model.dto.Support;
import com.kh.billida.support.model.repository.SupportRepository;

import lombok.RequiredArgsConstructor;

@Service 
@RequiredArgsConstructor
public class SupportServiceImpl implements SupportService {

	private final SupportRepository supportRepository;

	@Override
	public void reportInsertPost(Map<String, Object> commandMap) {
		supportRepository.reportInsertPost(commandMap);
		
	}

	@Override
	public Map<String, Object> reportDetailPage(String reportIdx) {
		Support support = supportRepository.reportDetailPage(reportIdx);
		return Map.of("support",support);
	}

	@Override
	public int getSupportTotal() {
		return supportRepository.getSupportTotal();
	}

	@Override
	public List<Map<String, Object>> getReportList(Map<String, Object> reportListMap) {
		return supportRepository.getReportList(reportListMap);
	}



	@Override
	public List<Map<String, Object>> getReportListPaging(Map<String, Object> criMap) {
		return supportRepository.getReportListPaging(criMap);
	}

	@Override
	public List<Support> selectPage(Paging paging){
		return supportRepository.selectPage(paging);
	}

	@Override
	public void reportAddResult() {
		supportRepository.reportAddResult();
		
	}

	@Override
	public List<Map<String, Object>> getListPagingforSearch(Map<String, Object> criMap) {
		return supportRepository.getListPagingforSearch(criMap);
	}

	@Override
	public int getSearchTotal() {
		return supportRepository.getSearchTotal();
	}




}
