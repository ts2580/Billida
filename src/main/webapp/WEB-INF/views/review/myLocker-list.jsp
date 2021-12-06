<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
	<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
	<link href="${contextPath}/resources/css/reviewCss/rentList.css" rel='stylesheet' type='text/css' />
	<link href="${contextPath}/resources/css/reviewCss/paging.css" rel='stylesheet' type='text/css' />
	
</head>
<body id="body-pd">
<div class="common_div">
	<div class="rent_wrapper">
	<h1 class="title">내가 등록한 보관함</h1>
		<div class="rent_list">
			<c:if test="${empty list}">
				<div class="no_search">등록된 보관함이 없습니다.</div>
			</c:if>
		
			<c:forEach items="${list}" var="lockers" varStatus="status">
				<div class="rent_area">
					<div class="rentImg"><img class="rentImgs img${status.index}" src="${lockers.lockerImage}"></div>
					<div class="locker1">
						<div class="rent_name"><a class="afont"> - 보관함명 :&nbsp;</a>${lockers.lockerTitle}</div>
						<div class="rent_location"><a class="afont"> - 주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 : </a>${lockers.lockerContent}</div>
						<div class="rent_password"><a class="afont"> - 비밀번호 :&nbsp;</a>${lockers.lockerPassword}</div>
					</div>
					<div class="locker2">
						<div class="rent_start"><a class="afont"> - 임대시작일 : </a>${lockers.rentableDateStart}</div>
						<div class="rent_end"><a class="afont"> - 임대종료일 : </a>${lockers.rentableDateEnd}</div>
						<div class="rent_profit"><a class="afont"> - 수&nbsp;&nbsp;&nbsp;익&nbsp;&nbsp;&nbsp;금 : </a>${lockers.profit}원</div>
					</div>
					<div class="button_box">
						<a type="button" class="deleteBtn" href="/review/locker-reviews?lockerId=${lockers.lockerId}"><i class="fas fa-list"></i> 리뷰확인</a>
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