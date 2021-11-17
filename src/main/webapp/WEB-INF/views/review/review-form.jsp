<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link href="../../../resources/css/reviewForm.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src='../../../resources/js/jquery.js'></script>
</head>
<body>

<div class="review_wrap">
	<a class="review_title">리뷰등록</a>
	<a class="review_info">별점과 리뷰를 남겨주세요.</a>
		<div>
			<form:form modelAttribute="review" action="/review/upload-review" method="post" id="frm_review" enctype="multipart/form-data">
				<div>
					<div><img class="reviewImg" src="${reviewInfo.lockerImage}"></div>
					<div>
						<span>- 사물함명 : ${reviewInfo.lockerTitle}</span>
						<span>- 대여날짜 : ${reviewInfo.rentStart}</span>
						<span>- 반납날짜 : ${reviewInfo.rentEnd}</span>
					</div>
				</div>
				<div class="score_msg"> </div>
				<div class="starRev">
	 				<span class="star R1"><input type="hidden" id="rating0" value="0.5"/>0.5</span>
					<span class="star R2"><input type="hidden" id="rating1" value="1.0"/>1</span>
					<span class="star R1"><input type="hidden" id="rating2" value="1.5"/>1.5</span>
					<span class="star R2"><input type="hidden" id="rating3" value="2.0"/>2.0</span>
					<span class="star R1"><input type="hidden" id="rating4" value="2.5"/>2.5</span>
					<span class="star R2"><input type="hidden" id="rating5" value="3.0"/>3.0</span>
					<span class="star R1"><input type="hidden" id="rating6" value="3.5"/>3.5</span>
					<span class="star R2"><input type="hidden" id="rating7" value="4.0"/>4.0</span>
					<span class="star R1"><input type="hidden" id="rating8" value="4.5"/>4.5</span>
					<span class="star R2"><input type="hidden" id="rating9" value="5.0"/>5.0</span>
					<input type="hidden" name="score" id="score" value="" />
				</div>
				<div class="review_contents">
	            	<div class="content_msg"> </div>
		            	<textarea name="content" id="content" rows="10" class="review_textarea"></textarea>
		        	</div>   
		        <div class="cmd">
		            <input type="submit" name="save" id="save" value="등록">
		        </div>
			</form:form>
		</div>
		
		
		
		
		
		
</div>

<script type="text/javascript">

(function () {
    var starEls = document.querySelectorAll('.starRev span.star');
    var rate = 0;
    document.getElementById("score").value = '0'; /* 별점 0으로 기본셋팅 */
    
    loop(starEls, function (el, index) {
        el.addEventListener('click', function () {
            rating(index + 1);
            rate = document.getElementById("rating"+index).value;
            document.getElementById("score").value = rate;  /* 히든인풋에 값 넣어주기 */
           
        });
    });

    function loop(list, func) {
        Array.prototype.forEach.call(list, func);
    }

    function rating(starScore) {
        loop(starEls, function (el, index) {
            if (index < starScore) {
                el.classList.add('on');
            } else {
                el.classList.remove('on');
            }
        });
    }
    
document.querySelector('#frm_review').addEventListener('submit', e => {
		console.log(content.value);	
	
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
})
    
    
    
})();



</script>













</body>
</html>