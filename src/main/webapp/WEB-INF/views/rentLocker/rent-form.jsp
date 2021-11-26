<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/rentLockerCss/rentLockerForm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
</head>
<body>


	<div class="skin">
		<img src="${contextPath}/resources/images/billigi.jpg">
	</div>


	<div class="billigi">
		<div class="title">${locker.lockerId}.${locker.lockerTitle}</div>
		<div class="contents">

			<div class="pic">
				<img src="${locker.lockerImage}">
			</div>

			<div class="contents-form-reply">

				<div class="outline">
					<p class="price-and-time">
						<span class="price">3,000원</span> <span class="time">~/일</span>
					</p>
					<form:form action="/rental/rental-form" method="post" class="rental-contents">
						<table>
							<tr>
								<td colspan="2"><i class="fas fa-map-marker-alt"></i> ${locker.location}</td>
							</tr>
							<tr>
								<td class="rental-contents-title">사이즈</td>
								<td>${locker.lockerSize}</td>
							</tr>
							<tr>
								<td class="rental-contents-title">대여 시작일</td>
								<td><input onchange="rentStartFnc()" type="date" name="RentStart" value="${rental.rentStart}" min="${today}" max="${locker.rentableDateEnd}"/></td>
							</tr>
							<tr>
								<td class="rental-contents-title">대여 종료일</td>
								<td><input onchange="rentEndFnc()" type="date" name="RentEnd" value="${rental.rentEnd}" min="${today}" max="${locker.rentableDateEnd}"/></td>
							</tr>
							<tr>
								<td class="rental-contents-title">비용</td>
								<td class="cost"></td>
							</tr>
							<tr>
								<td colspan="2"><button type="submit" class="submitButton" onclick="verifyDate()" style="cursor:pointer">빌리기</button></td>
							</tr>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		let auth = "${authentication}";
		let isRented = "${locker.rentStatus}";
		
		let idArr = new Array();
		let scoreArr = new Array();
		let dateArr = new Array();
		let contentsArr = new Array();
		let dateContents = null;
		
		let rentStart = document.querySelector('input[name="RentStart"]');
		let rentEnd = document.querySelector('input[name="RentEnd"]');
		
		let rentStartToNumber = rentStart.valueAsNumber;
		let rentEndToNumber = rentEnd.valueAsNumber;
		
		let btn = document.querySelector(".submitButton");
		let bNode = btn.getAttributeNode("type");
		
		<c:forEach var="reviews" items="${reviews}">
			idArr.push('${reviews.nick}');
			scoreArr.push('${reviews.score}');
			dateArr.push('${reviews.createDate}');
			contentsArr.push('${reviews.content}');
		</c:forEach>
		
		let commonFnc = () => {
			
			let today = new Date();
			
			rentStartToNumber = rentStart.valueAsNumber;
			rentEndToNumber = rentEnd.valueAsNumber;
			let rentCost = (rentEndToNumber-rentStartToNumber)/28800+3000;
			
			let rentEndBeforeRentStart = false;
			
			if(!isNaN(rentCost) && rentEndToNumber < rentStartToNumber){
				rentEndBeforeRentStart = true;
			};
			
			return{
				rentCost,
				rentEndBeforeRentStart
			};
			
		};
		
		let createCostDiv = (rentCost) => {
			let costDiv = document.querySelector(".cost"); 
			costDiv.classList.remove("inputFail");
			document.querySelector(".cost").innerText = rentCost+"원";
		};
		
		let calDiv = () => {
			document.querySelector(".cost").innerText = "계산중입니다.";
		};
		
		let createCostDivFalse = () => {
			let costDiv = document.querySelector(".cost"); 
			costDiv.classList.add("inputFail");
			costDiv.innerText = "정확한 날자를 입력해 주세요.";
		};
		
		let rentStartFnc = () => {
			
			dateContents = commonFnc();
			
			if(dateContents.rentEndBeforeRentStart){
				createCostDivFalse();
			}else if(isNaN(dateContents.rentCost)){
				calDiv();
			}else{
				createCostDiv(dateContents.rentCost);
			};
			
		};
		
		let rentEndFnc = () => {
			
			dateContents = commonFnc();
			
			if(dateContents.rentEndBeforeRentStart){
				createCostDivFalse();
			}else if(isNaN(dateContents.rentCost)){
				calDiv();
			}else{
				createCostDiv(dateContents.rentCost);
			};
			
		};
		
		let verifyDate = () => {
			
			if(auth == ""){
				bNode.value = "button";
				alert("로그인을 해야 이용 가능한 기능입니다.");
			}else if(isNaN(rentStartToNumber) && isNaN(rentEndToNumber) && auth != ""){
				bNode.value = "button";
				alert("시작일과 종료일을 입력해주세요");
			}else if(isNaN(rentStartToNumber) && auth != ""){
				bNode.value = "button";
				alert("시작일을 입력해주세요");
			}else if(isNaN(rentEndToNumber) && auth != ""){
				bNode.value = "button";
				alert("종료일을 입력해주세요");
			}else if(rentStartToNumber > rentEndToNumber){
				bNode.value = "button";
				alert("대여 시작일이 대여 종료일보다 앞설 수 없습니다.");
			}else{
				bNode.value = "submit";
			};
		
		};

	</script>

	<script type="text/javascript" src="${contextPath}/resources/js/rentLocker/rentLockerForm.js"></script>


</body>
</html>