function drawStar(target){
	document.querySelector('.star span').style.width = (target.value * 20)+'%';
};

 (function () {
	 let width = document.querySelector('.star span').style.width;
	 if(width == '10%'){
		 score.value = '0.5';
	 }else if(width == '20%'){
		 score.value = '1';
	 }else if(width == '30%'){
		 score.value = '1.5';
	 }else if(width == '40%'){
		 score.value = '2';
	 }else if(width == '50%'){
		 score.value = '2.5'
	 }else if(width == '60%'){
		 score.value = '3';
	 }else if(width == '70%'){
		 score.value = '3.5';
	 }else if(width == '80%'){
		 score.value = '4';
	 }else if(width == '90%'){
		 score.value = '4.5';
	 }else if(width == '100%'){
		 score.value = '5';
	 }
	 
	let content = $('.review_textarea').val();
	$('#counter').html("(" + content.length + " /최대 100자)"); //글자수 실시간 체크
 
	document.querySelector('#frm_review').addEventListener('submit', e => {

		content = $('.review_textarea').val();
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
			document.frm_review.action='/review/modify-review'
			document.frm_review.submit();
			window.open("about:blank", "_self").close();
		}
})

	$('.review_textarea').keyup(function(e){
		content = $('.review_textarea').val();
		$('#counter').html("(" + content.length + " /최대 100자)"); //글자수 실시간 체크
	
		if(content.length > 100){
			document.querySelector('.content_msg').innerHTML = '내용은 10자 이상 ~ 100자 이하로 작성해주세요.';
			$(this).val(content.substring(0,100));
			$('#counter').html("(100 / 최대 100자)");
		}
	});
    
    
})();