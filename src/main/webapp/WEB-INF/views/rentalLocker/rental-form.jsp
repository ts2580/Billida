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
				<img class="pic">
			</div>

			<div class="contents-form-reply">

				<div class="outline">
					<p class="price-and-time">
						<span class="price">500원</span> <span class="time">~/일</span>
					</p>
					<form:form action="/rentalLocker/rental-form" method="post" class="rental-contents">
						<table>
							<tr>
								<td colspan="2">
									<i class="fas fa-map-marker-alt"></i>
									<a class="map" style="cursor:pointer">${locker.lockerContent}</a>
								</td>
							</tr>
							<tr>
								<td class="rental-contents-title">사이즈</td>
								<td>${locker.lockerSize}</td>
							</tr>
							<tr>
								<td class="rental-contents-title">대여 시작일</td>
								<td><input type="date" name="rentStart" value="${rental.rentStart}" min="${today}" max="${locker.rentableDateEnd}"/></td>
							</tr>
							<tr>
								<td class="rental-contents-title">대여 종료일</td>
								<td><input type="date" name="rentEnd" value="${rental.rentEnd}" min="${today}" max="${locker.rentableDateEnd}"/></td>
							</tr>
							<tr>
								<td class="rental-contents-title">비용</td>
								<td class="cost"></td>
							</tr>
							<tr>
								<td colspan="2"><button type="button" class="submitButton" style="cursor:pointer">빌리기</button></td>
							</tr>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	
		const isRented = "${locker.rentStatus}";
		const lockerImage = "${locker.lockerImage}";
		const base64 = "${locker.imgToClob}";
		const baseImg = "${locker.lockerImage}";
		const RantalMileage = "${RantalMileage}"
		
		const idArr = new Array();
		const scoreArr = new Array();
		const dateArr = new Array();
		const contentsArr = new Array();
		
		<c:forEach var="reviews" items="${reviews}">
			idArr.push('${reviews.nick}');
			scoreArr.push('${reviews.score}');
			dateArr.push('${reviews.createDate}');
			contentsArr.push('${reviews.content}');
		</c:forEach>
	
	</script>
	
	<script type="text/javascript" src="${contextPath}/resources/js/common/changeBase64ToBlob.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/rentalFormJs/rentalForm.js"></script>


</body>
</html>