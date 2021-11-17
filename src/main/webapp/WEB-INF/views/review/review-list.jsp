<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript" src='../../../resources/js/jquery.js'></script>

<style type="text/css">
.rent_list{
	display: flex;
	flex-direction: column;
	width: 60%;
}

.rent_area{
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	height: 250px;
	color: #494949;
}

.rentImg{
	height: 250px;
	width: 250px;
}

.rent_name {
    display: flex;
    justify-content: flex-start;
    font-weight: 600;
    font-size: 100%;
    padding-top: 3px;
    padding-bottom: 5px;
}

.rent_start {
    position: relative;
    padding-bottom: 5px;
    font-size: 10px;
}

.rent_end {
    position: relative;
    padding-bottom: 5px;
    font-size: 10px;
}

</style>

</head>
<body>
<div class="content">
<h1>사물함 대여 현황</h1>
	
	<div class="rent_list list1">
		<c:forEach items="${rentList}" var="rents">
			<div class="rent_area">
				<div class="rentImg"><img class="imgs" src="${rents.lockerImage}"></div>
				<div class="rent_name">${rents.lockerTitle}</div>
				<div class="rent_start"><i class="fas fa-map-marker-alt"></i> 대여날짜 : ${rents.rentStart}</div>
				<div class="rent_end"><i class="fas fa-map-marker-alt"></i> 반납날짜 : ${rents.rentEnd}</div>
			 </div>
			 <a href="/review/review-form?historyIndex=${rents.historyIndex}" class="reviewButton">리뷰작성</a>
		</c:forEach>
	</div>
	
</div>




</body>
</html>