<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript" src='../../../resources/js/jquery.js'></script>

<style type="text/css">

.review_wrapper{
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 80px;
}

.title{
	display: flex;
	justify-content: center;
	width: 100%;
	font-size: 20px;
	font-weight: bolder;
	padding-top: 30px;
	padding-bottom: 25px;
}

.review_list{
	display: flex;
	flex-direction: column;
	width: 60%;
}

.review_area{
	display: flex;
	flex-direction: row;
	align-items: center;
	width: 100%;
	height: 165px;
	color: #494949;
}

.reviewImg, .reviewImgs{
	height: 100px;
	width: 100px;
}

.nameNick{
	display: flex;
}

.review_name {
    display: flex;
    justify-content: flex-start;
    font-size: 100%;
    padding-top: 3px;
    padding-bottom: 7px;
}

.review_nick{
	display: flex;
}

.review_info{
	display: flex;
}

.review_score{
	display: flex;
}

.review_content{
	display: flex;
}

.review_date{
	display: flex;
}

.review_modify{
	display: flex;
	padding-left: 50px;
}

.review_delete{
	display: flex;
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
<div class="review_wrapper">
<h1 class="title">내가 작성한 리뷰</h1>
	<ul class="review_list">
		<c:forEach items="${list}" var="reviews">
			<li class="review_area">
				<div class="reviewImg"><img class="reviewImg" src="${reviews.LOCKER_IMAGE}">사진</div>
				<div class="nameNick">
					<div class="review_name">- 사물함명 : ${reviews.LOCKER_TITLE}</div>
					<div class="review_nick">- 사물함 대여자 : ${reviews.NICK}</div>
				</div>
				<div class="review_info">
					<div class="review_score">${reviews.SCORE}</div>
					<div class="review_content">${reviews.CONTENT}</div>
				</div>
				<div class="review_date">${reviews.CREATE_DATE}</div>
				<div>
					<div class="review_modify"><button onclick='openReviewForm(${reviews.HISTORY_INDEX})'>수정하기</button></div>
					<div class="review_delete"><button type="button">삭제</button></div>
				</div>
			</li>
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

<script type="text/javascript">

let moveForm = $("#moveForm");

$(".pageInfo li").on("click", function(e){
	 e.preventDefault();
     moveForm.find("input[name='pageNum']").val($(this).attr("href"));
     moveForm.attr("action", "review-list");
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