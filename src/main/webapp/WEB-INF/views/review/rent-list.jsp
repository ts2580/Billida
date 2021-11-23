<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript" src='../../../resources/js/jquery.js'></script>
	<link href="../../../resources/css/reviewCss/rentList.css" rel='stylesheet' type='text/css' />
	<link href="../../../resources/css/reviewCss/paging.css" rel='stylesheet' type='text/css' />
	
</head>
<body>
<div class="rent_wrapper">
<h1 class="title">사물함 대여 현황</h1>
	<div class="rent_list">
		<c:forEach items="${list}" var="rents">
			<div class="rent_area">
				<div class="rentImg"><img class="rentImgs" src="${rents.lockerImage}"></div>
				<div class="rent_info">
					<div class="rent_name"> - 사물함명 : ${rents.lockerTitle}</div>
					<div class="rent_start"> - 대여날짜 : ${rents.rentStart}</div>
					<div class="rent_end">- 반납날짜 : ${rents.rentEnd}</div>
				</div>
				<c:if test="${rents.reviewYn == 'Y'}">
					<div class="reviewButton">
						<a type="button" class="reviewWrite"><i class="far fa-check-square"></i> 리뷰완료</a>
					</div>
				</c:if>	
				<c:if test="${rents.reviewYn == 'N'}">
					<div class="reviewButton">
						<a type="button" class="reviewWrite" onclick='openReviewForm(${rents.historyIndex})'><i class="fas fa-edit"></i> 리뷰작성</a>
					</div>
				</c:if>
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
<!--"location.href='review-form?historyIndex=${rents.historyIndex}'"  -->
</div>

<script type="text/javascript">

let moveForm = $("#moveForm");

$(".pageInfo li").on("click", function(e){
	 e.preventDefault();
     moveForm.find("input[name='pageNum']").val($(this).attr("href"));
     moveForm.attr("action", "rent-list");
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