function costInput(cost){
	switch (cost) {
	case 'cost1':
		document.getElementById('mileage').value = 5000;
		document.querySelector("#mileage").innerText = "5,000"
		break;
	case 'cost2':
		document.getElementById('mileage').value = 10000;
		document.querySelector("#mileage").innerText = "10,000"
		break;
	case 'cost3':
		document.getElementById('mileage').value = 50000;
		document.querySelector("#mileage").innerText = "50,000"
	break;
	case 'cost4':
		document.getElementById('mileage').value = 100000;
		document.querySelector("#mileage").innerText = "100,000"
	break;

	default:
		break;
	}
}

function payment(){
	let mileage = document.getElementById('mileage').value;
	
	console.log("충전금액 : " + mileage);
	
	var IMP = window.IMP;
	IMP.init('imp48740916'); //내 식별코드
	var msg;
	
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card', //지불수단
	    merchant_uid: 'merchant_' + new Date().getTime(), // 내 사이트에서 관리하는 주문 번호
	    name : "마일리지 충전", 
	    amount : mileage, //결제 가격
	    buyer_email : document.getElementById('userEmail').value, //결제하는 사람 이메일
	    buyer_name : document.getElementById('userName').value, //결제하는 사람 이름
	    buyer_tel : document.getElementById('userTell').value, //결제하는 사람 번호
	    buyer_addr : document.getElementById('userAddress').value, //결제하는 사람 주소
	  
	}, function(rsp) {
			console.log(rsp);
			//결제 검증(거래고유번호 검증)
			$.ajax({
				type : "POST",
				url : "/paymentInfo/" + rsp.imp_uid   
			}).done(function(data){
				console.log(data);
				console.log("주문번호  :" + data.response.impUid);
				
				const orderNum = data.response.impUid;
				console.log("orderNum : " + orderNum);
				
				if(rsp.paid_amount == data.response.amount){
					document.getElementById('orderNum').value = orderNum;
					alert("결제가 완료되었습니다.");
					document.payment_frm.submit();
				}else{
					var msg = '결제에 실패하였습니다. \n';
			        msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
	});
}