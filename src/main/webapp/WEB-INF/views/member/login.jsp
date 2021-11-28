<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE html>
<html>
<head>
<base href="/" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<style type="text/css">
body {
  font-family: "Open Sans", sans-serif;
  height: 100vh;
  background-size: cover;
     min-height: 100vh;
      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

@keyframes spinner {
  0% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(359deg);
  }
}
* {
  box-sizing: border-box;
}

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

.login {
  border-radius: 2px 2px 5px 5px;
  padding: 10px 20px 20px 20px;
  width: 90%;
  max-width: 320px;
  background: #ffffff;
  position: relative;
  padding-bottom: 80px;
  box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.3);
}
.login.loading button {
  max-height: 100%;
  padding-top: 50px;
}
.login.loading button .spinner {
  opacity: 1;
  top: 40%;
}
.login.ok button {
  background-color: #8bc34a;
}
.login.ok button .spinner {
  border-radius: 0;
  border-top-color: transparent;
  border-right-color: transparent;
  height: 20px;
  animation: none;
  transform: rotateZ(-45deg);
}
.login input {
  display: block;
  padding: 15px 10px;
  margin-bottom: 10px;
  width: 100%;
  border: 1px solid #ddd;
  transition: border-width 0.2s ease;
  border-radius: 2px;
  color: #ccc;
}
.login input + i.fa {
  color: #fff;
  font-size: 1em;
  position: absolute;
  margin-top: -47px;
  opacity: 0;
  left: 0;
  transition: all 0.1s ease-in;
}
.login input:focus {
  outline: none;
  color: #444;
  border-color: #2196f3;
  border-left-width: 35px;
}
.login input:focus + i.fa {
  opacity: 1;
  left: 30px;
  transition: all 0.25s ease-out;
}
.login a {
  font-size: 0.8em;
  color: #2196f3;
  text-decoration: none;
}
.login .title {
  color: #444;
  font-size: 1.2em;
  font-weight: bold;
  margin: 10px 0 30px 0;
  border-bottom: 1px solid #eee;
  padding-bottom: 20px;
}
.login button {
  width: 100%;
  height: 100%;
  padding: 10px 10px;
  background: #2196f3;
  color: #fff;
  display: block;
  border: none;
  margin-top: 20px;
  position: absolute;
  left: 0;
  bottom: 0;
  max-height: 60px;
  border: 0px solid rgba(0, 0, 0, 0.1);
  border-radius: 0 0 2px 2px;
  transform: rotateZ(0deg);
  transition: all 0.1s ease-out;
  border-bottom-width: 7px;
}
.login button .spinner {
  display: block;
  width: 40px;
  height: 40px;
  position: absolute;
  border: 4px solid #ffffff;
  border-top-color: rgba(255, 255, 255, 0.3);
  border-radius: 100%;
  left: 50%;
  top: 0;
  opacity: 0;
  margin-left: -20px;
  margin-top: -20px;
  animation: spinner 0.6s infinite linear;
  transition: top 0.3s 0.3s ease, opacity 0.3s 0.3s ease, border-radius 0.3s ease;
  box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.2);
}
.login:not(.loading) button:hover {
  box-shadow: 0px 1px 3px #2196f3;
}
.login:not(.loading) button:focus {
  border-bottom-width: 4px;
}

footer {
  display: block;
  padding-top: 50px;
  text-align: center;
  color: #ddd;
  font-weight: normal;
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.2);
  font-size: 0.8em;
}
footer a,
footer a:link {
  color: #fff;
  text-decoration: none;
}
.valid-msg{
	font-size: 15px;
	color: red;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
  <form action="/member/login" method="post" class="login">
    <p class="title">Log in</p>
	<input name="id" id="id" type="text" placeholder="Username" autofocus/>
    <i class="fa fa-user"></i>
    <input name="password" id="password" type="password" placeholder="Password" />
    <i class="fa fa-key"></i>
    <span class="form-group" style="display: flex;" >
    <img id="captchaImg" title="캡차 이미지" src="/member/captchaImg.do" />
    <div id="captchaAudio" style="display:none;"></div>
    <span style="display: grid; justify-content: space-between; margin-left: 30px;">
        <a onclick="javascript:refreshBtn()" class="refreshBtn">
            <i class="fa fa-refresh fa-2x"></i>
        </a>
        <a onclick="javascript:audio()" class="refreshBtn">
            <i class="fa fa-volume-up fa-2x" aria-hidden="true"></i>
        </a>
    </span>
    </span>
	 <div class="form-group">
        <input type="text" name="answer" id="answer"  class="form-control" placeholder="captcha" />
        <i class="fa fa-lock" aria-hidden="true"></i>
    </div>   
		<c:if test="${not empty message}">
			<span class="valid-msg">${message}</span>
		</c:if>
    <div style="display: grid;">
    <a href="/member/signUp">Sign up</a>
    <span style="display: flex; justify-content: space-between;">
    <a style="margin-top:2px;" href="#">Forgot your id?</a>
    <a style="margin-top:2px;" href="#">Forgot your password?</a>
    </span>
    </div>
    <button>
      <i class="spinner"></i>
      <span class="state">Log in</span>
    </button>
  </form>
  <form:form modelAttribute="joinForm" action="/member/kakaoLogin" name="kakaologin_frm" method="post" class="form-auth-small"  >
								<div class="form-group" id="kakaoLogin">
									<div class="kakaoBtn">
										<!-- 카카오 정보 넣어줄 input 숨김처리로 넣어놓음 -->
										<input type="hidden" name="id" id="kakaoId" />
										<input type="hidden" name="email" id="kakaoEmail" />
										<input type="hidden" name="nick" id="kakaoNick" />
										<input type="hidden" name="kakaonum" id="kakaonum" />
										<a href="javascript:loginWithKakao();" style="display: flex; margin-top: 5px; " id="custom-login-btn">
											<img src="/resources/images/kakao_login_medium_wide.png" />
											<!-- <button class="btn btn-lg kakao">카카오톡 간편 로그인</button> -->
										</a>
									</div>
								</div>
							</form:form>

  <footer><a target="blank" href="http://boudra.me/"></a></footer>
  </p>
</div>
<script type="text/javascript">
function audio(){
    var rand = Math.random();
    var url = '/member/captchaAudio.do';
    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'text',
        data: 'rand=' + rand,
        async: false,
        success: function(resp) {
            var uAgent = navigator.userAgent;
            var soundUrl = '/member/captchaAudio.do?rand=' + rand;
            
            if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
                winPlayer(soundUrl);
            } else if (!!document.createElement('audio').canPlayType) {
                try{
                    new Audio(soundUrl).play();
                } catch(e) {
                    winPlayer(soundUrl);
                }
            }else {
                window.open(soundUrl, '', 'width=1, height=1');
            }
        }    
        
    });
    
}

function refreshBtn(type){
    var rand = Math.random();
    var url = "/member/captchaImg.do?rand=" + rand;
    $('#captchaImg').attr("src", url);
}
function winPlayer(objUrl){
    $('#captchaAudio').html('<vgsound src="' + objUrl + '">');
}
</script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src='/resources/js/member/kakaoLogin.js'></script>
</body>
</html>