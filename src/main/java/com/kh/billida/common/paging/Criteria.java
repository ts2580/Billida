package com.kh.billida.common.paging;

import lombok.Data;

@Data
public class Criteria {
	
	//현재 페이지
	private int pageNum;
	
	//한 페이지 당 보여질 게시물 갯수
	private int amount;
	
	//검색 키워드
	private String keyword;
	
	//기본 생성자 -> 기본 셋팅 : pageNum=1, amount=4
	public Criteria() {
		this(1, 4);
	}

	//생성자 -> 원하는 pageNum, 원하는 amount
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	
}
