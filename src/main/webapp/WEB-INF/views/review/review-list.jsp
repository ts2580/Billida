<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript" src='../../../resources/js/jquery.js'></script>
	<link href="../../../resources/css/reviewCss/reviewList.css" rel='stylesheet' type='text/css' />
	<link href="../../../resources/css/reviewCss/paging.css" rel='stylesheet' type='text/css' />
<style type="text/css">
	#modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            
        }
        #modal .modal-window {
            background: rgba(251, 168, 116, 0.78);
            box-shadow: 0 8px 32px 0 rgba(243, 173, 130, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 200px;
            position: relative;
            top: -70px;
            padding: 10px;
        }
        
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .title h2 {
            display: inline;
        }
        
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            padding: 0px 10px;
            text-shadow: 1px 1px 2px #5a5a5a;
            color: white;
        }
        
        #deleteYes, #deleteNo{
        	cursor: pointer;
        	width: 60px;
        	height: 30px;
        	display: flex;
        	justify-content: center;
        	border: 1px solid;
    		border-radius: 7px;
        	align-items: center;
        }
        
        #deleteYes{
        	background-color: rgba(249, 131, 57, 0.81);
        }
        
        #deleteYes:hover{
        	background-color: rgba(248, 106, 18, 0.86);
        }

        #deleteNo{
        	background-color: rgba(166, 166, 166, 0.67);
        }
        
        #deleteNo:hover{
        	background-color: rgba(54, 54, 54, 0.75);
        }
        
        .button_area{
         	display: flex;
         	padding-top: 50px;
         	width: 40%;
         	justify-content: space-between;
        }
        
        .content{
        	display: flex;
        	justify-content: center;
        	flex-direction: column;
        	align-items: center;
        	margin-top: 50px;
        }
</style>



</head>
<body>
<div class="review_wrapper">
<h1 class="title">내가 작성한 리뷰</h1>
	<ul class="review_list">
		<c:forEach items="${list}" var="reviews">
			<li class="review_area">
				<div class="reviewImg"><img class="reviewImg" src="${reviews.LOCKER_IMAGE}"></div>
					<div class="review_box">
						<div class="nameNick">
							<span class="review_name">${reviews.LOCKER_TITLE}</span>
							<span class="review_nick"> [판매자] ${reviews.NICK}</span>
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
				<div class="review_date">${reviews.CREATE_DATE}</div>
				<div class="button_box">
					<a type="button" class="modifyBtn" onclick='openReviewForm(${reviews.REVIEW_NUM})'><i class="fas fa-eraser"></i> 수정</a>
					<a type="button" class="deleteBtn" onclick='openModal(${reviews.REVIEW_NUM})'><i class="fas fa-trash-alt"></i> 삭제</a>
				</div>
			</li>
			<hr>
		</c:forEach>
	</ul>
	
	
	<div id="modal" class="modal-overlay">
        <div class="modal-window">
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

<script type="text/javascript">

let moveForm = $("#moveForm");

$(".pageInfo li").on("click", function(e){
	 e.preventDefault();
     moveForm.find("input[name='pageNum']").val($(this).attr("href"));
     moveForm.attr("action", "review-list");
     moveForm.submit();
});

let openReviewForm = (reviewNum) =>{
	console.log(reviewNum);
	let reviewForm = createPopup({
	                url:'review-modifyForm?reviewNum='+reviewNum,
	                name:'',
	                width:522,
	                height:600
	             });
}


const modal = document.getElementById("modal");

let openModal = (reviewNum) => {
	modal.style.display = "flex"
	document.getElementById("reviewNum").value = reviewNum;
	console.log(document.getElementById("reviewNum").value);
}


document.getElementById("deleteYes").addEventListener("click", e => {
		location.href = 'delete-review?reviewNum='+reviewNum.value;
		modal.style.display = "none";
})

document.getElementById("deleteNo").addEventListener("click", e => {
	modal.style.display = "none";
})

modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
    }
})

</script>





</body>
</html>