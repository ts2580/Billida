<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet"
	href="${contextPath}/resources/css/rentalForm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap"
	rel="stylesheet">
</head>
<body>


	<div class="skin">
		<img src="${contextPath}/resources/images/billigi.jpg"">
	</div>
	<div class="billigi">
		<div class="title">${locker.lockerTitle}</div>
		<div class="contents">
			<div>
				<img src="${locker.lockerImage}" class="pic">
			</div>
			<div class="outline">
				<p class="price-and-time">
                	<span class="price">3,000원</span>
                	<span class="time">~/일</span>
           		</p>
				<form:form action="/rental/rental-form" method="post" id="rental" class="rental-contents">
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
							<td><input type="date" name="RentStart" value="${rental.rentStart}" /></td>
						</tr>
						<tr>
							<td class="rental-contents-title">대여 종료일</td>
							<td><input type="date" name="RentEnd" value="${rental.rentEnd}" /></td>
						</tr>
						<tr>
							<td class="rental-contents-title">비용</td>
							<td><input type="number" placeholder="자동계산됨 입력하지마"/></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="대여" /></td>
						</tr>
					</table>
				</form:form>
			</div>

		</div>


	</div>



</body>
</html>