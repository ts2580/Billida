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
    <link rel="stylesheet" href="../cssfile/report-main.css">  <!-- css경로 재지정 -->
	<title>report-main</title>
</head>
<body>
    <div class="container contact" style="padding-top: 170px;">
        <div class="row">
            <div class="col-md-3">
                <div class="contact-info">
                    <img src="../resources/image/logo.gif" alt="image" style="max-width: 100%; height: auto;"/>
                    <hr>
                    <br>
                    <h4><b>신고하기</b></h4>
                    <br>
                    <h6 style="font-size: 13px;">
                        · BILLIDA는 더 즐겁고 유익한 무인공유함 사이트를 만들기 위해 이용제한 조치 서비스를 취하고 있습니다.<br>
                        · 모두가 기분 좋게 BILLIDA를 이용할 수 있도록 도와주시길 부탁드립니다.<br>
                        · 아래의 사항에 해당되는 회원을 신고해주세요.<br><br>
                        - 불법 및 상업게시물 작성<br>
                        - 저작권침해 게시물<br>
                        - 욕설 및 명예훼손<br>
                        - 기타(상세작성)
                    </h6>
                </div>
            </div>
            <div class="col-md-9">
                <div class="contact-form">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="fname">&nbsp&nbsp회원ID</label>
                        <div class="col-sm-10">          
                            <input type="text" class="form-control" id="fname" placeholder="신고할 회원의 아이디를 입력해주세요." name="fname">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">&nbsp&nbsp제목</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" placeholder="신고할 게시글의 제목을 작성해주세요." name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="comment">&nbsp&nbsp내용</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="5" id="comment" placeholder="신고 내용을 상세히 작성해주세요."></textarea>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">신고접수</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</body>
</html>