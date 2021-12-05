<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/rentLockerCss/rentLockerForm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>


	<div class="skin">
		<img src="${contextPath}/resources/images/billigi.jpg">
	</div>
	
	<div class="billyeojugi">
		<a class="title">BILLADA</a><a class="title-thanks">를 이용해주셔서 감사합니다!</a>
		<div class="contents">
			<div class="image_container">
				<img class="pic" src="${contextPath}/resources/images/billyeojugi.png">
			</div>

			<div class="contents-form-reply">
				<div class="outline">
					<p class="request-form">
						<span class="request-form-text">공간 내역을 입력해주세요.</span>
					</p>
					<form:form action="/rentLocker/rent-form" method="post" class="rent-contents">
						<table>
							<tr>
								<td class="rent-contents-text">택배함 이름</td>
								<td>
									<input type="text" name="lockerTitle"/>
								</td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 주소</td>
								<td class="rent-contents-juso">
									<input type="text" class="roadAddrPart1">
									<input type="text" class="roadAddrPart2" placeholder="상세주소를 입력해주세요">
									<input type="button" class="jusoBtn" value="주소 검색">
									<input type="text" name="lockerContent" style="display:none">
									<input type="text" name="location" style="display:none">
									<input type="text" name="latitude" style="display:none">
									<input type="text" name="longitude" style="display:none">
								</td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 이미지</td>
								<td>
									<label for="image">이미지를 선택해주세요
										<input type="file" id="image" accept="image/*" style="display:none"/>
										<input type="hidden" name="imgToClob" style="display:none"/>
									</label>
								</td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 사이즈</td>
								<td>
									<select name="lockerSize">
    									<option value="30(X) X 30(Y) X 55(Z)">30(X) X 30(Y) X 55(Z) cm</option>
    									<option value="45(X) X 55(Y) X 55(Z)">45(X) X 55(Y) X 55(Z) cm</option>
   							 			<option value="75(X) X 75(Y) X 55(Z)">75(X) X 75(Y) X 55(Z) cm</option>
  									</select>
								</td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 비밀번호</td>
								<td>
									<input type="text" name="lockerPassword"/>
								</td>
							</tr>
							<tr>
								<td class="rent-contents-text">임대시작 가능일</td>
								<td>
									<input type="date" name="rentableDateStart"/>
								</td>
							</tr>
							<tr>
								<td class="rent-contents-text">임대 종료일</td>
								<td>
									<input type="date" name="rentableDateEnd"/>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" class="submitButton">빌려주기</button>
								</td>
							</tr>
						</table>
					</form:form>
				</div>
				<div id="map"></div>
			</div>
		</div>
	</div>
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3d2bd52763449a074cc0c982030b6bf&libraries=services"></script>
	<script type="text/javascript">
	
	const today = "${today}"
	
	</script>
	<script type="text/javascript" src="${contextPath}/resources/js/rentLocker/rentLockerForm.js"></script>

</body>
</html>