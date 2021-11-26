function drawStar(target){
	document.querySelector('.star span').style.width = (target.value * 20)+'%';
};


let content = $('.review_textarea').val();

$('.review_textarea').keyup(function(e){
	content = $('.review_textarea').val();
	$('#counter').html("(" + content.length + " /최대 100자)"); //글자수 실시간 체크
	
	if(content.length > 100){
		document.querySelector('.content_msg').innerHTML = '내용은 10자 이상 ~ 100자 이하로 작성해주세요.';
		$(this).val(content.substring(0,100));
		$('#counter').html("(100 / 최대 100자)");
	}
});


 (function () {
 
	document.querySelector('#frm_review').addEventListener('submit', e => {

		let contentReg = /^.{10,100}$/;
		
		if(!contentReg.test(content)){
			e.preventDefault();
			document.querySelector('.content_msg').style.display = 'flex';
			document.querySelector('.content_msg').innerHTML = '내용은 10자 이상 ~ 100자 이하로 작성해주세요.';
		}else{
			document.querySelector('.content_msg').style.display = 'none';
		}
		
		if(score.value == '0'){
			e.preventDefault();
			document.querySelector('.score_msg').style.display = 'flex';
			document.querySelector('.score_msg').innerHTML = '별점을 선택해주세요.';
		}else{
			document.querySelector('.score_msg').style.display = 'none';
		}
		
 		if(contentReg.test(content) && score.value != '0'){
			opener.name = "reviewPop";
			document.frm_review.target = opener.name;
			document.frm_review.action='/review/upload-review'
			document.frm_review.submit();
			window.open("about:blank", "_self").close();
		}
	})

})();
