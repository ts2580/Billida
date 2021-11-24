let moveForm = $("#moveForm");

$(".pageInfo li").on("click", function(e){
	 e.preventDefault();
     moveForm.find("input[name='pageNum']").val($(this).attr("href"));
     moveForm.attr("action", "review-list");
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
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})