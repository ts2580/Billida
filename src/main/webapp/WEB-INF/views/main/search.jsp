<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<link href="../../../resources/css/search.css" rel='stylesheet' type='text/css' />
	<script type="text/javascript" src='../../../resources/js/jquery.js'></script>

</head>
<body>
<div class="content">
	<div class="wrapper">
		<div class="locker_list">
			<c:forEach items="${list}" var="lockerList">
				<div class="locker_area">
					<img class="mainImg" src="${lockerList.lockerImage}">
					<div class="locker_name">${lockerList.lockerTitle}</div>
					<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${lockerList.lockerContent}</div>
					<div class="locker_info">
						<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 :~ ${lockerList.rentableDate}</span> 
						<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${lockerList.lockerSize}</span>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
					<!-- 이전페이지 버튼 -->
                	<c:if test="${paging.prev}">
                    	<li class="pageInfo_btn previous"><a href="${paging.startPage-1}">Previous</a></li>
                	</c:if>
				
					<!-- 각 번호 페이지 버튼  -->
					<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						<li class="pageInfo_btn ${paging.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
					</c:forEach>
					
					<!-- 다음페이지 버튼 -->
                	<c:if test="${paging.next}">
                    	<li class="pageInfo_btn next"><a href="${paging.endPage + 1 }">Next</a></li>
                	</c:if>
				</ul>
			</div>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
			<input type="hidden" name="amount" value="${paging.cri.amount}">
			<input type="hidden" name="keyword" value="${paging.cri.keyword}">
		</form>

	</div>
</div>


<script type="text/javascript">

	let moveForm = $("#moveForm");
	
	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
		moveForm.attr("action", "");
		moveForm.submit();
	});
	
	$(".pageInfo a").on("click", function(e){
		 e.preventDefault();
	     moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	     moveForm.attr("action", "/search");
	     moveForm.submit();
	});

	$(".search_area").on("click", function(e){
        e.preventDefault();
        let val = $("input[name='keyword']").val();
        moveForm.find("input[name='keyword']").val(val);
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
    });

</script>






</body>
</html>