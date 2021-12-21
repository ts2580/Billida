(() => {
	
	window.resizeImage = function resizeImage(img) {
		return new Promise(async function(resolve,reject){
				
				let width = document.querySelector(".base64Img").width;
				let height = document.querySelector(".base64Img").height;
				
				let canvas = document.createElement('canvas');
        		let	ctx = canvas.getContext('2d');
	
				canvas.width = width;
				canvas.height = height;
				
				ctx.drawImage(img, 0, 0, width, height);
			
				let resizedUrl = canvas.toDataURL();
				
				base64 = resizedUrl.split("base64,")[1];
				document.querySelector('input[name="imgToClob"]').value = base64;
				
				const contentType = 'image/png';
				const blob = b64toBlob(base64, contentType);
			
				const blobUrl = URL.createObjectURL(blob);	
				img.src = blobUrl;
				resolve(resizedUrl);
			
		})
	};
})()