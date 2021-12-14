   		 
		/*   		
		1. 이미 존재하는 아이디로 사용자가 가입하려는 경우
   		2. 비밀번호는 영어, 숫자, 특수문자 조합의 8자리 이상의 문자열
   		3. 전화번호는 숫자로만 입력
		*/
   		 
   		
	/* 즉시 실행함수로 넣어주면 전역 안에 포함이 안되기 때문에 외부에서의 접근을 막아줄 수 있다 */
   	(()=>{
		let confirmId = '';
   		//영문소문자 또는 영문소문자+숫자,5-11글자
		let idReg =/^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/;

   		document.querySelector("#btnIdCheck").addEventListener('click', e => {
   			
   			/*id 속성값이 지정되어 있으면 id값으로 해당 요소객체 호출 가능*/
   			let Id = id.value;
   			
			/*우리 서버에 요청을 보내서 사용자가 입력한 아이디가 있는지 없는지 확인해야 하니까 우리서버와 통신이 발생해야 함 => fetch 사용*/
   			if(Id){ /*userId가 null이 아니라면*/
				if(!idReg.test(id.value)){
					e.preventDefault();
					document.querySelector('#idCheck').innerHTML = '아이디는 영문소문자 또는 영문소문자+숫자로 이루어진 5-11글자 입니다.';
				}else{
					fetch('/member/id-check?id=' + Id)
   					.then(response => {
						if(!response.ok)
						throw new Error(`${response.statusText} : ${response.status}`);
						return response.text();
					}).then(text => {
						//console.dir(text);	
   						if(text == 'available'){
							/*alert("사용 가능한 아이디 입니다.");*/
   							document.querySelector('#idCheck').innerHTML = '사용 가능한 아이디 입니다.';
   							confirmId = Id;
   						}else if(text == 'disable'){
							/*alert("이미 존재하는 아이디 입니다.");*/
   							document.querySelector('#idCheck').innerHTML = '이미 존재하는 아이디 입니다.';
   						}
   					}).catch(error => {
						document.querySelector('#idCheck').innerHTML = error; //에러가 발생할 경우 에러 찍어주기
					})	
				}
   			}
   		})
					
			
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
		let confirmEmail = '';
		let emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
   		document.querySelector("#btnEmailCheck").addEventListener('click', e => {
   			let emailAddress = email.value;
   			if(emailAddress){
					if(!emailReg.test(email.value)){
					e.preventDefault();
					document.querySelector('#emailCheck').innerHTML = '이메일을 확인해주세요.';
				}else{
   				fetch('/member/email-check?email=' + emailAddress)
   				.then(response => {
					if(!response.ok)
						throw new Error(`${response.statusText} : ${response.status}`);
						return response.text();
				}).then(text => {	
   					if(text == 'available'){
   						document.querySelector('#emailCheck').innerHTML = '사용 가능한 이메일 입니다.';
   						confirmEmail = emailAddress;
   					}else if(text == 'disable'){
   						document.querySelector('#emailCheck').innerHTML = '이미 가입된 이메일 입니다.';
   					}
   				}).catch(error => {
					document.querySelector('#emailCheck').innerHTML = error;
				})
   			} 
   		  }
   		})		
   				
   		
   		document.querySelector('#signUp').addEventListener('submit', e => {
   			
   			let pwReg = /(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9])(?=.{8,})/;
   			let phoneReg = /^\d{9,11}$/;
			
   			if(confirmId != id.value){
   				e.preventDefault();
   				document.querySelector('#idCheck').innerHTML = '아이디 중복 검사를 통과하지 않았습니다.';
   			}
			if(confirmEmail != email.value){
   				e.preventDefault();
   				document.querySelector('#emailCheck').innerHTML = '이메일 중복 검사를 통과하지 않았습니다.';
   			}
   			if(!pwReg.test(password.value)){
   				e.preventDefault();
				//alert("비밀번호는 숫자, 영문자, 특수문자 조합의 \n 8자리 이상 문자열입니다.");
   				document.querySelector('#pwCheck').innerHTML = '비밀번호는 숫자, 영문자, 특수문자 조합의 8자리 이상 문자열입니다.';
   			}
   			
   			if(password.value != passwordCheck.value){
				e.preventDefault();
				document.querySelector('#passwordFail').innerHTML = '비밀번호가 일치하지 않습니다.';
			}

			if(confirmNick != nick.value){
   				e.preventDefault();
				//alert("닉네임 중복 검사를 통과하지 않았습니다.");
   				document.querySelector('#nickCheck').innerHTML = '닉네임 중복 검사를 통과하지 않았습니다.';
   			}

			
   			if(!phoneReg.test(phone.value)){
   				e.preventDefault();
   				document.querySelector('#phoneCheck').innerHTML = '휴대폰 번호는 9~11자리의 숫자입니다.';
   			}
   			
   			
   			if(confirmId == id.value && emailReg.test(email.value) && pwReg.test(password.value) 
   			&& password.value == passwordCheck.value&& confirmNick == nick.value
   			&& phoneReg.test(phone.value) && confirmEmail == email.value){
				alert("회원가입이 완료되었습니다.");
   			}
   		})
   	})();