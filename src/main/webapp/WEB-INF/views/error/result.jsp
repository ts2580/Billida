<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
	<link href="${contextPath}/resources/css/modal.css" rel='stylesheet' type='text/css' />
</head>
<body>
	<%--
	 <div class="top_div">
		<div class="modal_wrapper">
			<c:if test="${msg eq '접근 권한이 없는 페이지 입니다.'}"> 
				<div id="modal" class="modal-overlay">
			        <div class="modal-window">
			        	<div class="close-area"><a id="xTitle">X</a></div>
			            <div class="content">
			                <p>로그인 후 이용 가능합니다.</p>
			                <div class="button_area">
			                	<a type="button" id="deleteYes">Login</a>
			                	<a type="button" id="deleteNo">Home</a>
			                	<input type="hidden" name="reviewNum" id="reviewNum" value="">
			                </div>
			            </div>
			        </div>
			    </div>
			</c:if>
		</div>
	</div>    
	--%>
	
	
<script type="text/javascript">

<%--
	(function () {
		const modal = document.getElementById("modal");
		modal.style.display = "flex"
	})();
	
	$(function(){
		$('#modal').draggable();
	});
	 
	/* 모달 관련 js */
	const modal = document.getElementById("modal");
	/* 삭제버튼 클릭 시 모달 보여지도록 */
	let openModal = (reviewNum) => {
		modal.style.display = "flex"
		document.getElementById("reviewNum").value = reviewNum;
	}

	/* 모달창에서 삭제버튼 클릭 시 href이동시켜 삭제처리 후 모달 none */
	document.getElementById("deleteYes").addEventListener("click", e => {
			location.href = '/member/login';
			modal.style.display = "none";
	})

	/* 모달창에서 취소버튼 클릭 시 아무처리도 되지 않고 모달 none */
	document.getElementById("deleteNo").addEventListener("click", e => {
		location.href = '/';
		modal.style.display = "none";
	})

	/* 모달창의 x 클릭 시 모달 none */
	const closeBtn = modal.querySelector("#xTitle")
	closeBtn.addEventListener("click", e => {
		location.href = '/';
	    modal.style.display = "none"
	})

	--%>
	
	
	<%-- 브라우저 응답 처리 --%>

	/* 안내창 출력 */
	<c:if test="${not empty msg}">  /* msg가 존재한다면 실행 */
		alert("${msg}");
	</c:if>
	
	/* 뒤로가기 */
	<c:if test="${not empty back}">
		history.back();
	</c:if>
	
	/* 페이지 이동 */
	<c:if test="${not empty url}">
		location.href="${url}";
	</c:if>
	
	
	</script>

</body>
</html>