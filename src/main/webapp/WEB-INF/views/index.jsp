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
			 
			 <div class="lockerList">
				 <div class="locker">
				 	<img class="mainImg" src="${contextPath}/resources/images/사물함1.png">
				 	<span class="lockerInfo">택배함사진&정보</span>
				 </div>
				 <div class="locker">
				 	<img class="mainImg" src="${contextPath}/resources/images/사물함2.jpg">
				 	<span class="lockerInfo">택배함사진&정보</span>
				 </div>
				 <div class="locker">
				 	<img class="mainImg" src="${contextPath}/resources/images/사물함3.jpg">
				 	<span class="lockerInfo">택배함사진&정보</span>
				 </div>
			 </div>

			</div>
		</div>
	




</body>
</html>