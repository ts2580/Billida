<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/rentLockerCss/rentLockerForm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>


	<div class="skin">
		<img src="${contextPath}/resources/images/billigi.jpg">
	</div>


	<div class="billyeojugi">
		<a class="title">BILLADA</a><a class="title-thanks">를 이용해주셔서 감사합니다!</a>
		<div class="contents">
			<div>
				<img class="pic" src="${contextPath}/resources/images/billyeojugi.png">
			</div>

			<div class="contents-form-reply">

				<div class="outline">
					<p class="request-form">
						<span class="request-form-text">공간 내역을 입력해주세요.</span>
					</p>
					<form:form action="/rentLocker/rent-form" method="post" class="rent-contents">
						<table>
							<tr>
								<td class="rent-contents-text">도로명주소</td>
								<td><input type="text" name="lockerContent" onchange="syncTitle()"/></td>
								<td><input type="text" name="lockerTitle" class="display-none"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 이미지</td>
								<td><input type="text" name="lockerImage"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 사이즈</td>
								<td><input type="text" name="lockerSize"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 비밀번호</td>
								<td><input type="text" name="lockerPassword"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">임대시작 가능일</td>
								<td><input type="date" name="rentableDateStart"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">임대 종료일</td>
								<td><input type="date" name="rentableDateEnd"/></td>
							</tr>
							<tr>
								<td colspan="2"><button type="submit" class="submitButton" style="cursor:pointer">빌리기</button></td>
							</tr>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		let auth = "${authentication}";
		
		let rentStart = document.querySelector('input[name="rentableDateStart"]');
		let rentEnd = document.querySelector('input[name="rentableDateEnd"]');
		
		let btn = document.querySelector(".submitButton");
		let bNode = btn.getAttributeNode("type");
		
		let syncTitle = () => {
			let doRoMyeongJuSo = document.querySelector('input[name="lockerContent"]').value;
			document.querySelector('.display-none').value = doRoMyeongJuSo;
		}
		
		let commonFnc = () => {
			
			let today = new Date();
			
			rentStartToNumber = rentStart.valueAsNumber;
			rentEndToNumber = rentEnd.valueAsNumber;
			
			let rentEndBeforeRentStart = false;
			
			if(!isNaN(rentCost) && rentEndToNumber < rentStartToNumber){
				rentEndBeforeRentStart = true;
			};
			
			return{
				rentEndBeforeRentStart
			};
			
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
			};
		};
		
		let rentEndFnc = () => {
			
			dateContents = commonFnc();
			
			if(dateContents.rentEndBeforeRentStart){
				createCostDivFalse();
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