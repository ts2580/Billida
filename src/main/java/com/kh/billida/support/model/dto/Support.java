package com.kh.billida.support.model.dto;

import lombok.Data;

@Data
public class Support {
	
	private int reportIdx; // 시퀀스로 생성 - 게시글 고유번호
	private String userId; // 신고 대상 아이디 작성
	private String reportTitle; // 신고글 타이틀
	private String reportContent; // 신고글 내용
	private String reportDate; // 신고글 날짜(자동지정)
	private String reportResult; // 신고처리 결과 (0으로 자동 지정)

}
