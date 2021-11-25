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
	<title>report-main</title>
	<style type="text/css">
		.contact { padding: 4%; height: 400px; }
		.col-md-3{ background: #fdfdfe; padding: 4%; border-top-left-radius: 0.5rem; border-bottom-left-radius: 0.5rem; }
		.contact-info{ margin-top:10%; }
		.contact-info img{ margin-bottom: 15%; }
		.contact-info h2{ margin-bottom: 10%; }
		.col-md-9{ background: #6c757d36; padding: 3%; border-top-right-radius: 0.5rem; border-bottom-right-radius: 0.5rem;}
		.contact-form label{ font-weight:600; }
		.contact-form button{ background: #d14b4b; color: #fff; font-weight: 600; width: 25%; }
		.contact-form button:focus{ box-shadow:none; }
	</style>
</head>
<body>
    <div class="container contact" style="padding-top: 170px;">
        <div class="row">
            <div class="col-md-3">
                <div class="contact-info">
                	<img src="${contextPath}/resources/images/logo.gif" title="pinbal" style="max-width: 100%; height: auto;" />
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
            	<form:form action="/support/report-main" method="post" id="locker">
                <div class="contact-form">
                    <div class="form-group">
                        <label class="control-label col-sm-2">회원ID</label>
                        <div class="col-sm-10">          
                            <input type="text" class="form-control" name = "userId" id=" fname" placeholder="신고할 회원의 아이디를 입력해주세요." >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">제목</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="reportTitle" id="report_title" placeholder="신고할 게시글의 제목을 작성해주세요." >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">내용</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="5" name="reportContent" id="comment" placeholder="신고 내용을 상세히 작성해주세요."></textarea>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">신고접수</button>
                        </div>
                    </div>
                </div>
                </form:form>
            </div>
        </div>
    </div>  
</body>
</html>