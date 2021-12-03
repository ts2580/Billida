<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
	<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
	<link href="${contextPath}/resources/css/reviewCss/reviewList.css" rel='stylesheet' type='text/css' />
	<link href="${contextPath}/resources/css/reviewCss/paging.css" rel='stylesheet' type='text/css' />
	<link href="${contextPath}/resources/css/modal.css" rel='stylesheet' type='text/css' />
</head>
<body id="body-pd">
<div class="common_div">
	<div class="review_wrapper">
	<h1 class="title">내가 작성한 리뷰</h1>
		<ul class="review_list">
			<c:if test="${empty list}">
				<div class="no_search">작성한 리뷰가 없습니다.</div>
			</c:if>
		
			<c:forEach items="${list}" var="reviews" varStatus="status">
				<li class="review_area">
					<div class="reviewImg"><img class="reviewImg img${status.index}" src="${reviews.lockerImage}"></div>
						<div class="review_box">
							<div class="nameNick">
								<span class="review_name">${reviews.lockerTitle}</span>
								<span class="review_nick"> [판매자] ${reviews.nick}</span>
							</div>
							<div class="review_info">
								<div class="starRev">
									<span class="star">
									★★★★★
										<c:choose>
											<c:when test="${reviews.score eq '0.5'}"><span id="star" style="width: 10%">★★★★★</span></c:when>
											<c:when test="${reviews.score eq '1'}"><span id="star" style="width: 20%">★★★★★</span></c:when>
											<c:when test="${reviews.score eq '1.5'}"><span id="star" style="width: 30%">★★★★★</span></c:when>
											<c:when test="${reviews.score eq '2'}"><span id="star" style="width: 40%">★★★★★</span></c:when>
											<c:when test="${reviews.score eq '2.5'}"><span id="star" style="width: 50%">★★★★★</span></c:when>
											<c:when test="${reviews.score eq '3'}"><span id="star" style="width: 60%">★★★★★</span></c:when>
											<c:when test="${reviews.score eq '3.5'}"><span id="star" style="width: 70%">★★★★★</span></c:when>
											<c:when test="${reviews.score eq '4'}"><span id="star" style="width: 80%">★★★★★</span></c:when>
											<c:when test="${reviews.score eq '4.5'}"><span id="star" style="width: 90%">★★★★★</span></c:when>
											<c:when test="${reviews.score eq '5'}"><span id="star" style="width: 100%">★★★★★</span></c:when>
										</c:choose>
									</span>
								</div>		
								<span class="review_content">${reviews.content}</span>
							</div>
						</div>
					<div class="review_date">${reviews.updateDate}</div>
					<div class="button_box">
						<a type="button" class="modifyBtn" onclick='openReviewForm(${reviews.reviewNum})'><i class="fas fa-eraser"></i> 수정</a>
						<a type="button" class="deleteBtn" onclick='openModal(${reviews.reviewNum})'><i class="fas fa-trash-alt"></i> 삭제</a>
					</div>
				</li>
				<hr>
			</c:forEach>
		</ul>
		
		
		<div id="modal" class="modal-overlay">
	        <div class="modal-window">
	        	<div class="close-area"><a id="xTitle">X</a></div>
	            <div class="content">
	                <p>리뷰를 삭제하시겠습니까?</p>
	                <div class="button_area">
	                	<a type="button" id="deleteYes">삭제</a>
	                	<a type="button" id="deleteNo">취소</a>
	                	<input type="hidden" name="reviewNum" id="reviewNum" value="">
	                </div>
	            </div>
	        </div>
	    </div>
		
		
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
<script type="text/javascript" src="${contextPath}/resources/js/review/review-list.js"></script>

<script type="text/javascript">

var list = new Array();
var clobList = new Array();

<c:forEach var="lockerImg" items="${list}" varStatus="status">
	list.push("${lockerImg.lockerImage}");
	clobList.push("${lockerImg.imgToClob}");
</c:forEach>

</script>
<script type="text/javascript" src="${contextPath}/resources/js/review/imageEncoding.js"></script>

</body>
</html>