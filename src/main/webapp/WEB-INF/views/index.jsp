<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

</head>
<body>
		<div class="content">
			<div class="wrapper">
			 <div class="main" role="main">
			 	<img class="mainImg" src="${contextPath}/resources/images/main1.jpg">
			 </div>
			 
			 <a id="recommendList">추천 사물함 리스트</a>
			 
			 <div class="locker_list">
			 	<c:forEach items="${mainList}" var="mains" begin="5" end="8">
					 <div class="locker_area">
					 	<img class="mainImg" src="${mains.lockerImage}">
					 	<div class="locker_name">${mains.lockerTitle}</div>
					 	<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${mains.lockerContent}</div>
					 	<div class="locker_info">
					 		<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 : ~ ${mains.rentableDate}</span>
					 		<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${mains.lockerSize}</span>
					 	</div>
					 </div>
				 </c:forEach>
			 </div>

			</div>
		</div>
	
<script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        
<script>
     /* $.ajax({
                method: "GET",
                url: "https://dapi.kakao.com/v2/search/image",
                data: {
                    query: "무인택배",
                    page:3,
                },
                headers: {
                    Authorization: "KakaoAK c4cb5006db806d8310ea2e01c8fe254b"
                },
            })
            .done(function (msg) {
                console.log(msg);
               
                for (var i = 0; i < 80; i++) {
                	console.log(msg.documents[i].image_url);
				}
            }); */

    </script>



</body>
</html>