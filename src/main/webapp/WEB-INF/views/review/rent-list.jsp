<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript" src='../../../resources/js/jquery.js'></script>

<style type="text/css">
.title{
	display: flex;
	justify-content: center;
	width: 100%;
	font-size: 20px;
	font-weight: bolder;
	padding-top: 30px;
	padding-bottom: 25px;
}

.rent_list{
	display: flex;
	flex-direction: column;
	width: 60%;
}

.rent_area{
	display: flex;
	flex-direction: row;
	align-items: center;
	width: 100%;
	height: 165px;
	color: #494949;
}

.rentImg, .rentImgs{
	height: 150px;
	width: 150px;
}

.rent_info{
	display: flex;
	flex-direction: column;
	font-size: 15px;
	padding-left: 30px;
	width: 60%;
}

.rent_name {
    display: flex;
    justify-content: flex-start;
    font-size: 100%;
    padding-top: 3px;
    padding-bottom: 7px;
}

.rent_start {
    position: relative;
    padding-bottom: 7px;
}

.rent_end {
    position: relative;
}

.reviewButton{
	display: flex;
	padding-left: 50px;
}

hr{
	margin: 0;
	width: 100%;
	border-left: hidden;
}

.pageInfo {
	list-style: none;
	display: inline-block;
}

.pageInfo li {
	display:flex;
	justify-content: center;
	float: left;
	font-size: 15px;
	padding: 8px 16px;
	border-radius: 35%;
	width: 8px;
	cursor: pointer;
}

.pageInfo li.active{
	background-color: orange;
	color: white;
}

.pageInfo li:hover:not(.active){
	background-color: silver;
}

li:link {
	color: black;
	text-decoration: none;
}

li:visited {
	color: black;
	text-decoration: none;
}

.active {
	background-color: #cdd5ec;
}

.pageInfo_wrap {
	display: flex;
	justify-content: center;
}

.pageInfo_area {
	padding-top: 30px;
	padding-bottom: 10px;
	
}


</style>

</head>
<body>
<div class="content">
<h1 class="title">사물함 대여 현황</h1>
	<div class="rent_list list1">
		<c:forEach items="${list}" var="rents">
			<div class="rent_area">
				<div class="rentImg"><img class="rentImgs" src="${rents.lockerImage}"></div>
				<div class="rent_info">
					<div class="rent_name"> - 사물함명 : ${rents.lockerTitle}</div>
					<div class="rent_start"> - 대여날짜 : ${rents.rentStart}</div>
					<div class="rent_end">- 반납날짜 : ${rents.rentEnd}</div>
				</div>
				<div class="reviewButton"><button onclick='openReviewForm(${rents.historyIndex})'>리뷰작성</button></div>
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