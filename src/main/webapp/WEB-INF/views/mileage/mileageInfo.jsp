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

.payment_form{
	width: 100%;
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
	font-size: 1.1vw;
}

.cost{
	display: flex;
	width: 110px;
	height: 30px;
	border: 1px solid;
	justify-content: center;
	align-items: center;
	cursor: default;
}

.cost:hover{
	background-color: #00BFFF;
	color: white;
}

.mileage_inputDiv{
	display: flex;
	padding-bottom: 20px;
	align-items: center;
}

.recharge{
	display: flex;
	justify-content: center;
	align-items: center;
	width: 80px;
	height: 35px;
	border-radius: 5px;
	cursor: pointer;
	background-color: rgba(253, 179, 109, 1);
}

.recharge:hover{
	background-color: rgba(248, 106, 18, 0.86);
	color: white;
}

.mileage_btn{
	display: flex;
}

#mileage{
	width: 100px;
	height: 22px;
	margin-right: 5px;
	border: none;
	border-radius: 5px;
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
			<div class="title">마일리지 충전</div>
			<div class="cost_area">
				<a type="button" class="cost1 cost" onclick="costInput('cost1')">5,000원</a>
				<a type="button" class="cost2 cost" onclick="costInput('cost2')">10,000원</a>
				<a type="button" class="cost3 cost" onclick="costInput('cost3')">50,000원</a>
				<a type="button" class="cost4 cost" onclick="costInput('cost4')">100,000원</a>
			</div>
			
			<div class="mileage_inputDiv"><input type="number" id="mileage" name="mileage" value=""/> 원</div>
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


<script type="text/javascript">

function costInput(cost){
	switch (cost) {
	case 'cost1':
		document.getElementById('mileage').value = 5000;
		document.querySelector("#mileage").innerText = "5,000"
		break;
	case 'cost2':
		document.getElementById('mileage').value = 10000;
		document.querySelector("#mileage").innerText = "10,000"
		break;
	case 'cost3':
		document.getElementById('mileage').value = 50000;
		document.querySelector("#mileage").innerText = "50,000"
	break;
	case 'cost4':
		document.getElementById('mileage').value = 100000;
		document.querySelector("#mileage").innerText = "100,000"
	break;

	default:
		break;
	}
}

function payment(){
	let mileage = document.getElementById('mileage').value;
	
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
	    buyer_email : "${authentication.email}", //결제하는 사람 이메일
	    buyer_name : "${authentication.name}", //결제하는 사람 이름
	    buyer_tel : "${authentication.phone}", //결제하는 사람 번호
	    buyer_addr : "${authentication.address}", //결제하는 사람 주소
	  
	}, function(rsp) {
			console.log(rsp);
			//결제 검증(거래고유번호 검증)
			$.ajax({
				type : "POST",
				url : "/kakaopay/" + rsp.imp_uid   
			}).done(function(data){
				console.log(data);
				console.log("주문번호  :" + data.response.impUid);
				
				const orderNum = data.response.impUid;
				console.log("orderNum : " + orderNum);
				
				if(rsp.paid_amount == data.response.amount){
					document.getElementById('orderNum').value = orderNum;
					alert("결제가 완료되었습니다.");
					document.payment_frm.submit();
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