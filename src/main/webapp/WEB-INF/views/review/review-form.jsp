<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${contextPath}/resources/css/all.css">
	<script type="text/javascript" src="${contextPath}/resources/js/webUtil.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/urlEncoder.js"></script>
	<link href="${contextPath}/resources/css/reviewCss/reviewForm.css" rel='stylesheet' type='text/css' />
	<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
</head>
<body>

<div class="review_wrap">
	<a class="review_title">
		별점과 리뷰를 남겨주세요.
	</a>
		<div class="form_area">
			<form:form modelAttribute="review" action="/review/upload-review" method="post" id="frm_review" name="frm_review">
				<div class="review_area">
					<div class="reviewImg"><img class="reviewImg imgs" src="${list.lockerImage}"></div>
					<div class="review_info">
						<span class="locker_title">- 보관함명 : ${list.lockerTitle}</span>
						<span class="rent_start">- 대여날짜 : ${list.rentStart}</span>
						<span class="rent_end">- 반납날짜 : ${list.rentEnd}</span>
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
		            <div id="counter">(0 / 최대 100자)</div>
		            <div class="content_msg"> </div>
		        </div>   
		        <div class="cmd">
		            <div class="saveDiv"><input type="submit" class="save" name="save" value="등록"></div>
		            <a class="cancelDiv" onclick='window.close()'><input type="button" class="cancel" name="cancel" value="취소"></a>
		        </div>
			</form:form>
		</div>
</div>

<script type="text/javascript" src="${contextPath}/resources/js/review/review-form.js"></script>
<script type="text/javascript">

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


lockerImage = "${list.lockerImage}";
if(lockerImage == "0"){
	const contentType = 'image/png';
	
	const base64 = "${list.imgToClob}";
	
	const blob = b64toBlob(base64, contentType);

	const blobUrl = URL.createObjectURL(blob);	
	
	document.querySelector(".imgs").src = blobUrl;
}

</script>


</body>
</html>