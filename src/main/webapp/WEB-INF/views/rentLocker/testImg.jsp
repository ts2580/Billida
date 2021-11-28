<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="${contextPath}/resources/css/rentLockerCss/rentLockerForm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	
	<img class="pic" src="${contextPath}/resources/images/billyeojugi.png">
	
	<form:form action="/rentLocker/testImg" method="get" class="rent-contents">
		<div id="image_container">
			<input type="file" accept="image/png" onchange="setThumbnail(event);"/>	
			<input type="text" name="imgToClob" id="asdasd" style="display:none">
		</div>
		<button type="submit">빌려주기</button>
	</form:form>
			
	<script type="text/javascript" src="${contextPath}/resources/js/rentLocker/rentLockerForm.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3d2bd52763449a074cc0c982030b6bf&libraries=services"></script>
	<script type="text/javascript">
	
	const b64toBlob = (b64Data, contentType='', sliceSize=512) => {
		  const byteCharacters = atob(b64Data);
		  const byteArrays = [];

		  for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
		    const slice = byteCharacters.slice(offset, offset + sliceSize);

		    const byteNumbers = new Array(slice.length);
		    for (let i = 0; i < slice.length; i++) {
		      byteNumbers[i] = slice.charCodeAt(i);
		    }

		    const byteArray = new Uint8Array(byteNumbers);
		    byteArrays.push(byteArray);
		  }

		  const blob = new Blob(byteArrays, {type: contentType});
		  return blob;
	}
	
	let aaa = null;
	let bbb = null;
	
	function setThumbnail(event) { 
		let reader = new FileReader(); 
		
		reader.onload = function(event){ 
			let img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			img.classList.add("base64Img");
			document.querySelector("div#image_container").appendChild(img); 
			document.querySelector(".pic").style.display = "none";
			const base64Img = document.querySelector(".base64Img").src.split("base64,");
			
			
			const contentType = 'image/png';
			const blob = b64toBlob(base64Img[1], contentType);
			const blobUrl = URL.createObjectURL(blob);	
			
			aaa = base64Img[1];
			bbb = base64Img;
	
			
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>

</body>
</html>