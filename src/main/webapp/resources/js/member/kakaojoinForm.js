   		 
		/*   		
		1. 이미 존재하는 아이디로 사용자가 가입하려는 경우
   		2. 비밀번호는 영어, 숫자, 특수문자 조합의 8자리 이상의 문자열
   		3. 전화번호는 숫자로만 입력
		*/
   		 
   		
	/* 즉시 실행함수로 넣어주면 전역 안에 포함이 안되기 때문에 외부에서의 접근을 막아줄 수 있다 */
   	(()=>{
   		let confirmNick = '';
   		let nickReg = /[a-zA-Z0-9가-힣]{2,10}/;
   		
		document.querySelector("#btnNickCheck").addEventListener('click', e => {
   			let nickName = nick.value;
   			
   			if(nickName){
				if(!nickReg.test(nick.value)){
					e.preventDefault();
					alert("닉네임은 2글자 이상의 문자열입니다.");
					document.querySelector('#nickCheck').innerHTML = '닉네임은 2글자 이상의 문자열입니다.';
				} else{
					fetch('/member/nick-check?nick=' + nickName)
   					.then(response => {
						if(!response.ok)
							throw new Error(`${response.statusText} : ${response.status}`);
							return response.text();
					}).then(text => {
   						if(text == 'available'){
   							document.querySelector('#nickCheck').innerHTML = '사용 가능한 닉네임 입니다.';
   							confirmNick = nickName;
   						}else if(text == 'disable'){
   							document.querySelector('#nickCheck').innerHTML = '이미 존재하는 닉네임 입니다.';
   						}
   					}).catch(error => {
						document.querySelector('#nickCheck').innerHTML = error;
					})	
				}
			}
   		})
   		document.querySelector('#kakaosignUp').addEventListener('submit', e => {
   			
   			let phoneReg = /^\d{9,11}$/;
			
   			if(!phoneReg.test(phone.value)){
   				e.preventDefault();
   				document.querySelector('#phoneCheck').innerHTML = '휴대폰 번호는 9~11자리의 숫자입니다.';
   			}
   			
   			if(confirmNick != nick.value){
   				e.preventDefault();
   				document.querySelector('#nickCheck').innerHTML = '닉네임 중복 검사를 통과하지 않았습니다.';
   			}
   			
   		})
   	
   	})();