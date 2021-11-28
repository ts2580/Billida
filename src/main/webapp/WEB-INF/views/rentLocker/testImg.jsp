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

	
	<div id="image_container">
		<input type="file" name="lockerImage" id="image" accept="image/png" onchange="setThumbnail(event);"/>	
		<img class="pic" src="${contextPath}/resources/images/billyeojugi.png">
	</div>
	
			
	<script type="text/javascript" src="${contextPath}/resources/js/rentLocker/rentLockerForm.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3d2bd52763449a074cc0c982030b6bf&libraries=services"></script>
	<script type="text/javascript">
	
	// const byteCharacters = atob(base64Img[1]);
	// Base64로 인코딩된 객체를 byte of the binary data로 변환
	
	
	// const byteNumbers = new Array(byteCharacters.length);
	
	/* for (let i = 0; i < byteCharacters.length; i++) {
	    byteNumbers[i] = byteCharacters.charCodeAt(i);
	} */
	// 각 문자의 code point (charCode)는 byte값으로 다뤄질 수 있음. 각 문자열 글자마다 .charCodeAt 메소드를 사용해 byte값 배열 만들음
	
	// const byteArray = new Uint8Array(byteNumbers);
	// 이 byte값 배열을 Uint8Array생성자를 통해 real typed byte로 바꾼다
	
	// const blob = new Blob([byteArray], {type: contentType});
	// Blob생성자로 위 객체를 BLOB으로 바꾼다.
	
	
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
	// Blob까지만 바꿔도 뭐 작동은 잘 하지만 이렇게 byte64문자열로 시작해서 blob값으로 바꾼 이 객체는 퍼포먼스가 그렇게 좋다고는 못함
	// 따라서 한큐에 다 인코딩하는것보단 byteCharacters를 통해 더 잘게 잘라주면서 작업치면 훨씬 효율적임 
	
	
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
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>

</body>
</html>