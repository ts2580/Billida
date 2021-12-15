<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<h1 class="title">내가 빌린 보관함</h1>
		<div class="rent_list">
			<c:if test="${empty list}">
				<div class="no_search">빌린 보관함이 없습니다.</div>
			</c:if>
		
			<c:forEach items="${list}" var="rents" varStatus="status">
				<div class="rent_area">
					<div class="rentImg"><img class="rentImgs img${status.index}" src="${rents.lockerImage}"></div>
					<div class="rent_info">
						<div class="rent_name"><a class="afont"> - 보관함명 :&nbsp;</a>${rents.lockerTitle}</div>
						<div class="rent_location"><a class="afont"> - 주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 : </a>${rents.lockerContent}</div>
						<div class="rent_password"><a class="afont"> - 비밀번호 :&nbsp;</a>${rents.lockerPassword}</div>
					</div>
					<div class="rent_info2">
						<div class="rent_start"><a class="afont"> - 대여날짜 : </a>${rents.rentStart}</div>
						<div class="rent_end"><a class="afont"> - 반납날짜 : </a>${rents.rentEnd}</div>
						<div class="rent_cost"><a class="afont"> - 대여금액 : </a>${rents.rentCost}원</div>
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
				
					<input type="hidden" id="userName" name="userName" value="${authentication.name}">
					<input type="hidden" id="userEmail" name="userEmail" value="${authentication.email}">
					<input type="hidden" id="userAddress" name="userAddress" value="${authentication.address}">
					<input type="hidden" id="userTell" name="userTell" value="${authentication.phone}">
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

const success = "${success}";

if(success == 'success'){
	alert("보관함 대여가 완료되었습니다. \n이용해주셔서 감사합니다");
}



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