<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
	<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<link href="${contextPath}/resources/css/reviewCss/mileageInfo.css" rel='stylesheet' type='text/css' />

</head>
<body id="body-pd">
<div class="common_div">
	<div class="mileage_wrapper">
		<c:if test="${not empty userMileage}">
			<div class="my_mileage">${authentication.nick} 님 보유 마일리지
			<br>
			${userMileage.mileage} 원
			</div>
		</c:if>
		<c:if test="${empty userMileage}">
			<div class="my_mileage">${authentication.nick} 님 보유 마일리지
			<br>
			0 원
			</div>
		</c:if>
		
		<form:form modelAttribute="paymentForm" action="/mileage/update-mileage" name="payment_frm" method="post" class="payment_form">
			<div class="mileage_area">
				<div class="title"><img src="/resources/images/dollar.png" class="titleImg"/> 마일리지 충전 <img src="/resources/images/dollar.png" class="titleImg"/> </div>
				<div class="cost_area">
					<a type="button" class="cost1 cost" onclick="costInput('cost1')">5,000원</a>
					<a type="button" class="cost2 cost" onclick="costInput('cost2')">10,000원</a>
					<a type="button" class="cost3 cost" onclick="costInput('cost3')">50,000원</a>
					<a type="button" class="cost4 cost" onclick="costInput('cost4')">100,000원</a>
				</div>
				
				<div class="mileage_inputDiv"><input type="number" id="mileage" name="mileage" value="" readonly="readonly"/> 원</div>
				<div class="recharge"><a type="button" class="mileage_btn" onclick="payment()">충전하기</a></div>
			</div>
			
			<input type="hidden" id="userCode" name="userCode" value="${authentication.userCode}">
			<input type="hidden" id="orderNum" name="orderNum" value="">
			
			
			<input type="hidden" id="userName" name="userName" value="${authentication.name}">
			<input type="hidden" id="userEmail" name="userEmail" value="${authentication.email}">
			<input type="hidden" id="userAddress" name="userAddress" value="${authentication.address}">
			<input type="hidden" id="userTell" name="userTell" value="${authentication.phone}">
		</form:form>
	
	</div>
</div>

<script type="text/javascript" src="${contextPath}/resources/js/review/mileageInfo.js"></script>

</body>
</html>