<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/rentalFormCss/rentalForm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>


	<div class="skin">
		<img src="${contextPath}/resources/images/billigi.jpg">
	</div>


	<div class="billigi">
		<div class="title">${locker.lockerId}.${locker.lockerTitle}</div>
		<div class="contents">

			<div>
				<img class="pic" src="${locker.lockerImage}" >
			</div>

			<div class="contents-form-reply">

				<div class="outline">
					<p class="price-and-time">
						<span class="price">3,000원</span> <span class="time">~/일</span>
					</p>
					<form:form action="/rentalLocker/rental-form" method="post" class="rental-contents">
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
								<td><input onchange="rentStartFnc()" type="date" name="rentStart" value="${rental.rentStart}" min="${today}" max="${locker.rentableDateEnd}"/></td>
							</tr>
							<tr>
								<td class="rental-contents-title">대여 종료일</td>
								<td><input onchange="rentEndFnc()" type="date" name="rentEnd" value="${rental.rentEnd}" min="${today}" max="${locker.rentableDateEnd}"/></td>
							</tr>
							<tr>
								<td class="rental-contents-title">비용</td>
								<td class="cost"></td>
							</tr>
							<tr>
								<td colspan="2"><button type="button" class="submitButton" onclick="verifyDate()" style="cursor:pointer">빌리기</button></td>
							</tr>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		const auth = "${authentication}";
		const isRented = "${locker.rentStatus}";
		const lockerImage = "${locker.lockerImage}";
		
		const idArr = new Array();
		const scoreArr = new Array();
		const dateArr = new Array();
		const contentsArr = new Array();
		
		let dateContents = null;
		
		let rentStart = document.querySelector('input[name="rentStart"]');
		let rentEnd = document.querySelector('input[name="rentEnd"]');
		
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
		
		const b64toBlob = (b64Data, contentType='', sliceSize=512) => {
			  const byteCharacters = atob(b64Data);
			  const byteArrays = [];

			  for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
			    const slice = byteCharacters.slice(offset, offset + sliceSize);

			    const byteNumbers = new Array(slice.length);
			    for (let i = 0; i < slice.length; i++) {
			      byteNumbers[i] = slice.charCodeAt(i);
			    }

			    const byteArray = new Uint8Array(byteNumbers);
			    byteArrays.push(byteArray);
			  }

			  const blob = new Blob(byteArrays, {type: contentType});
			  return blob;
		}
		
		if(lockerImage == "0"){
			
			const contentType = 'image/png';
			
			const base64 = "${locker.imgToClob}";
			
			const blob = b64toBlob(base64, contentType);
			
			const blobUrl = URL.createObjectURL(blob);	
			
			document.querySelector(".pic").src = blobUrl;
			
		}
		
		const commonFnc = () => {
			
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
		
		const createCostDiv = (rentCost) => {
			let costDiv = document.querySelector(".cost"); 
			costDiv.classList.remove("inputFail");
			document.querySelector(".cost").innerText = rentCost+"원";
		};
		
		const calDiv = () => {
			document.querySelector(".cost").innerText = "계산중입니다.";
		};
		
		const createCostDivFalse = () => {
			let costDiv = document.querySelector(".cost"); 
			costDiv.classList.add("inputFail");
			costDiv.innerText = "정확한 날자를 입력해 주세요.";
		};
		
		const rentStartFnc = () => {
			
			dateContents = commonFnc();
			
			if(dateContents.rentEndBeforeRentStart){
				createCostDivFalse();
			}else if(isNaN(dateContents.rentCost)){
				calDiv();
			}else{
				createCostDiv(dateContents.rentCost);
			};
			
		};
		
		const rentEndFnc = () => {
			
			dateContents = commonFnc();
			
			if(dateContents.rentEndBeforeRentStart){
				createCostDivFalse();
			}else if(isNaN(dateContents.rentCost)){
				calDiv();
			}else{
				createCostDiv(dateContents.rentCost);
			};
			
		};
		
		const verifyDate = () => {
			
			if(auth == ""){
				alert("로그인을 해야 이용 가능한 기능입니다.");
			}else if(isNaN(rentStartToNumber) && isNaN(rentEndToNumber) && auth != ""){
				alert("대여 시작일과 종료일을 입력해주세요");
			}else if(isNaN(rentStartToNumber) && auth != ""){
				alert("대여 시작일을 입력해주세요");
			}else if(isNaN(rentEndToNumber) && auth != ""){
				alert("대여 종료일을 입력해주세요");
			}else if(rentStartToNumber > rentEndToNumber){
				alert("대여 시작일이 대여 종료일보다 앞설 수 없습니다.");
			}else{
				bNode.value = "submit";
			};
		
		};

	</script>

	<script type="text/javascript" src="${contextPath}/resources/js/rentalFormJs/rentalForm.js"></script>


</body>
</html>