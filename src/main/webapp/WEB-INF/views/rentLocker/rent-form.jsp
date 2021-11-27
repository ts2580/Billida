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
			<div>
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
								<td class="rent-contents-text">도로명주소</td>
								<td><input type="button" name="lockerContent" onchange="syncTitle()" value="버튼" onClick="window.open('jusoPopup', 'a', 'width=400, height=300')"></td>
								<td><input type="text" name="lockerTitle" class="display-none"/></td>
							</tr>
							<tr>
								<td class="rent-contents-text">택배함 이미지</td>
								<td><input type="text" name="lockerImage"/></td>
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
								<td colspan="2"><button type="submit" class="submitButton" style="cursor:pointer">빌리기</button></td>
							</tr>
						</table>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<input type="text" id="sample5_address" placeholder="주소">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
	
	
	
	
	
	<script type="text/javascript">
		
		let auth = "${authentication}";
		
		let rentStart = document.querySelector('input[name="rentableDateStart"]');
		let rentEnd = document.querySelector('input[name="rentableDateEnd"]');
		
		let btn = document.querySelector(".submitButton");
		let bNode = btn.getAttributeNode("type");
		
		let syncTitle = () => {
			let doRoMyeongJuSo = document.querySelector('input[name="lockerContent"]').value;
			document.querySelector('.display-none').value = doRoMyeongJuSo;
		}
		
		let commonFnc = () => {
			
			let today = new Date();
			
			rentStartToNumber = rentStart.valueAsNumber;
			rentEndToNumber = rentEnd.valueAsNumber;
			
			let rentEndBeforeRentStart = false;
			
			if(!isNaN(rentCost) && rentEndToNumber < rentStartToNumber){
				rentEndBeforeRentStart = true;
			};
			
			return{
				rentEndBeforeRentStart
			};
			
		};
		
		let createCostDivFalse = () => {
			let costDiv = document.querySelector(".cost"); 
			costDiv.classList.add("inputFail");
			costDiv.innerText = "정확한 날자를 입력해 주세요.";
		};
		
		let rentStartFnc = () => {
			
			dateContents = commonFnc();
			
			if(dateContents.rentEndBeforeRentStart){
				createCostDivFalse();
			};
		};
		
		let rentEndFnc = () => {
			
			dateContents = commonFnc();
			
			if(dateContents.rentEndBeforeRentStart){
				createCostDivFalse();
			};
			
		};
		
		let verifyDate = () => {
			
			if(auth == ""){
				bNode.value = "button";
				alert("로그인을 해야 이용 가능한 기능입니다.");
			}else if(isNaN(rentStartToNumber) && isNaN(rentEndToNumber) && auth != ""){
				bNode.value = "button";
				alert("시작일과 종료일을 입력해주세요");
			}else if(isNaN(rentStartToNumber) && auth != ""){
				bNode.value = "button";
				alert("시작일을 입력해주세요");
			}else if(isNaN(rentEndToNumber) && auth != ""){
				bNode.value = "button";
				alert("종료일을 입력해주세요");
			}else if(rentStartToNumber > rentEndToNumber){
				bNode.value = "button";
				alert("대여 시작일이 대여 종료일보다 앞설 수 없습니다.");
			}else{
				bNode.value = "submit";
			};
		
		};

	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3d2bd52763449a074cc0c982030b6bf&libraries=services"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/rentLocker/rentLockerForm.js"></script>
	
	<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

</body>
</html>