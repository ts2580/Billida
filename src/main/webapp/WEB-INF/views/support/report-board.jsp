<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="../cssfile/report-board.css"> <!-- css경로 재지정 -->
	<title>report-board</title>
	<style type="text/css">
		.well { padding-top: 100px;  width: 800px; position: absolute; left: 50%; transform: translateX(-50%); }
	</style>
</head>
<body>
    <div class="well">
        <h3>신고글 목록</h3>
        <hr>
        <table class="table">
        <thead>
            <tr style="font-size: 16px; color:  rgb(27, 37, 43);">
                <th>No</th>
                <th>신고받은 ID</th>
                <th>신고글 제목</th>
                <th>작성 일자</th>
                <th>처리 여부</th>
            </tr>
        </thead>
        <tbody>
	        <c:forEach items="${getReportList}" var="reportList">
            <tr>
                <td>${reportList.REPORT_IDX}</td>
                <td>${reportList.USER_ID}</td>
                <td>${reportList.REPORT_TITLE}</td>
                <td>${reportList.REPORT_DATE}</td>
                <td>${reportList.REPORT_RESULT}</td>
            </tr>
            </c:forEach>
        </tbody>
        </table>
        <br>
        <div class="pagination" style="text-align: center;">
            <ul>
                <li><a href="#">Prev</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">Next</a></li>
            </ul>
        </div>
    </div>
</body>
</html>