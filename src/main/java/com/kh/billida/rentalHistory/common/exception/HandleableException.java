package com.kh.billida.rentalHistory.common.exception;

import com.kh.billida.rentalHistory.common.RentalErrorCode;

public class HandleableException extends RuntimeException{
	
	private static final long serialVersionUID = 7847451612288681161L;
	public RentalErrorCode error;

	public HandleableException(RentalErrorCode error) {
		this.error = error;
	}

}
