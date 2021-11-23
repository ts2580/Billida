<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet"
	href="${contextPath}/resources/css/rentalForm.css">
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
					<form:form action="/rental/rental-form" method="post" id="rental"
						class="rental-contents">
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
								<td><input type="number" placeholder="자동계산됨 입력 노필요" /></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="대여" /></td>
							</tr>
						</table>
					</form:form>
				</div>

				<div class="reply">
					<i class="far fa-smile-beam"></i> 
					<div class="reply-contents">
						<div class="reply-contents-userInfo">
							<div class="reply-contents-userInfo-userId">아이디는11글자까지ㅎ</div>
							<div class="reply-contents-userInfo-score">★★★★☆</div>
							<div class="reply-contents-userInfo-date">2021/11/23</div>
						</div>
						<div class="reply-contents-reply">좋은 접근성 그리고 리뷰 내용은 200글자까지인데 다 쓰기에는 좀 많은듯</div>
					</div>
					
				</div>
			</div>
		</div>



	</div>





</body>
</html>