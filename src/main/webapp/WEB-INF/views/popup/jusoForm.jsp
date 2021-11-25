<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="secRight">
    <div class="rightheader">숙소 등록</div>
    <form name="form" action="<%=contextPath%>/mypage/mySsgsoCreate" method="post">
        <table class="list">
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" id="roadFullAddr" style="width:80%;" name="roadFullAddr" placeholder="주소검색을 눌러 주소를 입력해주세요" required readonly />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="등록" id="addbutton">
                    <input type="reset" value="초기화" id="resetbutton">
                </td>
            </tr>
        </table>
    </form>
    <button class="searchButton" onclick="goPopup()">주소 검색</button>
</div>

</body>
</html>