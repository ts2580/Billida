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
                <th>작성자ID</th>
                <th>신고글제목</th>
                <th>작성일자</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>5</td>
                <td>tester00</td>
                <td>욕설글 신고합니다.</td>
                <td>21-11-12</td>
            </tr>
            <tr>
                <td>4</td>
                <td>tester01</td>
                <td>불량회원 신고합니다.</td>
                <td>21-11-11</td>
            </tr>
            <tr>
                <td>3</td>
                <td>tjrwls1212</td>
                <td>이런 것도 신고할 수 있나요?</td>
                <td>21-11-10</td>
            </tr>
            <tr>
                <td>2</td>
                <td>wldmsdl33</td>
                <td>이 사람 좀 이상해요!!!</td>
                <td>21-11-10</td>
            </tr>
            <tr>
                <td>1</td>
                <td>fnqlwkqk88</td>
                <td>신고합니다.</td>
                <td>21-11-08</td>
            </tr>
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