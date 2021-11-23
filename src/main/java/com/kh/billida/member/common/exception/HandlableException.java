package com.kh.billida.member.common.exception;

import com.kh.billida.member.common.code.ErrorCode;

public class HandlableException extends RuntimeException {


	private static final long serialVersionUID = -3930409458039432875L;
	public ErrorCode error; //우리가 만들어놓은 이넘 
	
	//콘솔창 에러코드를 초기화 해주는 용도?
	public HandlableException(ErrorCode error) {
		this.error = error;
		this.setStackTrace(new StackTraceElement[0]);
	}
	
	public HandlableException(ErrorCode error, Exception e) {
		this.error = error;
		e.printStackTrace();
		this.setStackTrace(new StackTraceElement[0]);
	}
}
