
package com.kh.billida.rentLocker.model.service;


import java.time.LocalDate;

import org.springframework.stereotype.Service;

import com.kh.billida.rentLocker.model.dto.Locker;

@Service
public interface RentLockerService {

	void insertLocker(Locker locker);

	void insertClob(Locker locker);

	Long selectInsertedLocker();

	void returnBatch(LocalDate today);

}

