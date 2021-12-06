(() => {
	
	
	/* 스크립트 순서 주의! */
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
		
	const rentableDateStart = document.querySelector('input[name="rentableDateStart"]');
	const rentableDateEnd = document.querySelector('input[name="rentableDateEnd"]');
	
	let selectDoRo = "";
	
	rentableDateStart.setAttribute("min", today);
	rentableDateEnd.setAttribute("min", today);
	
    
    document.querySelector(".jusoBtn").addEventListener('click', () => {
		new daum.Postcode({
        	oncomplete: function(data) {
                
        		if (data.userSelectedType === 'R') {
                	// 도로명주소 선택
                    document.querySelector(".roadAddrPart1").value = data.roadAddress;
                } else {
                	document.querySelector(".roadAddrPart1").value = data.jibunAddress;
                }
                
                selectDoRo = data.roadAddress;
                document.querySelector('input[name="location"]').value = data.jibunAddress;
                document.querySelector(".roadAddrPart2").focus();
               
                
                let addr = data.address;
                
                geocoder.addressSearch(data.address, function(results, status) {
                    if (status === daum.maps.services.Status.OK) {

                        let result = results[0];

                        let coords = new daum.maps.LatLng(result.y, result.x);
                        
                        document.querySelector('input[name="longitude"]').value = result.x;
                        document.querySelector('input[name="latitude"]').value = result.y;
                        
                        mapContainer.style.display = "block";
                        map.relayout();
                        map.setCenter(coords);
                        marker.setPosition(coords)
                    }
               });
             }
        }).open();
	});
    
    document.querySelector("#image").addEventListener('change', event => {
		
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
		
		
		let reader = new FileReader(); 
		
		reader.onload = function(event){ 
			
			let uploadedImg = document.querySelector(".base64Img");
			
			if(uploadedImg != null){
				uploadedImg.remove();
			}
			
			let img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			img.classList.add("base64Img");
			
			document.querySelector(".image_container").appendChild(img); 
			document.querySelector(".pic").style.display = "none";
			const base64Img = img.src.split("base64,");
			
			const contentType = 'image/png';
			const blob = b64toBlob(base64Img[1], contentType);
			
			document.querySelector('input[name="imgToClob"]').value = base64Img[1];
			
			const blobUrl = URL.ctcreateObjeURL(blob);	
			img.src = blobUrl;
		}; 
		reader.readAsDataURL(event.target.files[0]); 
		// readAsDataURL에 대해 더 알아볼것
	});
	
	
	document.querySelector(".submitButton").addEventListener('click', event => {
           
        document.querySelector('input[name="lockerContent"]').value = selectDoRo +" "+ document.querySelector(".roadAddrPart2").value;
		
		const rentableDateStartValue = rentableDateStart.valueAsNumber;
		const rentableDateEndValue = rentableDateEnd.valueAsNumber;
		
		const  isWrongDate = Boolean(rentableDateStartValue > rentableDateEndValue);
		
		if(document.querySelector('input[name="lockerTitle"]').value == ""){
			alert("보관함 이름을 입력해주세요");
			event.preventDefault();
		}else if(document.querySelector('input[name="lockerContent"]').value == " "){
			alert("주소를 입력해주세요");
			event.preventDefault();
		}else if(document.querySelector('input[name="imgToClob"]').value == ""){
			alert("이미지를 업로드해 주세요");
			event.preventDefault();
		}else if(document.querySelector('input[name="lockerPassword"]').value == ""){
			alert("비밀번호를 입력해주세요");
			event.preventDefault();
		}else if(isNaN(rentableDateStartValue) && isNaN(rentableDateEndValue)){
			alert("임대 시작일과 종료일을 입력해주세요");
			event.preventDefault();
		}else if(isNaN(rentableDateStartValue)){
			alert("임대 시작일을 입력해주세요.");
			event.preventDefault();
		}else if(isNaN(rentableDateEndValue)){
			alert("임대 종료일을 입력해주세요.");
			event.preventDefault();
		}else if(isWrongDate){
			alert("대여 시작일이 대여 종료일보다 앞설 수 없습니다.");
			event.preventDefault();
		}else{
			alert("보관함 빌려주기가 완료되었습니다. \n이용해주셔서 감사합니다.");
			document.querySelector(".submitButton").getAttributeNode("type").value = "submit";
		};
     });
	
    
    
	
	
})();