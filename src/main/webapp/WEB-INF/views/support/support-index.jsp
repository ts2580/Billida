<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>support-index</title>
	<style type="text/css">	
		body {background: #87cefa1f }
		.how-section1 { margin-top:-15%; padding: 20%; }
		.how-section1 h4{ color: #e09f48; font-weight: bold; font-size: 30px; }
		.how-section1 .subheading{ color: #755a32; font-size: 20px; }
		.how-section1 .row { margin-top: 10%; }
		.how-img { text-align: center; }
		.how-img img{ width: 40%; }
		.logo img {
    display: inline-block;
    height: 70px;
    padding-top: 13px;
    width: 180px;
    height: 73px;
    margin-top: 3px;
}
	</style>
</head>
<body>
    <div class="how-section1">
        <div class="row">
            <div class="col-md-6 how-img">
	            <a href="http://pf.kakao.com/_xcBDVb">
	                <img src="https://2.bp.blogspot.com/-W1DO9_IC3a4/WxvKIr4Pe4I/AAAAAAABMnE/0zTo5-67rdATvQxxejwcnbBP72bDQ38PQCLcBGAs/s400/job_telephone_operator_woman_majime.png" class="rounded-circle img-fluid" alt=""/>
	            </a>
            </div>
            <div class="col-md-6">
                <h4>문의하기</h4>
                <h4 class="subheading">카카오 채널이 제공하는 채팅 기능을 이용한 문의하기 페이지입니다.</h4>
                <p class="text-muted">
                    카카오 채널이 제공하는 채팅 기능을 이용한 문의하기 페이지입니다.<br>
                    왼쪽의 이미지를 클릭하면 상세한 설명과 함께 카카오 채널로 이동할 수 있는 버튼이 표시됩니다.<br>
                    문의할 시 상대방을 배려하는 자세로 문의해주시길 부탁드립니다.<br>
                    감사합니다.
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <h4>신고하기</h4>
                <h4 class="subheading">오른쪽의 이미지를 클릭하면 신고하기 페이지로 넘어갑니다.</h4>
                <p class="text-muted">
                    회원을 신고할 수 있는 페이지입니다.<br>
                    오른쪽의 이미지를 클릭하면 신고를 접수할 수 있는 페이지가 뜨게 됩니다.<br>
                    욕설을 하는 회원이나 광고글을 올리는 회원 등을 신고할 수 있습니다.<br>
                    회원님의 신고로 더욱 깨끗하고 편리하게 이용할 수 있는 BILLIDA가 되겠습니다.<br>
                    감사합니다.
                </p>
            </div>
            <div class="col-md-6 how-img">
	            <a href="/support/report-main">
	                <img src="https://3.bp.blogspot.com/-A9BzUzJ8xpo/Wq9-fuB4DeI/AAAAAAABK9E/hAXJre2bMxgcUlh5ZDbuwKavfeN-dMyjwCLcBGAs/s450/job_ekiin_woman_ojigi.png" class="rounded-circle img-fluid" alt=""/>
	            </a>
            </div>
        </div>
    </div>
</body>
</html>