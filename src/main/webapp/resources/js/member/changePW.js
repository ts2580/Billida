	(()=>{
		
		document.querySelector('#changePW').addEventListener('submit', e => {
		let pwReg = /(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9])(?=.{8,})/;
		if(!pwReg.test(password.value)){
   				e.preventDefault();
				//alert("비밀번호는 숫자, 영문자, 특수문자 조합의 \n 8자리 이상 문자열입니다.");
   				document.querySelector('#pwCheck').innerHTML = '비밀번호는 숫자, 영문자, 특수문자 조합의 8자리 이상 문자열입니다.';
   			}
   			if(password.value != passwordCheck.value){
				e.preventDefault();
				document.querySelector('#passwordFail').innerHTML = '비밀번호가 일치하지 않습니다.';
			}
   			})
   			
	})();