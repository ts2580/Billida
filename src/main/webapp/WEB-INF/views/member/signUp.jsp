<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>회원가입 </title>
	
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
  .valid-msg{
   display:block;
   color:#007bff;
   font-size:15px;
   margin-bottom: 5px;
}
    body {
      min-height: 100vh;
      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }
    .input-form {
      max-width: 680px;
      margin-top: 80px;
      padding: 32px;
      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form:form modelAttribute="joinForm" class ="validation-form" action="/member/signUp"
         method="post" id="signUp">
          
            <label for="id">아이디</label>
            <span class="mb-3" style="display: flex;" >
            <input type="text" class="form-control" name="id" id="id" placeholder="영어+숫자를 혼합해 사용해주세요" 
            	<c:if  test="${empty error.Id}">
            		value="${joinForm.id}"
            	</c:if>
            required />
            <button  type="button" id="btnIdCheck" class="btn btn-primary btn-lg btn-block" style=" width: 120px; height:38px; margin-left: 10px; font-size: 14px;" >중복확인</button>
			</span>
                <c:if test="${empty error.id}">
                      <span id="idCheck" class="valid-msg"></span>
                 </c:if>
                <form:errors path="Id" cssClass="valid-msg"/>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" name="password"  id="password" placeholder="" 
              	<c:if  test="${empty error.password}">
            		value="${joinForm.password}"
            	</c:if>
              required>
            	<c:if test="${empty error.password}">
                      <span id="pwCheck" class="valid-msg"></span>
                 </c:if>
            </div>
                <form:errors path="password" cssClass="valid-msg"/>
            <div class="col-md-6 mb-3">

              <label for="password">비밀번호 확인</label>
              <input type="password" class="form-control" name="passwordCheck" id="passwordCheck" placeholder=""  
              required>
            	<c:if test="${empty error.password}">
                      <span id="passwordFail" class="valid-msg"></span>
                 </c:if> 
            </div>
          </div>
          
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" id="name" placeholder="" value="" required>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">별명</label>
              <span style="display: flex;">
              <input type="text" class="form-control" name="nick" id="nick" placeholder="" value="" required>
              
            <button  type="button" id="btnNickCheck" class="btn btn-primary btn-lg btn-block" style=" width: 120px; height:38px; margin-left: 10px; font-size: 13px;" >중복확인</button> </span>
                <c:if test="${empty error.nick}">
                      <span id="nickCheck" class="valid-msg"></span>
                 </c:if>
                 <form:errors path="nick" cssClass="valid-msg"/>
            </div>
          </div>   
                 


          <div class="mb-3">
            <label for="tel">휴대전화</label>
            <span style="display: flex;">
            <input type="tel" class="form-control" id="phone" name="phone"required>
 			</span>
 			<c:if test="${empty error.phone}">
                 <span id="phoneCheck" class="valid-msg"></span>
            </c:if>
          </div>
          
          
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="postCode">우편번호</label>
			<div style="display: flex;">
            <input  name="postCode" id="postCode" type="text" class="form-control" placeholder="우편번호"  required>
            <input onclick="daumPost()" value="검색" type="button"  class="btn btn-primary btn-lg btn-block" style="width: 120px; height:38px; margin-left: 10px; font-size: 14px;" >
            </div>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소<span class="text-muted">&nbsp;</span></label>
            <input type="text" class="form-control" class="form-control" name="address" id="address" placeholder="주소를 입력해주세요." required>
          </div>
          <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" name="addressDetail" id="addressDetail" placeholder="상세주소를 입력해주세요.">
          </div>

         
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form:form>
      </div>
    </div>    
  </div>
<script type="text/javascript" src="/resources/js/member/joinForm.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function daumPost() {
	new daum.Postcode({
		oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("address1").value = extraAddr;
            
            } else {
                document.getElementById("address").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressDetail").focus();
        }
    }).open();



}
</script>

  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
  </script>
  
</body>

</html>