<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/css/lockerForm.css">
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
				<iframe width= "1000px" height = "500px" src="/locker/uploadForm" class="lockeraddForm">
				</iframe>
			</div>
			<div class="outline">
				<p class="price-and-time">
                	<span class="price">3,000원</span>
                	<span class="time">~/일</span>
           		</p>
				<form:form action="/locker/lockerMain" method="post" id="locker" class="rental-contents">
					<table>
						<tr>
							<td colspan="2"><i class="fas fa-map-marker-alt"></i>${locker.location}</td>
						</tr>
						<tr>
							<td class="rental-contents-title">사이즈</td>
							<td>
								<div class="dropdown">
									<button type="btn-primary dropdown-toggle" id="menu1" type="button" data-toggle="dropdown">
									사이즈
									<span class="visually-hidden"></span>
								</button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									<li role="presentation"><a a role="menuitem" tabindex="-1" value="Small">Small</a></li>
									<li role="presentation"><a a role="menuitem" tabindex="-1" value="Medium">Medium</a></li>
									<li role="presentation"><a a role="menuitem" tabindex="-1" value="Large">Large</a></li>
									<li role="presentation"><a a role="menuitem" tabindex="-1" value="XLarge">XLarge</a></li>
								</ul>
								</div>
							</td>
						</tr>
						<tr>
							<td class="rental-contents-title">이미지</td>
							<td>
								<form action="uploadLockerImage" method="post" enctype="multipart/form-data">
									<input type="file" name="files">
								</form>	
							</td>
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
							<td class="rental-contents-title">이익금</td>
							<td><input type="number" placeholder="자동계산됩니다."/></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="빌려주기" /></td>
						</tr>
					</table>
				</form:form>
			</div>

		</div>


	</div>


</body>
</html>