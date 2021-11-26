<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${contextPath}/resources/css/all.css">
	<script type="text/javascript" src="${contextPath}/resources/js/webUtil.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/urlEncoder.js"></script>
	<link href="${contextPath}/resources/css/reviewCss/reviewForm.css" rel='stylesheet' type='text/css' />
	<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
</head>
<body>

<div class="review_wrap">
	<a class="review_title">
		별점과 리뷰를 남겨주세요.
	</a>
		<div class="form_area">
			<form:form modelAttribute="review" action="/review/modify-review" method="post" id="frm_review" name="frm_review">
				<div class="review_area">
					<div class="reviewImg"><img class="reviewImg" src="${reviewInfo.LOCKER_IMAGE}"></div>
					<div class="review_info">
						<span class="locker_title">- 사물함명 : ${reviewInfo.LOCKER_TITLE}</span>
						<span class="rent_start">- 대여날짜 : ${reviewInfo.RENT_START}</span>
						<span class="rent_end">- 반납날짜 : ${reviewInfo.RENT_END}</span>
					</div>
				</div>
				<div class="starRev">
					<span class="star">
						★★★★★
						<c:choose>
							<c:when test="${reviewInfo.SCORE eq '0.5'}"><span id="star" style="width: 10%">★★★★★</span></c:when>
							<c:when test="${reviewInfo.SCORE eq '1'}"><span id="star" style="width: 20%">★★★★★</span></c:when>
							<c:when test="${reviewInfo.SCORE eq '1.5'}"><span id="star" style="width: 30%">★★★★★</span></c:when>
							<c:when test="${reviewInfo.SCORE eq '2'}"><span id="star" style="width: 40%">★★★★★</span></c:when>
							<c:when test="${reviewInfo.SCORE eq '2.5'}"><span id="star" style="width: 50%">★★★★★</span></c:when>
							<c:when test="${reviewInfo.SCORE eq '3'}"><span id="star" style="width: 60%">★★★★★</span></c:when>
							<c:when test="${reviewInfo.SCORE eq '3.5'}"><span id="star" style="width: 70%">★★★★★</span></c:when>
							<c:when test="${reviewInfo.SCORE eq '4'}"><span id="star" style="width: 80%">★★★★★</span></c:when>
							<c:when test="${reviewInfo.SCORE eq '4.5'}"><span id="star" style="width: 90%">★★★★★</span></c:when>
							<c:when test="${reviewInfo.SCORE eq '5'}"><span id="star" style="width: 100%">★★★★★</span></c:when>
						</c:choose>
						<input type="range" oninput="drawStar(this)" value="0" step="0.5" min="0" max="5" name="score" id="score"/>
					</span>
				</div>
				<div class="score_msg"> </div>
				<div class="review_contents">
		            <textarea name="content" id="content" rows="10" class="review_textarea">${reviewInfo.CONTENT}</textarea>
		            <div id="counter">(0 / 최대 100자)</div>
		            <div class="content_msg"> </div>
		        </div>   
		        <div class="cmd">
		            <div class="saveDiv"><input type="submit" class="save" name="save" value="등록"></div>
		            <a class="cancelDiv" onclick='window.close()'><input type="button" class="cancel" name="cancel" value="취소"></a>
		        </div>
			</form:form>
		</div>
</div>

<script type="text/javascript" src="${contextPath}/resources/js/review/review-modifyForm.js"></script>

</body>
</html>