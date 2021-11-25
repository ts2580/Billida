(() => {
	
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
	
	let btn = document.querySelector(".submitButton");
	
    if(auth == ""){
		btn.getAttributeNode("type").value = "button";
		btn.addEventListener('click', () =>{
		    alert("로그인을 해야 이용 가능한 기능입니다.");
        });
	}

	
	
	
})();