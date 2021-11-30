<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<%@ include file="/WEB-INF/views/review/navbar.jsp" %>
	<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
	<link href="${contextPath}/resources/css/reviewCss/reviewList.css" rel='stylesheet' type='text/css' />
	<link href="${contextPath}/resources/css/reviewCss/paging.css" rel='stylesheet' type='text/css' />
	<link href="${contextPath}/resources/css/modal.css" rel='stylesheet' type='text/css' />
</head>
<body id="body-pd">
<div class="common_div">
	<div class="review_wrapper">
	<h1 class="title">내 사물함 리뷰</h1>
		<ul class="review_list">
		
			<c:if test="${empty lockerReviews}">
				<div class="no_search">등록된 리뷰가 없습니다.</div>
			</c:if>
			
			<c:forEach items="${lockerReviews}" var="reviews">
				<li class="review_area">
					<div class="reviewImg"><img class="reviewImg" src="${reviews.LOCKER_IMAGE}"></div>
						<div class="review_box">
							<div class="nameNick">
								<span class="review_name">${reviews.LOCKER_TITLE}</span>
								<span class="review_nick"> [작성자] ${reviews.NICK}</span>
							</div>
							<div class="review_info">
								<div class="starRev">
									<span class="star">
									★★★★★
										<c:choose>
											<c:when test="${reviews.SCORE eq '0.5'}"><span id="star" style="width: 10%">★★★★★</span></c:when>
											<c:when test="${reviews.SCORE eq '1'}"><span id="star" style="width: 20%">★★★★★</span></c:when>
											<c:when test="${reviews.SCORE eq '1.5'}"><span id="star" style="width: 30%">★★★★★</span></c:when>
											<c:when test="${reviews.SCORE eq '2'}"><span id="star" style="width: 40%">★★★★★</span></c:when>
											<c:when test="${reviews.SCORE eq '2.5'}"><span id="star" style="width: 50%">★★★★★</span></c:when>
											<c:when test="${reviews.SCORE eq '3'}"><span id="star" style="width: 60%">★★★★★</span></c:when>
											<c:when test="${reviews.SCORE eq '3.5'}"><span id="star" style="width: 70%">★★★★★</span></c:when>
											<c:when test="${reviews.SCORE eq '4'}"><span id="star" style="width: 80%">★★★★★</span></c:when>
											<c:when test="${reviews.SCORE eq '4.5'}"><span id="star" style="width: 90%">★★★★★</span></c:when>
											<c:when test="${reviews.SCORE eq '5'}"><span id="star" style="width: 100%">★★★★★</span></c:when>
										</c:choose>
									</span>
								</div>		
								<span class="review_content">${reviews.CONTENT}</span>
							</div>
						</div>
					<div class="review_date">${reviews.UPDATE_DATE}</div>
				</li>
				<hr>
			</c:forEach>
		</ul>
		
		<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">
					
						<!-- 이전페이지 버튼 -->
	                	<c:if test="${paging.prev}">
	                    	<li class="pageInfo_btn previous" href="${paging.startPage-1}">&laquo;</li>
	                	</c:if>
					
						<!-- 각 번호 페이지 버튼  -->
						<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
							<li class="pageInfo_btn ${paging.cri.pageNum == num ? "active":"" }" href="${num}">${num}</li>
						</c:forEach>
						
						<!-- 다음페이지 버튼 -->
	                	<c:if test="${paging.next}">
	                    	<li class="pageInfo_btn next" href="${paging.endPage + 1 }">&raquo;</li>
	                	</c:if>
					</ul>
				</div>
			</div>
	
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
				<input type="hidden" name="amount" value="${paging.cri.amount}">
			</form>
	</div>
</div>

<script type="text/javascript">

let moveForm = $("#moveForm");

$(".pageInfo li").on("click", function(e){
	 e.preventDefault();
     moveForm.find("input[name='pageNum']").val($(this).attr("href"));
     moveForm.attr("action", "locker-reviews");
     moveForm.submit();
});

</script>
</body>
</html>