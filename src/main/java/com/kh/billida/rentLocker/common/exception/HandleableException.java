package com.kh.billida.rentLocker.common.exception;

import com.kh.billida.rentLocker.common.RentErrorCode;

public class HandleableException extends RuntimeException{
	
	private static final long serialVersionUID = 7847451612288681161L;
	public RentErrorCode error;

	public HandleableException(RentErrorCode error) {
		this.error = error;
	}

}
