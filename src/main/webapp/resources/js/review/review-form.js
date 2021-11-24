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