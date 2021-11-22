<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../../../resources/css/all.css">
	<script type="text/javascript" src="../../../resources/js/webUtil.js"></script>
	<script type="text/javascript" src="../../../resources/js/urlEncoder.js"></script>
	<link href="../../../resources/css/reviewCss/reviewForm.css" rel='stylesheet' type='text/css' />
	<script type="text/javascript" src='../../../resources/js/jquery.js'></script>
</head>
<body>

<div class="review_wrap">
	<a class="review_title">
		별점과 리뷰를 남겨주세요.
	</a>
		<div class="form_area">
			<form:form modelAttribute="review" action="/review/upload-review" method="post" id="frm_review" name="frm_review">
				<div class="review_area">
					<div class="reviewImg"><img class="reviewImg" src="${reviewInfo.lockerImage}"></div>
					<div class="review_info">
						<span class="locker_title">- 사물함명 : ${reviewInfo.lockerTitle}</span>
						<span class="rent_start">- 대여날짜 : ${reviewInfo.rentStart}</span>
						<span class="rent_end">- 반납날짜 : ${reviewInfo.rentEnd}</span>
					</div>
				</div>
				<div class="starRev">
					<span class="star">
					★★★★★
						<span id="star">★★★★★</span>
						<input type="range" oninput="drawStar(this)" value="0" step="0.5" min="0" max="5" name="score" id="score"/>
					</span>
				</div>
				<div class="score_msg"> </div>
				<div class="review_contents">
		            <textarea name="content" id="content" rows="10" class="review_textarea"></textarea>
		            <div class="content_msg"> </div>
		        </div>   
		        <div class="cmd">
		            <div class="saveDiv"><input type="submit" class="save" name="save" value="등록"></div>
		            <a class="cancelDiv" onclick='window.close()'><input type="button" class="cancel" name="cancel" value="취소"></a>
		        </div>
			</form:form>
		</div>
</div>

<script type="text/javascript">

function drawStar(target){
	document.querySelector('.star span').style.width = (target.value * 20)+'%';
};

 (function () {
 
	document.querySelector('#frm_review').addEventListener('submit', e => {

		let contentReg = /^.{10,100}$/;
		
		if(!contentReg.test(content.value)){
			e.preventDefault();
			document.querySelector('.content_msg').innerHTML = '내용은 10자 이상 ~ 100자 이하로 작성해주세요.';
		}else{
			document.querySelector('.content_msg').style.display = 'none';
		}
		
		if(score.value == '0'){
			e.preventDefault();
			document.querySelector('.score_msg').innerHTML = '별점을 선택해주세요.';
		}else{
			document.querySelector('.score_msg').style.display = 'none';
		}
		
 		if(contentReg.test(content.value) && score.value != '0'){
			opener.name = "reviewPop";
			document.frm_review.target = opener.name;
			document.frm_review.action='/review/upload-review'
			document.frm_review.submit();
			window.open("about:blank", "_self").close();
		}
})

    
    
    
})();



</script>













</body>
</html>