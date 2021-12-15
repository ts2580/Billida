package com.kh.billida.rentalHistory.common.exception;

import com.kh.billida.rentalHistory.common.RentalErrorCode;

public class DataAccessException extends HandleableException{
	
	private static final long serialVersionUID = 52158746;
	
	// 예외처리가 강제되지 않는 UncheckedException
	public DataAccessException(Exception e, String msg) {
		super(RentalErrorCode.DATA_ACCESS_EXCEPTION);
		System.out.println(msg);
	}

}
