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


	<div class="skin">
		<img src="${contextPath}/resources/images/billigi.jpg">
	</div>
	
	<div class="billyeojugi">
		<a class="title">BILLADA</a><a class="title-thanks">를 이용해주셔서 감사합니다!</a>
		<div class="contents">
			<div id="image_container">
				<img class="pic" src="${contextPath}/resources/images/billyeojugi.png">
			</div>

			<div class="contents-form-reply">
				<div class="outline">
					<p class="request-form">
						<span class="request-form-text">공간 내역을 입력해주세요.</span>
					</p>
					<form:form action="/rentLocker/rent-form" method="post" class="rent-contents">
						<table>
							<tr>
								<td class="rent-contents-text">택배함 이름</td>
								<td><input type="text" name="lockerTitle"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 주소</td>
								<td class="rent-contents-juso">
									<input type="text" id="roadAddrPart1" placeholder="주소" onchange="sync()">
									<input type="text" id="roadAddrPart2" placeholder="상세주소" onchange="sync()">
									<input type="button" class="jusoBtn" onclick="juSo()" value="주소 검색">
								</td>
								<td><input type="text" name="lockerContent" id="lockerContent" style="display:none"></td>
								<td><input type="text" name="location" id="jibunAddr" style="display:none"></td>
								<td><input type="text" name="latitude" id="latitude" style="display:none"></td>
								<td><input type="text" name="longitude" id="longitude" style="display:none"></td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 이미지</td>
								<td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/></td>
								<td><input type="hidden" name="imgToBlob" id="imgToBlob"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 사이즈</td>
								<td><input type="text" name="lockerSize"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 비밀번호</td>
								<td><input type="text" name="lockerPassword"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">임대시작 가능일</td>
								<td><input type="date" name="rentableDateStart"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">임대 종료일</td>
								<td><input type="date" name="rentableDateEnd"/></td>
							</tr>
							<tr>
								<td colspan="2"><button type="submit" class="submitButton" onclick="verify()">빌려주기</button></td>
							</tr>
						</table>
					</form:form>
				</div>
				<div id="map"></div>
			</div>
		</div>
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
			const base64Img = img.src.split("base64,");
			
			const contentType = 'image/png';
			const blob = b64toBlob(base64Img[1], contentType);
			document.getElementById("imgToBlob").value = blob;
			
			const blobUrl = URL.createObjectURL(blob);	
			img.src = blobUrl;
		}; 
		reader.readAsDataURL(event.target.files[0]); 
		// readAsDataURL에 대해 더 알아볼것
	};
	
	
	

	let auth = "${authentication}";
	let btn = document.querySelector(".submitButton");
	let bNode = btn.getAttributeNode("type");
	
	let verify = () => {
		
		if(auth == ""){
			bNode.value = "button";
			alert("로그인을 해야 이용 가능한 기능입니다.");
		}else{
			bNode.value = "submit";
		};
	
	};
	
	let sync = () => {
		let roadAddrPart1 =  document.getElementById("roadAddrPart1").value;
		let roadAddrPart2 =  document.getElementById("roadAddrPart2").value;
		document.getElementById("lockerContent").value = roadAddrPart1 +" "+ roadAddrPart2;
	}
	
	var mapContainer = document.getElementById('map'),
	mapOption = {
    	center: new daum.maps.LatLng(37.5751759965089, 127.089222458333),
    	level: 3
	};
	
	var map = new daum.maps.Map(mapContainer, mapOption);
    var geocoder = new daum.maps.services.Geocoder();
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.5751759965089, 127.089222458333),
        map: map
    });
	
	function juSo() {
        new daum.Postcode({
        	oncomplete: function(data) {
                var addr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                document.getElementById("roadAddrPart1").value = addr;
                document.getElementById("roadAddrPart2").focus();
                document.getElementById("jibunAddr").value = data.jibunAddress;
                
 				addr = data.address;
                
                geocoder.addressSearch(data.address, function(results, status) {
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0];

                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        document.getElementById("latitude").value = result.x;
                        document.getElementById("longitude").value = result.y;
                        
                        mapContainer.style.display = "block";
                        map.relayout();
                        map.setCenter(coords);
                        marker.setPosition(coords)
                    }
               });
             }
        }).open();
    }
	
	
</script>

</body>
</html>