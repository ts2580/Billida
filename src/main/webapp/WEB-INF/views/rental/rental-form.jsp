<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/rentalFormCss/rentalForm.css">
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
								<td colspan="2"><i class="fas fa-map-marker-alt"></i>${locker.location}</td>
							</tr>
							<tr>
								<td class="rental-contents-title">사이즈</td>
								<td>${locker.lockerSize}</td>
							</tr>
							<tr>
								<td class="rental-contents-title">대여 시작일</td>
								<td><input onchange="calCost()" type="date" name="RentStart" value="${rental.rentStart}" /></td>
							</tr>
							<tr>
								<td class="rental-contents-title">대여 종료일</td>
								<td><input onchange="calCost()" type="date" name="RentEnd" value="${rental.rentEnd}"/></td>
							</tr>
							<tr>
								<td class="rental-contents-title">비용</td>
								<td class="cost"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" class="submitButton"/></td>
							</tr>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		let idArr = new Array();
		let scoreArr = new Array();
		let dateArr = new Array();
		let contentsArr = new Array();
		
		<c:forEach var="reviews" items="${reviews}">
			idArr.push('${reviews.nick}');
			scoreArr.push('${reviews.score}');
			dateArr.push('${reviews.createDate}');
			contentsArr.push('${reviews.content}');
		</c:forEach>
		
		let calCost = () => {
			let rentStart = document.querySelector('input[name="RentStart"]').valueAsNumber;
			let rentEnd = document.querySelector('input[name="RentEnd"]').valueAsNumber;
			let rentCost = (rentEnd-rentStart)/1000/60/60/24*3000;
			
			if(!isNaN(rentCost)){
				document.querySelector(".cost").innerText = rentCost+"원";
			};
			
		};

	</script>

	<script type="text/javascript" src="${contextPath}/resources/js/rentalFormJs/rentalForm.js"></script>


</body>
</html>