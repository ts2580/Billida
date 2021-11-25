<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE HTML>
<html>
<head>

<title>택배함 리스트</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/resources/css/lockerForm.css">

</head>
<body>

<div class="iframe">
	<form:form action="/locker/lockerMain" method="post" id="locker" class="locker-contents">
	<table>
		<tr>
			<td colspan="6">누적 총 수입액 : </td>
		</tr>
		<tr>
			<td colspan="6">출금 가능액 : </td>
		</tr>
		<tr>
			<td colspan="6">마일리지 잔액 : </td>
		</tr>
		
	</table>
	<table>
		<thead>
			<tr>
				<td>내가 공유중인 공간</td>
				<td>빌려준 횟수</td>
				<td>수익</td>
				<td>현재 상태</td>
				<td>잔여 임대기간</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>내가 공유중인 택배함</td>
			</tr>
		</tbody>
	
	
	
	</table>

	</form:form>
</div>

</body>
</html>