<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
 <link href="/resources/css/memberCss/find.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/favicon.ico" />
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
  <form:form modelAttribute="joinForm" action="/member/changePasswordByEmail" method="post" class="login" id="changePW">
    <p class="title">Change PW</p>
    <%-- <input style="display: none" name="id" id="id" value="${authentication.id}">
    <input style="display: none" name="phone" id="phone" value="${authentication.phone}">
    <input style="display: none" name="nick"id="nick" value="${authentication.nick}">
  --%>
    <span>
    <input id="password" name="password" type="password" placeholder="비밀번호는 숫자, 영문자," autofocus/>
    <i class="fa fa-key"></i>
    </span>
    <c:if test="${empty error.password}">
         <span id="pwCheck" class="valid-msg"></span>
    </c:if>
    <span>
    <input  id="passwordCheck" name="passwordCheck" type="password" placeholder=" 특수문자 조합의 8자리 이상 문자열입니다." />
    <i class="fa fa-key"></i>
	</span>
	<c:if test="${empty error.password}">
        <span id="passwordFail" class="valid-msg"></span>
   </c:if> 
    <button>
      <i class="spinner"></i>
      <span class="state">change Password</span>
    </button>
  </form:form>

</div>
<script src="/resources/js/member/changePW.js"></script>
</body>
</html>