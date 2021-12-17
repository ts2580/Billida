package com.kh.billida.rentalHistory.model.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.billida.rentalHistory.common.exception.DataAccessException;
import com.kh.billida.rentalHistory.model.dto.LessorMileage;
import com.kh.billida.rentalHistory.model.dto.LockerForLental;
import com.kh.billida.rentalHistory.model.dto.Mileage;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;
import com.kh.billida.rentalHistory.model.repository.RentalRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class RentalServiceImpl implements RentalService{
	
	private final RentalRepository rentalRepository;
	
	public LockerForLental selectLocker(Long lockerId) {
		
		LockerForLental locker = null;
		
		try {
			locker = rentalRepository.selectLocker(lockerId);
		} catch (Exception e) {
			throw new DataAccessException(e, "\n보관함 테이블 접근 에러\n");
		}finally {
			return locker;
		}
		
	}
	
	public List<ReviewForRentHistory> selectReview(Long lockerId) {
		List<ReviewForRentHistory> reviews = null;
		
		try {
			reviews = rentalRepository.selectReview(lockerId);
		} catch (Exception e) {
			throw new DataAccessException(e, "\n리뷰 테이블 접근 에러\n");
		}finally {
			return reviews;
		}
	}
	
	public Long selectRentalMileage(Mileage rantalMileage) {
		
		Long mileage = null;
		
		try {
			mileage = rentalRepository.selectRentalMileage(rantalMileage);
		} catch (Exception e) {
			throw new DataAccessException(e, "\n마일리지 테이블 접근 에러\n");
		}finally {
			return mileage;
		}
	}
	
	public int insertAndUpdateRental(Rental rental) {
		
		int result = 1;
		
		try {
			rentalRepository.insertAndUpdateRental(rental);
		} catch (Exception e) {
			result = 0;
			throw new DataAccessException(e, "\n대여 내역 업데이트 & 보관함 상태 업데이트 관련 테이블 접근 에러\n");
		} finally {
			return result;
		}

	}
	
	public int selectAndUpdateRentalMileage(Mileage RantalMileage) {
		
		int result = 1;
		try {
			rentalRepository.selectAndUpdateRentalMileage(RantalMileage);
		} catch (Exception e) {
			result = 0;
			throw new DataAccessException(e, "\n빌린사람 마일리지 차감 프로시저 관련 테이블 접근 에러\n");
		} finally {
			return result;
		}
		
	}

	public int selectAndUpdateLessorMileage(LessorMileage lessorMileage) {
		
		int result = 1;
		try {
			rentalRepository.selectAndUpdateLessorMileage(lessorMileage);
		} catch (Exception e) {
			result = 0;
			throw new DataAccessException(e, "\n빌려준사람 마일리지 증가 관련 테이블 접근 에러\n");
		} finally {
			return result;
		}
	}
	
	public int downGradeMember(String userCode) {
		int result = 1;
		try {
			rentalRepository.downGradeMember(userCode);
		} catch (Exception e) {
			result = 0;
			throw new DataAccessException(e, "\n강등 실패\n");
		}finally {
			return result;
		}
		
		
	}

	public int returnBatch(LocalDate today) {
		int result = 1;
		try {
			rentalRepository.returnBatch(today);
		} catch (Exception e) {
			result = 0;
			throw new DataAccessException(e, "\n배치 실패\n");
		}finally {
			return result;
		}
		
		
	}

	
}
