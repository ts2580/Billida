(() => {
	
	rentCost = null;
	
	const b64toBlob = (b64Data, contentType='', sliceSize=512) => {
		const byteCharacters = atob(b64Data);
		const byteArrays = [];

		for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
			
			const slice = byteCharacters.slice(offset, offset + sliceSize);
			const byteNumbers = new Array(slice.length);
			    
			for (let i = 0; i < slice.length; i++) {
				byteNumbers[i] = slice.charCodeAt(i);
			};

			const byteArray = new Uint8Array(byteNumbers);
				byteArrays.push(byteArray);
			};
			
			const blob = new Blob(byteArrays, {type: contentType});
			
			return blob;
	};
		
	if(lockerImage != "0"){
		document.querySelector(".pic").setAttribute("src", baseImg);
	}else{
		const contentType = 'image/png';
		const blob = b64toBlob(base64, contentType);
		const blobUrl = URL.createObjectURL(blob);	
		
		document.querySelector(".pic").setAttribute("src", blobUrl);
	};
	
	
	let leftX = (document.body.offsetWidth / 2)-250;
	let topY= (window.screen.height / 2)-250;
	
	document.querySelector(".map").setAttribute("onclick", "window.open('/rentalLocker/map', '_blank', "
		+ "'width=500px, height=500px, toolbars=no, scrollbars=no, left=" + leftX + "px, top="+ topY +"px'); return false;");
	
	
	const commonFnc = () => {
			
		let rentStartToNumber = document.querySelector('input[name="rentStart"]').valueAsNumber;
		let rentEndToNumber = document.querySelector('input[name="rentEnd"]').valueAsNumber;
		rentCost = (rentEndToNumber-rentStartToNumber)/172800+500;
			
		let rentEndBeforeRentStart = false;
			
		if(!isNaN(rentCost) && rentEndToNumber < rentStartToNumber){
			rentEndBeforeRentStart = true;
		};
			
		let costDiv = document.querySelector(".cost"); 
			
		if(rentEndBeforeRentStart){
			costDiv.classList.add("inputFail");
				costDiv.innerText = "정확한 날자를 입력해 주세요.";
		}else if(isNaN(rentCost)){
			costDiv.classList.remove("inputFail");
			costDiv.innerText = "계산중입니다.";
		}else{
			costDiv.classList.remove("inputFail");
			costDiv.innerText = rentCost+"원";
		};
	};
	
	
	
	document.querySelector('input[name="rentStart"]').addEventListener('input', () => {
		commonFnc();
	});
	
	document.querySelector('input[name="rentEnd"]').addEventListener('input', () => {
		
		// 따로 따로 안걸어주면 rentStart랑 rentEnd 동시에 클릭한것처럼 값이 들어가서 꼬임
		commonFnc();
	});
	
	
	document.querySelector('.submitButton').addEventListener('click', (event) => {	
		
		let rentStartToNumber = document.querySelector('input[name="rentStart"]').valueAsNumber;
		let rentEndToNumber = document.querySelector('input[name="rentEnd"]').valueAsNumber;
		
		if(isRented == 1){
			let btn = document.querySelector(".submitButton");
			btn.innerText = "";
			btn.innerText = "*대여중인 보관함입니다*";
			alert("대여중인 보관함입니다");
			event.preventDefault();
		}else if(isNaN(rentStartToNumber) && isNaN(rentEndToNumber)){
			alert("대여 시작일과 종료일을 입력해주세요");
			event.preventDefault();
		}else if(isNaN(rentStartToNumber)){
			alert("대여 시작일을 입력해주세요");
			event.preventDefault();
		}else if(isNaN(rentEndToNumber)){
			alert("대여 종료일을 입력해주세요");
			event.preventDefault();
		}else if(rentStartToNumber > rentEndToNumber){
			alert("대여 시작일이 대여 종료일보다 앞설 수 없습니다.");
			event.preventDefault();
		}else if(RantalMileage == "" || RantalMileage < rentCost){
			alert("마일리지가 부족합니다. \n마일리지를 충전해주세요.");
			location.href = 'http://localhost:9090/mileage/mileageInfo';
		}else{
			alert("보관함 대여가 완료되었습니다. \n이용해주셔서 감사합니다");
			document.querySelector(".submitButton").getAttributeNode("type").value = "submit";
		};
	
	
	});
		
		
	let reviewNum = 0;	
	
	if(isNaN(scoreArr[reviewNum])){
		
		let noReview = document.createElement("div");
		noReview.classList.add("thereIsNoReview");
		noReview.append("*등록된 리뷰가 없습니다*");
		document.querySelector(".contents-form-reply").appendChild(noReview);
	}
	
	while(!isNaN(scoreArr[reviewNum])){
		
		let scoreNum = scoreArr[reviewNum];
		let starScore = ""
		let halfStar = "☆";
		let star = "★";
		
		let face = null;
		
		if(scoreNum <= 1.5){
			face = "fa-frown-open";
		}else if(scoreNum <= 3){
			face = "fa-meh";
		}else if(scoreNum <= 4){
			face = "fa-smile-wink";
		}else{
			face = "fa-smile-beam";
		};
		
		
		if(scoreNum*2%2 == 0){
			for(let j=0; j <scoreNum; j++){
				starScore = starScore.concat(star);
			}
		}else{
			for(let j=0; j <(scoreNum-1); j++){
				starScore = starScore.concat(star);
			};
			starScore = starScore.concat(halfStar);
		};
		
		let createReply = document.createElement("div");
		createReply.classList.add("reply");
		createReply.classList.add("reply_"+reviewNum);
		document.querySelector(".contents-form-reply").appendChild(createReply);
	
		let selectReply = document.querySelector(".reply_"+reviewNum);
	
		let icon = document.createElement("i");
		icon.classList.add("far");
		icon.classList.add(face);
		selectReply.appendChild(icon);
	
		let rC = document.createElement("div");
		rC.classList.add("reply-contents");
		rC.classList.add("reply-contents_"+reviewNum);
		selectReply.appendChild(rC);
	
		let rCDiv = document.querySelector(".reply-contents_"+reviewNum);
	
		let rCU = document.createElement("div");
		rCU.classList.add("reply-contents-userInfo");
		rCU.classList.add("reply-contents-userInfo_"+reviewNum);
		rCDiv.appendChild(rCU);
	
		let rCUDiv = document.querySelector(".reply-contents-userInfo_"+reviewNum);
	
		let rCUU = document.createElement("div");
		rCUU.classList.add("reply-contents-userInfo-userCode");
		rCUU.classList.add("reply-contents-userInfo-userCode_"+reviewNum);
		rCUU.append(idArr[reviewNum]);
		rCUDiv.appendChild(rCUU);
	
		let rCUS = document.createElement("div");
		rCUS.classList.add("reply-contents-userInfo-score");
		rCUS.classList.add("reply-contents-userInfo-score_"+reviewNum);
		rCUS.append(starScore);
		rCUDiv.appendChild(rCUS);
	
		let rCUD = document.createElement("div");
		rCUD.classList.add("reply-contents-userInfo-date");
		rCUD.classList.add("reply-contents-userInfo-date_"+reviewNum);
		rCUD.append(dateArr[reviewNum]);
		rCUDiv.appendChild(rCUD);
	
		let rCR = document.createElement("div");
		rCR.classList.add("reply-contents-reply");
		rCR.append(contentsArr[reviewNum]);
		rCDiv.appendChild(rCR);
		
		reviewNum++;
		
	};
	
	
	
    
	
	

	
	
	
})();