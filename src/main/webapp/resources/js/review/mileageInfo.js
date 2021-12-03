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

