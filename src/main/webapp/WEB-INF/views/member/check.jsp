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
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta charset="UTF-8">
 <link href="/resources/css/memberCss/find.css" rel='stylesheet' type='text/css' />
 <link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/favicon.ico" />
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
  <form:form class="login" modelAttribute="member" action="/member/check" method="post" id="check">
    <p class="title">Password</p>
    <input style="display: none" name="id" id="id" value="${authentication.id}">
    <input type="password" placeholder="Password" name="password" id="password" autofocus/>
    <i class="fa fa-key"></i>
   		<c:if test="${not empty message}">
			<span class="valid-msg">${message}</span>
		</c:if>
    <button>
      <i class="spinner"></i>
      <span class="state">확 인</span>
    </button>
  </form:form>
  </p>
</div>
<!-- 	<script type="text/javascript">
	var working = false;
	$(".login").on("submit", function (e) {
	  e.preventDefault();
	  if (working) return;
	  working = true;
	  var $this = $(this),
	    $state = $this.find("button > .state");
	  $this.addClass("loading");
	  $state.html("Authenticating");
	  setTimeout(function () {
	    $this.addClass("ok");
	    $state.html("Welcome back!");
	    setTimeout(function () {
	      $state.html("Log in");
	      $this.removeClass("ok loading");
	      working = false;
	    }, 4000);
	  }, 3000);
	});
	</script> -->
</body>
</html>