<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
	<link href="${contextPath}/resources/css/reviewCss/rentList.css" rel='stylesheet' type='text/css' />
	<link href="${contextPath}/resources/css/reviewCss/paging.css" rel='stylesheet' type='text/css' />
</head>
<body>
<div class="rent_wrapper">
<h1 class="title">내가 등록한 사물함</h1>
	<div class="rent_list">
		<c:forEach items="${lockerList}" var="lockers">
			<div class="rent_area">
				<div class="rentImg"><img class="rentImgs" src="${lockers.LOCKER_IMAGE}"></div>
				<div class="locker1">
					<div class="rent_name"><a class="afont"> - 사물함명 :&nbsp;</a>${lockers.LOCKER_TITLE}</div>
					<div class="rent_location"><a class="afont"> - 주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 : </a>${lockers.LOCKER_CONTENT}</div>
					<div class="rent_password"><a class="afont"> - 비밀번호 :&nbsp;</a>${lockers.LOCKER_PASSWORD}</div>
				</div>
				<div class="locker2">
					<div class="rent_start"><a class="afont"> - 임대시작일 : </a>${lockers.RENTABLE_DATE_START}</div>
					<div class="rent_end"><a class="afont"> - 임대종료일 : </a>${lockers.RENTABLE_DATE_END}</div>
					<div class="rent_profit"><a class="afont"> - 수&nbsp;&nbsp;&nbsp;&nbsp;익&nbsp;&nbsp;&nbsp;&nbsp;금 : </a>${lockers.PROFIT}원</div>
				</div>
				<div class="button_box">
					<a type="button" class="modifyBtn" href="#"><i class="fas fa-eraser"></i> 정보수정</a>
					<a type="button" class="deleteBtn" href="/review/locker-reviews?lockerId=${lockers.LOCKER_ID}"><i class="fas fa-list"></i> 리뷰확인</a>
				</div>
			</div>
			<hr>
		</c:forEach>
		
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
     moveForm.attr("action", "myLocker-list");
     moveForm.submit();
});

	let openReviewForm = (historyIndex) =>{
		console.log(historyIndex);
	    let reviewForm = createPopup({
	                url:'review-form?historyIndex='+historyIndex,
	                name:'',
	                width:522,
	                height:600
	             });
	 }


</script>

</body>
</html>