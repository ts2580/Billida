<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/rentalFormCss/map.css">
<title>Insert title here</title>
</head>
<body>

	<div id="map"></div>


	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3d2bd52763449a074cc0c982030b6bf&libraries=services"></script>
	<script type="text/javascript">
	
	const longitude= "${longitude}";
	const latitude= "${latitude}";
	
	</script>
	<script type="text/javascript" src="${contextPath}/resources/js/rentalFormJs/map.js"></script>
</body>
</html>