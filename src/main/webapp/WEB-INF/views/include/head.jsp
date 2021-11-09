<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!--공통으로 추가해 줄 헤드 작성  -->
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/all.css">
<script type="text/javascript" src="${contextPath}/resources/js/webUtil.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/urlEncoder.js"></script>
<title>JSP_Study</title>



<%-- 
el태그 대신 스크립틀릿 사용방법
<% String contextPath = request.getContextPath(); %>
<%= contextPath %> 

--%>