(() => {
	
	
	const submitButton = document.querySelector(".submitButton");
	
	submitButton.addEventListener('click', event => {
           
		const rentableDateStart = document.querySelector('input[name="rentableDateStart"]').valueAsNumber;
		const rentableDateEnd = document.querySelector('input[name="rentableDateEnd"]').valueAsNumber;
		
		const  isWrongDate = Boolean(rentableDateStart > rentableDateEnd);
        
        if(auth == ""){
			alert("로그인을 해야 이용 가능한 기능입니다.");
			event.preventDefault();
		}else if(document.querySelector('input[name="lockerTitle"]').value == ""){
			alert("택배함 이름을 입력해주세요");
			event.preventDefault();
		}else if(document.querySelector('input[name="lockerContent"]').value == ""){
			alert("주소를 입력해주세요");
			event.preventDefault();
		}else if(document.querySelector('input[name="imgToClob"]').value == ""){
			alert("이미지를 업로드해 주세요");
			event.preventDefault();
		}else if(document.querySelector('input[name="lockerPassword"]').value == ""){
			alert("비밀번호를 입력해주세요");
			event.preventDefault();
		}else if(isNaN(rentableDateStart) && isNaN(rentableDateEnd)){
			alert("임대 시작일과 종료일을 입력해주세요");
			event.preventDefault();
		}else if(isNaN(rentableDateStart)){
			alert("임대 시작일을 입력해주세요.");
			event.preventDefault();
		}else if(isNaN(rentableDateEnd)){
			alert("임대 종료일을 입력해주세요.");
			event.preventDefault();
		}else if(isWrongDate){
			alert("대여 시작일이 대여 종료일보다 앞설 수 없습니다.");
			event.preventDefault();
		};
     });
	
    
    
	
	
})();