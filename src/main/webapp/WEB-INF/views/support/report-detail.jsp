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
	<title>report-detail</title>
	<style type="text/css">
		body {background: #87cefa1f }
		.well { padding-top: 100px;  width: 800px; position: absolute; left: 50%; transform: translateX(-50%); }
	</style>
</head>
<body>
    <div class="well">
    	<br><br><br>
        <h3 style="text-align: center;">신고글 상세 페이지</h3>
        <br><br>
        <br>
        <div class="table table-responsive">
            <table class="table">
                <tr>
                    <th class="success">글번호</th>
                    <td><c:out value="${support.reportIdx}"/></td>
                    <th class="success">작성일</th>
                    <td><c:out value="${support.reportDate}"/></td>
                </tr>
                <tr>
                    <th class="success">작성자</th>
                    <td>익명</td>
                    <th class="success">신고대상자</th>
                    <td><c:out value="${support.userId}"/></td>
                </tr>
                <tr>
                    <th class="success">제 목</th>
                    <td colspan="3"><c:out value="${support.reportTitle}"/></td>
                </tr>
                <tr>
                    <th class="success">글 내용</th>
                    <td colspan="3"><c:out value="${support.reportContent}"/></td>
                </tr>
            </table>
            <button type="button" class="btn btn-default" onclick="location.href='report-board'" style="margin-right: 555px;">목록으로이동</button>
			<form action="/support/report-addResult" method="post" style="display: inline;">
				<button type="submit" class="btn btn-default">신고처리등록</button>
			</form>
        </div>
    </div>
</body>
</html>