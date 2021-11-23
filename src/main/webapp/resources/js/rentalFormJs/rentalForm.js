(() => {
	
	
	
	let reply = document.querySelector(".reply");
	
	let icon = document.createElement('i');
	icon.classList.add('far');
	icon.classList.add('fa-smile-beam');
	reply.appendChild(icon);
	
	let rC = document.createElement('div');
	rC.classList.add('reply-contents');
	reply.appendChild(rC);
	
	let rCDiv = document.querySelector(".reply-contents");
	
	let rCU = document.createElement('div');
	rCU.classList.add('reply-contents-userInfo');
	rCDiv.appendChild(rCU);
	
	let rCUDiv = document.querySelector(".reply-contents-userInfo");
	
	let rCUU = document.createElement('div');
	rCUU.classList.add('reply-contents-userInfo-userId');
	rCUU.append("아이디는11글자까지ㅎ");
	rCUDiv.appendChild(rCUU);
	
	let rCUS = document.createElement('div');
	rCUS.classList.add('reply-contents-userInfo-score');
	rCUS.append("★★★★☆");
	rCUDiv.appendChild(rCUS);
	
	let rCUD = document.createElement('div');
	rCUD.classList.add('reply-contents-userInfo-date');
	rCUD.append("2021/11/23");
	rCUDiv.appendChild(rCUD);
	
	let rCR = document.createElement('div');
	rCR.classList.add('reply-contents-reply');
	rCR.append("좋은 접근성 그리고 리뷰 내용은 200글자까지인데 다 쓰기에는 좀 많은듯");
	rCDiv.appendChild(rCR);
	
	
	
})();