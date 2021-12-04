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
  <title>개인 정보</title>
	 <link rel="stylesheet" href="/resources/css/memberCss/backgroundPage.css">


</head>

<body id="body-pd">

  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">${authentication.id}님의 개인정보</h4>
        <form:form modelAttribute="joinForm" class ="validation-form" action="/member/signUp"
         method="post" id="signUp">
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름 &nbsp;:&nbsp; ${authentication.name}</label>
              
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="nickname">별명 &nbsp;:&nbsp; ${authentication.nick}</label>              
            </div>
          </div>   
  


          <div class="mb-3">
            <label for="tel">휴대전화 &nbsp;:&nbsp; ${authentication.phone}</label>            
          </div>


          <div class="mb-3">
            <label for="email">이메일 &nbsp;:&nbsp; ${authentication.email}</label>            
          </div>

          <div class="mb-3">
            <label for="postCode">우편번호 &nbsp;:&nbsp; ${authentication.postCode}</label>
			<div style="display: flex;">
            </div>           
          </div>

          <div class="mb-3">
            <label for="address">주소 &nbsp;:&nbsp; ${authentication.address}<span class="text-muted"></span></label>
             </div>
          <div class="mb-3">
            <label for="address2">상세주소 &nbsp;:&nbsp; ${authentication.addressDetail}<span class="text-muted">&nbsp;</span></label>
          </div>         

          
        </form:form>
         
      </div>
    </div>    
  </div>





  
</body>

</html>