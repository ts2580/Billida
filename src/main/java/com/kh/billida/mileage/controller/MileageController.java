package com.kh.billida.mileage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.mileage.model.dto.Mileage;
import com.kh.billida.mileage.model.dto.MileageHistory;
import com.kh.billida.mileage.model.dto.PaymentDTO;
import com.kh.billida.mileage.model.service.MileageService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller
public class MileageController {
	
	private MileageService mileageService;
	private MileageHistory mileageHistory;
	private IamportClient api;
	
	public MileageController(MileageService mileageService, MileageHistory mileageHistory) {
		super();
		this.mileageService = mileageService;
		this.mileageHistory = mileageHistory;
		//아임포트 REST API 키 & REST API secret 등록(토큰 발급을 위해)
		this.api = new IamportClient("9260410594448011", "66c155215d6ee1a5564da402cbe8807b7d7b2df0643f8f82bb379dc6605efed9d1bedbf404a66e63");
	}
	
	@ResponseBody
	@RequestMapping(value="/paymentInfo/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model
										, Locale locale
										, HttpSession session
										, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{
		
		return api.paymentByImpUid(imp_uid); //검증에 필요한 함수 호출해서 imp_uid(거래고유번호) 넘겨주기
	}

	@PostMapping("mileage/update-mileage")
	public String updateMileage(@ModelAttribute PaymentDTO paymentDto) {
		Mileage userMileage = mileageService.selectUserMileage(paymentDto.getUserCode());//유저코드의 마일리지 존재하는지 확인
		mileageService.insertPaymentInfo(paymentDto); //payment 테이블에 정보 삽입
		
		mileageHistory.setUserCode(paymentDto.getUserCode());
		mileageHistory.setOrderNum(paymentDto.getOrderNum());
		mileageHistory.setMileage("+"+paymentDto.getMileage());
		mileageService.insertMileageHistoryInfo(mileageHistory); //mileageHistory테이블에 추가금액 정보 삽입
		
		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("userCode", paymentDto.getUserCode());
		commandMap.put("mileage", paymentDto.getMileage());
		
		if(userMileage == null) { //디비에 아직 마일리가 존재하지 않는다면,
			mileageService.insertMileage(commandMap); //마일리지 넣어주기
			return "redirect:/mileage/mileageInfo";
		}
		
		mileageService.updateMileage(commandMap); //디비에 이미 마일리지 존재한다면 해당 금액만큼 추가해주기
		
		return "redirect:/mileage/mileageInfo";
	}
	
	@GetMapping("mileage/mileageInfo")
	public void mileageInfo(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("authentication");
		
		//Member memberInfo = mileageService.selectMemberInfo(member.getUserCode()); //마일리지 새롭게 충전한 후 헤드에 보여주기 위해 새로 멤버 가져오기
		
		Mileage userMileage = mileageService.selectUserMileage(member.getUserCode()); //내 마일리지 정보 가져오기
//		if(userMileage == null) {
//			model.addAttribute("authentication", memberInfo);
//		}
		
		model.addAttribute("userMileage", userMileage);
		//model.addAttribute("authentication", memberInfo);
		
	}

}
