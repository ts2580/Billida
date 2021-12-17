package com.kh.billida.rentLocker.model.service;

import java.time.LocalDate;

import org.springframework.stereotype.Service;

import com.kh.billida.rentLocker.model.dto.Locker;
import com.kh.billida.rentLocker.model.repository.RentLockerRepository;
import com.kh.billida.rentalHistory.common.exception.DataAccessException;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RentLockerServiceImpl implements RentLockerService{
	
	private final RentLockerRepository rentLockerRepository;

	public int insertLocker(Locker locker) {
		int result = 1;
		try {
			rentLockerRepository.insertLocker(locker);
		} catch (Exception e) {
			result = 0;
			throw new DataAccessException(e, "\n보관함을 Locker테이블에 삽입 실패\n");
		}finally {
			return result;
		}
		
	}
	
	public Long selectInsertedLocker() {
		Long result = Long.valueOf(1);
		try {
			return rentLockerRepository.selectInsertedLocker();
		} catch (Exception e) {
			result = Long.valueOf(0);
			throw new DataAccessException(e, "\n빌려준사람 마일리지 증가 관련 테이블 접근 에러\n");
		}finally {
			return result;
		}
		
	}
	
	public int insertClob(Locker locker) {
		int result = 1;
		try {
			rentLockerRepository.insertClob(locker);
		} catch (Exception e) {
			result = 0;
			throw new DataAccessException(e, "\n문자열화한 이미지를 DB에 넣는데 실패\n");
		}finally {
			return result;
		}
	}

	@Override
	public int returnBatch(LocalDate today) {
		int result = 1;
		try {
			rentLockerRepository.returnBatch(today);
		} catch (Exception e) {
			result = 0;
			throw new DataAccessException(e, "\n보관함 상태 업데이트 배치 실패\n");
		}finally {
			return result;
		}
		
		
	}

	
	

	
	
	
}