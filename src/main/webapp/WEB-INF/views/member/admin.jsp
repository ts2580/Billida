<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a91d097e5c5d9764f91631e0ac40e115"></script>
<style type="text/css">
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
  background: #6495ED ;
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
 		<td><img src="/resources/images/up.png"><img src="/resources/images/down.png"></td>
 	</tr>
 	</c:forEach>
 
 </table>
</body>
</html>