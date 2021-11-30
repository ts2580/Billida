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
    <link href="${contextPath}/resources/css/reviewCss/paging.css" rel='stylesheet' type='text/css' />
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<title>report-board</title>
	<style type="text/css">
		body {background: #87cefa1f }
		.well { padding-top: 100px;  width: 800px; position: absolute; left: 50%; transform: translateX(-50%); }
	</style>
</head>
<body>
    <div class="well">
    	<br><br><br>
        <h3>신고글 목록</h3>
        <hr>
        <table class="table">
        <thead>
            <tr style="font-size: 16px; color:  rgb(27, 37, 43);">
                <th style="text-align: center;">No</th>
                <th style="text-align: center;">신고받은 ID</th>
                <th style="text-align: center;">신고글 제목</th>
                <th style="text-align: center;">작성 일자</th>
                <th style="text-align: center;">처리 여부</th>
            </tr>
        </thead>
        <tbody>
	        <c:forEach items="${list}" var="reportList">
	        <tr>
                <td style="text-align: center;">${reportList.reportIdx}</td>
                <td style="text-align: center;">${reportList.userId}</td>
                <td style="text-align: center;" onclick="location.href='report-detail?reportIdx=${reportList.reportIdx}'">${reportList.reportTitle}</td>
                <td style="text-align: center;">${reportList.reportDate}</td>
                <td style="text-align: center;">${reportList.reportResult}</td>
            </tr>
            </c:forEach>
        </tbody>
        </table>
        <br>
        <br>
        <div class="pagination" style="text-align: center;">
        	<div>
        	<form method="post" action="/support/report-board-search">
        		<select name="searchOption">
        			<option value="all" <c:out value="${searchMap.searchOption == 'all'?'selected':''}"/> >전체조회</option>
					<option value="user_id" <c:out value="${searchMap.searchOption == 'user_id'?'selected':'' }"/>>아이디</option>
					<option value="report_title" <c:out value="${searchMap.searchOption == 'report_title'?'selected':'' }"/>>제목</option>
        		</select>
        		<input name="keyword" value="${searchMap.keyword}">
        		<input type="submit" value="검색">
        	</form>
        	</div>
       	<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
					<!-- 이전페이지 버튼 -->
                	<c:if test="${paging.prev}">
                    	<li class="pageInfo_btn previous" href="${paging.startPage-1}">&laquo;</li>
                	</c:if>
				
					<!-- 각 번호 페이지 버튼  -->
					<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						<li class="pageInfo_btn ${paging.cri.pageNum == num ? 'active':'' }" href="${num}">${num}</li>
					</c:forEach>
					
					<!-- 다음페이지 버튼 -->
                	<c:if test="${paging.next}">
                    	<li class="pageInfo_btn next" href="${paging.endPage + 1 }">&raquo;</li>
                	</c:if>
				</ul>
			</div>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
			<input type="hidden" name="amount" value="${paging.cri.amount}">
		</form>
        </div>
        
        <script type="text/javascript">
        let moveForm = $("#moveForm");
        
        $(".pageInfo li").on("click", function(e){
       	 e.preventDefault();
            moveForm.find("input[name='pageNum']").val($(this).attr("href"));
            moveForm.attr("action", "report-board");
            moveForm.submit();
       });
        
        
        </script>
</body>
</html>