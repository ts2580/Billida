<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${contextPath}/resources/css/search.css" rel='stylesheet' type='text/css' />
	<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
	<link href="${contextPath}/resources/css/reviewCss/paging.css" rel='stylesheet' type='text/css' />
</head>
<body>
<div class="content">
	<div class="searchInfo">
		<a class="keywordInfo">${paging.cri.keyword} </a> (으)로 검색한 결과입니다.
	</div>
	<hr>
	
	<div class="wrapper">
		<div class="locker_list">
			<c:if test="${empty list}">
			<div class="no_search">검색 결과가 없습니다.
			<br>
		 	다른 검색어로 보관함을 찾아보세요.
			</div>
			</c:if>
			
			<c:forEach items="${list}" var="lockerList" varStatus="status">
				<div class="locker_area">
					<div class="lockerImg" ><img class="imgs img${status.index}" src="${lockerList.lockerImage}"></div>
					<div class="locker_name">${lockerList.lockerTitle}</div>
					<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${lockerList.lockerContent}</div>
					<div class="locker_info">
						<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 : ~ ${lockerList.rentableDateEnd}</span> 
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
			<input type="hidden" name="keyword" value="${paging.cri.keyword}">
		</form>

	</div>
</div>


<script type="text/javascript">

	let moveForm = $("#moveForm");
	
	$(".pageInfo li").on("click", function(e){
		 e.preventDefault();
	     moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	     moveForm.attr("action", "/search");
	     moveForm.submit();
	});
	

	let lockerImage = null;
	
	const b64toBlob = (b64Data, contentType='', sliceSize=512) => {
		  const byteCharacters = atob(b64Data);
		  const byteArrays = [];

		  for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
		    const slice = byteCharacters.slice(offset, offset + sliceSize);

		    const byteNumbers = new Array(slice.length);
		    for (let i = 0; i < slice.length; i++) {
		      byteNumbers[i] = slice.charCodeAt(i);
		    }

		    const byteArray = new Uint8Array(byteNumbers);
		    byteArrays.push(byteArray);
		  }

		  const blob = new Blob(byteArrays, {type: contentType});
		  return blob;
	}
	
	<c:forEach var="lockerImg" items="${list}" varStatus="status">
		lockerImage =  "${lockerImg.lockerImage}";
		if(lockerImage == "0"){
			const contentType = 'image/png';
			
			const base64 = "${lockerImg.imgToClob}";

			const blob = b64toBlob(base64, contentType);
			
			const blobUrl = URL.createObjectURL(blob);	
			console.log(blobUrl);
			document.querySelector(".img${status.index}").src = blobUrl;
		}
	</c:forEach>
	
	

</script>






</body>
</html>