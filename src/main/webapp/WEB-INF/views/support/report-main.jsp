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
    <link href="${contextPath}/resources/css/reviewCss/paging.css" rel="stylesheet" type="text/css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<title>report-main</title>
	<style type="text/css">
		body {background: #87cefa1f }
		.contact { padding: 4%; height: 400px; }
		.col-md-3{ background: #87cefa; padding: 4%; border-top-left-radius: 0.5rem; border-bottom-left-radius: 0.5rem; }
		.contact-info{ margin-top:10%; }
		.contact-info img{ margin-bottom: 15%; }
		.contact-info h2{ margin-bottom: 10%; }
		.col-md-9{ background: #6c757d36; padding: 3%; border-top-right-radius: 0.5rem; border-bottom-right-radius: 0.5rem;}
		.contact-form label{ font-weight:600; }
		.contact-form button{ background: #d14b4b; color: #fff; font-weight: 600; width: 25%; }
		.contact-form button:focus{ box-shadow:none; }
		.logOutImg { width: 35px; height: 35px; padding-right: 0px; }
		.logo img { display: inline-block; height: 70px; padding-top: 13px; width: 180px; height: 73px; margin-top: 3px; }
	</style>
</head>
<body>
    <div class="container contact" style="padding-top: 170px;">
        <div class="row">
            <div class="col-md-3">
                <div class="contact-info" style="background: #87cefa">
                    <br>
                    <h4><b>　신고하기</b></h4>
                    <hr>
                    <br>
                    <h6 style="font-size: 13px;">
                        😢아래의 사항에 해당되는 회원을 신고해주세요😢<br><br><br><br>
                        ✔ 상업성 게시물 작성<br>
                        ✔ 불법 게시물 작성<br>
                        ✔ 저작권침해 게시물<br>
                        ✔ 욕설 및 명예훼손<br>
                        ✔ 기타(상세작성)
                    </h6>
                </div>
            </div>
            <div class="col-md-9">
            	<form:form action="/support/report-main" method="post" id="locker">
                <div class="contact-form">
                    <div class="form-group">
                        <label class="control-label col-sm-2">회원ID</label>
                        <div class="col-sm-10">          
                            <input type="text" class="form-control" name = "userId" id=" fname" placeholder="신고할 회원의 아이디를 입력해주세요. 40자 제한" maxlength="40" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">제목</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="reportTitle" id="report_title" placeholder="신고할 게시글의 제목을 작성해주세요. 50자 제한" maxlength="50" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2">내용</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="5" name="reportContent" id="comment" placeholder="신고 내용을 상세히 작성해주세요.&#13;&#10;입력 가능 텍스트는 300자입니다." maxlength="300" required></textarea>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="report" name="report" type="submit" class="btn btn-default report" style="margin-right: 260px;" >신고접수</button>
                            <button type="button" class="btn btn-default" onclick="location.href='report-board'" style="background-color: #87aff5;">신고목록조회</button>
                        </div>
                    </div>
                </div>
                </form:form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
     $("#report").on("click", function(e){
      	
    	if($("#fname").val() ==""){
    		alert("신고할 회원의 아이디가 입력되지 않았습니다.");
    		
    		
    	}else if($("#report_title").val() =="" ){
    		alert("게시글의 제목이 입력되지 않았습니다..");
    		
    	}else if($("#comment").val() == ""){
    		alert("신고 내용이 입력되지 않습니다.");
    		console.log(".reportContent");
    		
    	}else if($("#fname").val && $("#report_title").val && $("#comment").val != ""){
    		alert("신고접수가 완료되었습니다. \n 감사합니다.");
    	};    
    
     }); 
    
    </script>
      
</body>
</html>