<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript" src='${contextPath}/resources/js/jquery.js'></script>
<style type="text/css">

@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');

</style>
</head>
<body class="backgroundWhite">
		<div class="content">
			<video autoplay loop muted preload="none" class="mainMp4">
  				<source src="${contextPath}/resources/images/bannerM.mp4" type="video/mp4">
			</video>
			<div class="wrapper">	 
			 <a id="recommendList">추천 보관함 리스트</a>
			 
			  <div class="locker_list list1">
			 	<c:forEach items="${mainList}" var="mains" begin="0" end="3" varStatus="status">
					 <div class="locker_area">
					 	<div class="lockerImg ${mains.lockerId}" style="cursor:pointer"><img class="imgs img${status.index}" src="${mains.lockerImage}"></div>
					 	<div class="locker_name">${mains.lockerTitle}</div>
					 	<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${mains.lockerContent}</div>
					 	<div class="locker_info">
					 		<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 : ~ ${mains.rentableDateEnd}</span>
					 		<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${mains.lockerSize}</span>
					 	</div>
					 </div>
				 </c:forEach>
			 </div>
			 
			 <div class="list2">
			 	<c:forEach items="${mainList}" var="mains" begin="0" end="1" varStatus="status">
					 <div class="locker_area">
					 	<div class="lockerImg ${mains.lockerId}" style="cursor:pointer"><img class="imgs img${status.index}" src="${mains.lockerImage}"></div>
					 	<div class="locker_name">${mains.lockerTitle}</div>
					 	<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${mains.lockerContent}</div>
					 	<div class="locker_info">
					 		<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 : ~ ${mains.rentableDateEnd}</span>
					 		<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${mains.lockerSize}</span>
					 	</div>
					 </div>
				 </c:forEach>
			 </div>
			 
			 <div class="list3">
			 	<c:forEach items="${mainList}" var="mains" begin="2" end="3" varStatus="status">
					 <div class="locker_area">
					 	<div class="lockerImg ${mains.lockerId}" style="cursor:pointer"><img class="imgs img${status.index}" src="${mains.lockerImage}"></div>
					 	<div class="locker_name">${mains.lockerTitle}</div>
					 	<div class="locker_location"><i class="fas fa-map-marker-alt"></i> 위치 : ${mains.lockerContent}</div>
					 	<div class="locker_info">
					 		<span id="date"><i class="far fa-calendar-alt"></i> 대여가능기간 : ~ ${mains.rentableDateEnd}</span>
					 		<span id="size"><i class="fas fa-box-open"></i> 사이즈 : ${mains.lockerSize}</span>
					 	</div>
					 </div>
				 </c:forEach>
			 </div>

			</div>
		</div>
        
<script type="text/javascript">

	const IdArr = new Array();
	
	for(let i = 0; i < 7; i++) {
		IdArr[i] = document.querySelectorAll('.lockerImg')[i].classList[1];
	};
	
	for(let i = 0; i < 4; i++){
		
		document.getElementsByClassName(IdArr[i])[1].addEventListener('click',() =>{
			location.href='/rentalLocker/rental-form?lockerId='+IdArr[i];
		}); 
		
		document.getElementsByClassName(IdArr[i])[0].addEventListener('click',() =>{
			location.href='/rentalLocker/rental-form?lockerId='+IdArr[i];
		});
	}

	let lockerImage = null;
	
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
	
	<c:forEach var="lockerImg" items="${mainList}" begin="5" end="8" varStatus="status">
		lockerImage =  "${lockerImg.lockerImage}";
		if(lockerImage == "0"){
			const contentType = 'image/png';
			
			const base64 = "${lockerImg.imgToClob}";

			const blob = b64toBlob(base64, contentType);
			
			const blobUrl = URL.createObjectURL(blob);	
			
			var imgs = document.querySelectorAll(".img${status.index}");
			for (var i = 0; i < imgs.length; i++) {
				  var item = imgs.item(i);
				  item.src = blobUrl;
			}
		}
	</c:forEach>

    </script>



</body>
</html>