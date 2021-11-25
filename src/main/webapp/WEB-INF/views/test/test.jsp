<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div class="form-group">
                                        <label for="captcha" style="display:block;">자동 로그인 방지</label>
                                        <div class="captcha">
                                            <div class="form-group">
                                                <img id="captchaImg" title="캡차 이미지" src="captchaImg.do" alt="캡차 이미지" />
                                                <div id="captchaAudio" style="display:none;"></div>
                                            </div>
                                            <div class="form-group">
                                                <a onclick="javascript:refreshBtn()" class="refreshBtn">
                                                    <input type="button" value="새로고침" />
                                                </a>
                                                <a onclick="javascript:audio()" class="refreshBtn">
                                                    <input type="button" value="음성듣기" />
                                                </a>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="answer" id="answer"  class="form-control" />
                                            </div>   
                                        </div>
 </div>
<script type="text/javascript">
function audio(){
    var rand = Math.random();
    var url = 'captchaAudio.do';
    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'text',
        data: 'rand=' + rand,
        async: false,
        success: function(resp) {
            var uAgent = navigator.userAgent;
            var soundUrl = 'captchaAudio.do?rand=' + rand;
            
            if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
                winPlayer(soundUrl);
            } else if (!!document.createElement('audio').canPlayType) {
                try{
                    new Audio(soundUrl).play();
                } catch(e) {
                    winPlayer(soundUrl);
                }
            }else {
                window.open(soundUrl, '', 'width=1, height=1');
            }
        }    
        
    });
    
}

function refreshBtn(type){
    var rand = Math.random();
    var url = "captchaImg.do?rand=" + rand;
    $('#captchaImg').attr("src", url);
}
function winPlayer(objUrl){
    $('#captchaAudio').html('<vgsound src="' + objUrl + '">');
}
</script>
</body>
</html>