<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	
<style type="text/css">
.mileage_wrapper{
	display: flex;
	margin-top: 100px;
	flex-direction: column;
	align-items: center;
}

.my_mileage{
	display: flex;
	margin-bottom: 50px;
	font-weight: bolder;
	text-align: center;
}

.mileage_area{
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
}

.title{
	display: flex;
	padding-bottom: 20px;
	font-weight: bolder;
}

.cost_area{
	display: flex;
	width: 40%;
	justify-content: space-around;
	padding-bottom: 20px;
	
}

.cost{
	display: flex;
	width: 110px;
	border: 1px solid;
	justify-content: center;
	cursor: default;
}

.mileage_inputDiv{
	display: flex;
	padding-bottom: 20px;
}

.recharge{
	display: flex;
	justify-content: center;
	align-items: center;
	width: 80px;
	height: 30px;
	border: 1px solid;
	border-radius: 5px;
	cursor: pointer;
}

.mileage_btn{
	display: flex;
}

#mileageAmount{
	width: 100px;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}


</style>
	
</head>
<body>

<div class="mileage_wrapper">
	<c:if test="${not empty userMileage}">
		<div class="my_mileage">보유 마일리지 
		<br>
		${userMileage.mileage} 원
		</div>
	</c:if>
	<c:if test="${empty userMileage}">
		<div class="my_mileage">보유 마일리지
		<br>
		0 원
		</div>
	</c:if>
	
	<div class="mileage_area">
		<div class="title">마일리지 충전</div>
		<div class="cost_area">
			<a type="button" class="cost1 cost" onclick="costInput('cost1')">5,000원</a>
			<a type="button" class="cost2 cost" onclick="costInput('cost2')">10,000원</a>
			<a type="button" class="cost3 cost" onclick="costInput('cost3')">50,000원</a>
			<a type="button" class="cost4 cost" onclick="costInput('cost4')">100,000원</a>
		</div>
		
		<div class="mileage_inputDiv"><input type="number" id="mileageAmount" value=""/> 원</div>
		<div class="recharge"><a type="button" class="mileage_btn" onclick="payment('${authentication.userCode}')">충전하기</a></div>
	</div>

	<input type="hidden" id="userName" name="userName" value="${authentication.name}">
	<input type="hidden" id="userEmail" name="userEmail" value="${authentication.email}">
	<input type="hidden" id="userAddress" name="userAddress" value="${authentication.address}">
	<input type="hidden" id="userTell" name="userTell" value="${authentication.phone}">


</div>


<script type="text/javascript">

function costInput(cost){
	switch (cost) {
	case 'cost1':
		document.getElementById('mileageAmount').value = 5000;
		document.querySelector("#mileageAmount").innerText = "5,000"
		break;
	case 'cost2':
		document.getElementById('mileageAmount').value = 10000;
		document.querySelector("#mileageAmount").innerText = "10,000"
		break;
	case 'cost3':
		document.getElementById('mileageAmount').value = 50000;
		document.querySelector("#mileageAmount").innerText = "50,000"
	break;
	case 'cost4':
		document.getElementById('mileageAmount').value = 100000;
		document.querySelector("#mileageAmount").innerText = "100,000"
	break;

	default:
		break;
	}
}

function payment(userCode){
	let mileage = document.getElementById('mileageAmount').value;
	
	console.log("로그인한 유저코드 : " + userCode);
	console.log("충전금액 : " + mileage);
	
	var IMP = window.IMP;
	IMP.init('imp48740916'); //내 식별코드
	var msg;
	
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card', //지불수단
	    merchant_uid: 'merchant_' + new Date().getTime(), // 내 사이트에서 관리하는 주문 번호
	    name : "마일리지 충전", 
	    amount : mileage, //결제 가격
	    buyer_email : document.getElementById('userEmail').value, //결제하는 사람 이메일
	    buyer_name : document.getElementById('userName').value, //결제하는 사람 이름
	    buyer_tel : document.getElementById('userTell').value, //결제하는 사람 번호
	    buyer_addr : document.getElementById('userAddress').value, //결제하는 사람 주소
	  
	}, function(rsp) {
			console.log(rsp);
			console.log(userCode);
			//결제 검증(거래고유번호 검증)
			$.ajax({
				type : "POST",
				url : "/kakaopay/" + rsp.imp_uid   
			}).done(function(data){
				console.log(data);
				
				if(rsp.paid_amount == data.response.amount){
					alert("결제가 완료되었습니다.");
					location.href = 'update-mileage?userCode='+userCode + '&mileage=' +mileage;
				}else{
					var msg = '결제에 실패하였습니다. \n';
			        msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
	});
}




</script>

</body>
</html>