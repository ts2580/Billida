<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<div class="content">
	<div class="wrapper">
		<div class="locker_list">
			<c:forEach items="${searchList}" var="lockerList">
				<div class="locker_area">
					<img class="mainImg" src="${lockerList.lockerImage}">
					<div class="locker_name">${lockerList.lockerTitle}</div>
					<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${lockerList.lockerContent}</div>
					<div class="locker_info">
						<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 :~ ${lockerList.rentableDate}</span> 
						<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${lockerList.lockerSize}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>










</body>
</html>