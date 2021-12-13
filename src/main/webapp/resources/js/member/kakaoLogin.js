 // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('b3d2bd52763449a074cc0c982030b6bf');
// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());

function loginWithKakao(){
	Kakao.Auth.login({	 
		success: function(authObj) {
			Kakao.Auth.setAccessToken(authObj.access_token);
			console.log(authObj);
			//로그인 성공시, API 호출
			Kakao.API.request({
				url: '/v2/user/me', //사용자 정보를 읽어들이는 고정된 url
				success: function(res) {
				
				const id = res.id;		
				document.getElementById('kakaoId').value = id;
				document.kakaologin_frm.submit();
				//location.href="/";
				}
			})
		},
		fail: function(err) {
			alert(JSON.stringify(err));
		}
	});
}

function unlinkApp() {
	Kakao.API.request({
		url: '/v1/user/unlink',
		success: function(response) {
			console.log(response);
			alert("카카오 계정 연결이 끊겼습니다.");
			location.href="/member/delete";
      	},
		fail: function(error) {
    		console.log(error);
        	alert('fail: ' + JSON.stringify(error));
      	},
    });
}

function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
      alert('Not logged in.');
      return;
    }
    Kakao.Auth.logout(function() {
      alert('로그아웃 완료!');
      location.href="/member/logout";
	})
 }