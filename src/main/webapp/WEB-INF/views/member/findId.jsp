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
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
 <link href="/resources/css/memberCss/find.css" rel='stylesheet' type='text/css' />
 <link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/favicon.ico" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
  <form action="/member/findIdByEmail" method="post" class="login">
    <p class="title">Find ID</p>
    <input name="name" id="name" type="text" placeholder="Username" autofocus/>
    <i class="fa fa-user"></i>
    <input name="email" id="email" type="email" placeholder="email" />
    <i class="fa fa-envelope-o"></i>
		<c:if test="${not empty message}">
			<span class="valid-msg">${message}</span>
		</c:if>
    <div style="display: grid;">
    <a href="/member/signUp">Sign up</a>
    <span style="display: flex; justify-content: space-between;">
    <a style="margin-top:2px;" href="/member/findPassword">Forgot your password?</a>
    </span>
    </div>
    <button>
      <i class="spinner"></i>
      <span class="state">Send Email</span>
    </button>
  </form>

  <footer><a target="blank" href="http://boudra.me/"></a></footer>
  </p>
</div>


</body>
</html>