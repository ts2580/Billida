   		 
		/*   		
		1. 이미 존재하는 아이디로 사용자가 가입하려는 경우
   		2. 비밀번호는 영어, 숫자, 특수문자 조합의 8자리 이상의 문자열
   		3. 전화번호는 숫자로만 입력
		*/
   		 
   		
	/* 즉시 실행함수로 넣어주면 전역 안에 포함이 안되기 때문에 외부에서의 접근을 막아줄 수 있다 */
   	(()=>{

   		document.querySelector('#kakaoPhoneChange').addEventListener('submit', e => {
   			
   		
   			let phoneReg = /^\d{9,11}$/;
   			if(!phoneReg.test(phone.value)){
   				e.preventDefault();
   				document.querySelector('#phoneCheck').innerHTML = '휴대폰 번호는 9~11자리의 숫자입니다.';
   			}
   			
   		})
   	
   	})();