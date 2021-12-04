let moveForm = $("#moveForm");

$(".pageInfo li").on("click", function(e){
	 //li태그의 동작 멈춤
	 e.preventDefault();
	 //form태그 내부의 pageNum과 관련된 <input>태그의 value 속성값에, 클릭한 li태그의 페이지 번호 삽입시킴
     moveForm.find("input[name='pageNum']").val($(this).attr("href"));
     //form태그 action속성 추가 및 경로 추가
     moveForm.attr("action", "review-list");
     //form태그 서버로 전송
     moveForm.submit();
});

let openReviewForm = (reviewNum) =>{
	console.log(reviewNum);
	let reviewForm = createPopup({
	                url:'review-modifyForm?reviewNum='+reviewNum,
	                name:'',
	                width:522,
	                height:600
	             });
}

/* 모달 관련 js */
const modal = document.getElementById("modal");
/* 삭제버튼 클릭 시 모달 보여지도록 */
let openModal = (reviewNum) => {
	modal.style.display = "flex"
	document.getElementById("reviewNum").value = reviewNum;
}

$(function(){
		$('#modal').draggable();
});

/* 모달창에서 삭제버튼 클릭 시 href이동시켜 삭제처리 후 모달 none */
document.getElementById("deleteYes").addEventListener("click", e => {
		location.href = 'delete-review?reviewNum='+reviewNum.value;
		modal.style.display = "none";
})

/* 모달창에서 취소버튼 클릭 시 아무처리도 되지 않고 모달 none */
document.getElementById("deleteNo").addEventListener("click", e => {
	modal.style.display = "none";
})

/* 모달창 밖의 영역을 클릭 시 모달 none */
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
    }
})

/* 모달창의 x 클릭 시 모달 none */
const closeBtn = modal.querySelector("#xTitle")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})