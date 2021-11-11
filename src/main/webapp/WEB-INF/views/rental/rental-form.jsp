<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/rentalForm.css">
</head>
<body>

	<form:form action="/rental/rental-form" method="get" id="rental" class="test">
		<table border="1">
			<tr>
				<td>대여번호 :</td>
				<td><input type="number" name="historyIndex" id="historyIndex" value="${rental.historyIndex}" /></td>
			</tr>
			<tr>
				<td>택배함 번호 :</td>
				<td><input type="number" name="lockerId" id="lockerId" value="${rental.lockerId}" /></td>
			</tr>
			<tr>
				<td>유저코드 :</td>
				<td><input type="text" name="UserCode" id="UserCode" value="${rental.userCode}" /></td>
			</tr>
			<tr>
				<td>대여시작일 :</td>
				<td><input type="date" name="RentStart" id="RentStart" value="${rental.rentStart}" /></td>
			</tr>
			<tr>
				<td>대여 종료일 :</td>
				<td><input type="date" name="RentEnd" id="RentEnd" value="${rental.rentEnd}" /></td>
			</tr>
			<tr>
				<td>비용 :</td>
				<td><input type="number" name="rentCost" id="rentCost" value="${rental.rentCost}" /></td>
			</tr>
			<tr>
				<td>반납시 택배함 이미지 :</td>
				<td><input type="text" name="rentPic" id="rentPic" value="${rental.rentPic}"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="대여" /></td>
			</tr>
		</table>
	</form:form>


</body>
</html>