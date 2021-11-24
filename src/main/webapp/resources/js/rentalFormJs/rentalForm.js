(() => {
	
	for(let i = 0; i < 5; i++){
		
		
		let starScore = ""
		let halfStar = "☆";
		let star = "★";
		
		if(scoreArr[i]*2%2 == 0){
			for(let j=0; j <scoreArr[i]; j++){
				starScore = starScore.concat(star);
			}
		}else{
			for(let j=0; j <(scoreArr[i]-1); j++){
				starScore = starScore.concat(star);
			};
			starScore = starScore.concat(halfStar);
		};
		
		
		
		
		let createReply = document.createElement("div");
		createReply.classList.add("reply");
		createReply.classList.add("reply_"+i);
		document.querySelector(".contents-form-reply").appendChild(createReply);
	
		let selectReply = document.querySelector(".reply_"+i);
	
		let icon = document.createElement("i");
		icon.classList.add("far");
		icon.classList.add("fa-smile-beam");
		selectReply.appendChild(icon);
	
		let rC = document.createElement("div");
		rC.classList.add("reply-contents");
		rC.classList.add("reply-contents_"+i);
		selectReply.appendChild(rC);
	
		let rCDiv = document.querySelector(".reply-contents_"+i);
	
		let rCU = document.createElement("div");
		rCU.classList.add("reply-contents-userInfo");
		rCU.classList.add("reply-contents-userInfo_"+i);
		rCDiv.appendChild(rCU);
	
		let rCUDiv = document.querySelector(".reply-contents-userInfo_"+i);
	
		let rCUU = document.createElement("div");
		rCUU.classList.add("reply-contents-userInfo-userCode");
		rCUU.classList.add("reply-contents-userInfo-userCode_"+i);
		rCUU.append(idArr[i]);
		rCUDiv.appendChild(rCUU);
	
		let rCUS = document.createElement("div");
		rCUS.classList.add("reply-contents-userInfo-score");
		rCUS.classList.add("reply-contents-userInfo-score_"+i);
		rCUS.append(starScore);
		rCUDiv.appendChild(rCUS);
	
		let rCUD = document.createElement("div");
		rCUD.classList.add("reply-contents-userInfo-date");
		rCUD.classList.add("reply-contents-userInfo-date_"+i);
		rCUD.append(dateArr[i]);
		rCUDiv.appendChild(rCUD);
	
		let rCR = document.createElement("div");
		rCR.classList.add("reply-contents-reply");
		rCR.append(contentsArr[i]);
		rCDiv.appendChild(rCR);
	};
	
	
	
	
	
	
})();