<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
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

table.memberList {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin: 20px 10px;
}

table.memberList th {
	width: 155px;
	padding: 10px;
	text-align: center;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #6495ED;
}

table.memberList td {
	width: 155px;
	padding: 10px;
	vertical-align: center;
	border-bottom: 1px solid #ccc;
	background: #eee;
}
</style>
</head>
<body>
	<form:form modelAttribute="member" class ="validation-form" action="/member/searchMember"
         method="post" id="searchMember">
        <label> 아이디 : </label>
		<input  type="text" class="form-control" name="id" id="id" >
		<button> 검색 </button>
	</form:form>
 <table border="1" class="memberList" style ="text-align : center">
 	<th> 아이디</th>
 	<th> 이름</th>
 	<th> 이메일</th>
 	<th> 등급 </th>
 	<th> 등급 조정</th>
 	<c:forEach items="${memberList}" var="memberList">
 	<tr>
 		<td>${memberList.id}</td>
 		<td>${memberList.name}</td>
 		<td>${memberList.email}</td>
 		<td>
 		<c:choose>
 		<c:when test="${memberList.grade eq '00'}"><c:out value="정지"/></c:when>
 		<c:when test="${memberList.grade eq '01'}"><c:out value="일반"/></c:when>
 		<c:when test="${memberList.grade eq '99'}"><c:out value="운영자"/></c:when>
 		</c:choose>
 		</td>
 		<td>
 			<form:form modelAttribute="member" action="/member/gradeUp" method="post" id="gradeUp">
         		<input style="display: none" name="id" id="id" value="${memberList.id}">
         		<input style="display: none" name="grade" id="grade" value="${memberList.grade}">
         		<button>
         		<img src="/resources/images/approved.png">
         		</button>
         	</form:form>
 			<form:form modelAttribute="member" action="/member/gradeDown" method="post" id="gradeDown">
         		<input style="display: none" name="id" id="id" value="${memberList.id}">
         		<input style="display: none" name="grade" id="grade" value="${memberList.grade}">
         		<button>
         		<img src="/resources/images/rejected.png">
         		</button>
         	</form:form>
 		</td>
 	</tr>
 	</c:forEach>
 
 </table>
 <script type="text/javascript">

	
 
 	
 	
 </script>
</body>
</html>