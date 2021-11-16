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
			<form:form modelAttribute="reviewForm" action="/review/review-form" method="post" id="frm_review">
				<div>
					<div>사물함이미지</div>
					<div>
						<span>- 사물함명 : </span>
						<span>- 대여날짜 : </span>
						<span>- 반납날짜 : </span>
					</div>
				</div>
				<div>만족도 체크</div>
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
					<input type="hidden" name="starScore" id="starScore" value="" />
				</div>
				<div class="review_contents">
	            	<div class="warning_msg">20자 이상으로 작성해 주세요.</div>
		            	<textarea name="content" rows="10" class="review_textarea"></textarea>
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

    loop(starEls, function (el, index) {
        el.addEventListener('click', function () {
            rating(index + 1);
            rate = document.getElementById("rating"+index).value;
            document.getElementById("starScore").value = rate;  /* 히든인풋에 값 넣어주기 */
           
        });
    });

    function loop(list, func) {
        Array.prototype.forEach.call(list, func);
    }

    function rating(score) {
        loop(starEls, function (el, index) {
            if (index < score) {
                el.classList.add('on');
            } else {
                el.classList.remove('on');
            }
        });
    }
})();





/* $('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
 */




//별점 마킹 모듈 프로토타입으로 생성
/* function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        } else if(newrate == 0 && item.checked == true){
        	item.checked = false;
        } else{
            item.checked = false;
        }
    });
}

let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});

//상품평 작성 글자수 초과 체크 이벤트 리스너
document.querySelector('.review_textarea').addEventListener('keydown',function(){
    //리뷰 400자 초과 안되게 자동 자름
    let review = document.querySelector('.review_textarea');
    let lengthCheckEx = /^.{400,}$/;
    if(lengthCheckEx.test(review.value)){
        //400자 초과 컷
        review.value = review.value.substr(0,400);
    }
});

//저장 전송전 필드 체크 이벤트 리스너
document.querySelector('#save').addEventListener('click', function(e){
    //별점 선택 안했으면 메시지 표시
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
    //리뷰 5자 미만이면 메시지 표시
    if(document.querySelector('.review_textarea').value.length < 5){
        rating.showMessage('review');
        return false;
    }
    //폼 서밋
});


Rating.prototype.showMessage = function(type){//경고메시지 표시
    switch(type){
        case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //안내메시지 표시
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
} */

</script>













</body>
</html>