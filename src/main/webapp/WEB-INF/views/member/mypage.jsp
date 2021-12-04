<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE html>
<html lang="ko">

<head> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <%@ include file="/WEB-INF/views/include/head.jsp" %>
  <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
  <title>회원가입 </title>
	 <link rel="stylesheet" href="/resources/css/memberCss/backgroundPage.css">
	<!--  <link rel="stylesheet" href="/resources/css/memberCss/styles.css"> -->
  <!-- Bootstrap CSS -->
   
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->

</head>

<body id="body-pd">
	<div class="common_div">
		<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<span style="display: flex; justify-content: space-between;">
					<h4 class="mb-3">회원 정보 수정</h4> <c:if
						test="${not empty authentication.kakaoNum}">
						<button type="button" onclick="javascript:unlinkApp();"
							class="btn btn-primary btn-lg btn-block"
							style="width: 150px; height: 38px; margin-left: 10px; font-size: 14px;">카카오
							회원탈퇴</button>
					</c:if> <c:if
						test="${empty authentication.kakaoNum &&not empty authentication.id}">
						<a type="button" href="/member/delete"
							class="btn btn-primary btn-lg btn-block"
							style="width: 150px; height: 38px; margin-left: 10px; font-size: 14px;">일반회원
							탈퇴</a>
					</c:if>
				</span>
				<form:form  class="validation-form"
					action="/member/changeName" method="post" id="name">
					<div class="mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" name="name" id="name" placeholder=""
								value="" required>
					</div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">이름 변경</button>
				</form:form>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

					<form:form modelAttribute="joinForm" class="validation-form" action="/member/changeNick" method="post" id="kakaoChange">
					<div class="mb-3">
						<label for="nickname">별명</label> 
						 <span style="display: flex;">
						<input type="text"class="form-control" name="nick" id="nick" placeholder=""value="" required>
							<button type="button" id="btnNickCheck" class="btn btn-primary btn-lg btn-block"
								style="width: 120px; height: 38px; margin-left: 10px; font-size: 14px;">중복확인</button>
						</span>
						<c:if test="${empty error.nick}">
							<span id="nickCheck" class="valid-msg"></span>
						</c:if>
					</div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">별명 변경</button>
				</form:form>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

				<form:form modelAttribute="joinForm" class="validation-form"
					action="/member/changeTel" method="post" id="kakaoPhoneChange">
					<div class="mb-3">
						<label for="tel">휴대전화</label> <span style="display: flex;">
							<input type="tel" class="form-control" id="phone" name="phone">
							<button type="button"  class="btn btn-primary btn-lg btn-block"
								style="width: 120px; height: 38px; margin-left: 10px; font-size: 14px;">전송!</button>
						</span>
						<c:if test="${empty error.phone}">
							<span id="phoneCheck" class="valid-msg"></span>
						</c:if>
					</div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">휴대전화 변경</button>
				</form:form>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				
				<form:form class="validation-form"
					action="/member/changeAddress" method="post">

					 <div class="mb-3">
			            <label for="postCode">우편번호</label>
						<div style="display: flex;">
			            <input  name="postCode" id="postCode" type="text" class="form-control" placeholder="우편번호"  required>
			            <input onclick="daumPost()" value="검색" type="button"  class="btn btn-primary btn-lg btn-block" style="width: 120px; height:38px; margin-left: 10px; font-size: 14px;" >
			            </div>
			          </div>
			
			          <div class="mb-3">
			            <label for="address">주소</label>
			            <input type="text" required class="form-control" class="form-control" name="address" id="address" placeholder="">
			          </div>
			          <div class="mb-3">
			            <label for="address2">상세주소<span class="text-muted">(필수 아님)</span></label>
			            <input type="text" class="form-control" name="addressDetail" id="addressDetail" placeholder="상세주소를 입력해주세요.">
			          </div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">주소 변경</button>
				</form:form>



			</div>
		</div>
	</div>
	</div>
 
      <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/resources/js/member/main.js"></script>
<script type="text/javascript" src="/resources/js/member/kakaochangeForm.js"></script>
<script type="text/javascript" src="/resources/js/member/changePhoneForm.js"></script>
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