<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 태그 라이브러리 추가  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!-- 스프링 폼태그 사용 가능  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
	String jibunAddr = request.getParameter("jibunAddr"); 
	String addrDetail = request.getParameter("addrDetail"); 
%>
</head>
<body onload="init();">
	
	<script language="javascript">
	let roadFullAddr = null;
	let roadAddrPart1 = null;
	let roadAddrPart2 = null;
	let jibunAddr = null;
	
	function init(){
		var url = location.href;
		var confmKey = "devU01TX0FVVEgyMDIxMTEyODAxMzQzNDExMTk2MjQ=";
		var resultType = "4"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
		var inputYn= "<%=inputYn%>";
	
		if(inputYn != "Y"){
			document.form.confmKey.value = confmKey;
			document.form.returnUrl.value = "http://localhost:9090/rentLocker/rent-form";
			document.form.resultType.value = resultType;
			document.form.action="https://www.juso.go.kr/addrlink/addrLinkUrl.do"; 
			document.form.submit();
		}else{
			roadFullAddr = "<%=roadFullAddr%>";
			roadAddrPart1 = "<%=roadAddrPart1%>";
			roadAddrPart2 = "<%=addrDetail%>";
			jibunAddr = "<%=jibunAddr%>";
			window.close();
		}
	}
	</script>
	
	<form:form action="/rentLocker/rent-form" id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
	</form:form>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>