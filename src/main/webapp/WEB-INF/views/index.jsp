<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<style type="text/css">
	.valid-msg{color:red;   font-size:0.5vw;}
</style>
</head>
<body>
		<div class="content">
			<div class="wrapper">
			 <div class="main" role="main">
			 	<img class="mainImg" src="${contextPath}/resources/images/main1.jpg">
			 </div>
			 
			 <a id="recommendList">추천 사물함 리스트</a>
			 
			 <div class="locker_list">
				 <div class="locker_area">
				 	<img class="mainImg" src="${contextPath}/resources/images/사물함1.png">
				 	<div class="locker_name">${main.lockerTitle}</div>
				 	<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${main.lockerContent}</div>
				 	<div class="locker_info">
				 		<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 : ~ ${main.rentableDate}</span>
				 		<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${main.lockerSize}</span>
				 	</div>
				 </div>
				 <div class="locker_area">
				 	<img class="mainImg" src="${contextPath}/resources/images/사물함1.png">
				 	<div class="locker_name">${main.lockerTitle}</div>
				 	<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${main.lockerContent}</div>
				 	<div class="locker_info">
				 		<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 : ~ ${main.rentableDate}</span>
				 		<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${main.lockerSize}</span>
				 	</div>
				 </div>
				 <div class="locker_area">
				 	<img class="mainImg" src="${contextPath}/resources/images/사물함1.png">
				 	<div class="locker_name">${main.lockerTitle}</div>
				 	<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${main.lockerContent}</div>
				 	<div class="locker_info">
				 		<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 : ~ ${main.rentableDate}</span>
				 		<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${main.lockerSize}</span>
				 	</div>
				 </div>
			 </div>

			</div>
		</div>
	




</body>
</html>