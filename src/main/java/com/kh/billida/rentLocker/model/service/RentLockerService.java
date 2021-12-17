
package com.kh.billida.rentLocker.model.service;


import java.time.LocalDate;

import org.springframework.stereotype.Service;

import com.kh.billida.rentLocker.model.dto.Locker;

@Service
public interface RentLockerService {

	int insertLocker(Locker locker);

	int insertClob(Locker locker);

	Long selectInsertedLocker();

	int returnBatch(LocalDate today);

}

