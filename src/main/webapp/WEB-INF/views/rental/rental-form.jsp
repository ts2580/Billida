<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/rentalForm.css">
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
</head>
<body>

	<div class="billigi">
		<div class="title">${locker.lockerTitle}</div>
		<div class="contents">
			<div class="pic">
				<img src="${locker.lockerImage}">
			</div>
			<form:form action="/rental/rental-form" method="post" id="rental">
				<table>
					<tr>
						<td><i class="fas fa-map-marker-alt"></i>${locker.location}</td>
					</tr>
					<tr>
						<td>택배함 사이즈 :</td>
						<td>${locker.lockerSize}</td>
					</tr>
					<tr>
						<td>대여시작일 :</td>
						<td><input type="date" name="RentStart" value="${rental.rentStart}" /></td>
					</tr>
					<tr>
						<td>대여 종료일 :</td>
						<td><input type="date" name="RentEnd" value="${rental.rentEnd}" /></td>
					</tr>
					<tr>
						<td>비용 :</td>
						<td><input type="number" name="rentCost" value="${rental.rentCost}" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="대여" /></td>
					</tr>
				</table>
			</form:form>
		</div>


	</div>



</body>
</html>