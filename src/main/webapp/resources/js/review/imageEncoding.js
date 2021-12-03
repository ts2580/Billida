
const b64toBlob = (b64Data, contentType='', sliceSize=512) => {
	  const byteCharacters = atob(b64Data);
	  const byteArrays = [];

	  for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
	    const slice = byteCharacters.slice(offset, offset + sliceSize);

	    const byteNumbers = new Array(slice.length);
	    for (let i = 0; i < slice.length; i++) {
	      byteNumbers[i] = slice.charCodeAt(i);
	    }

	    const byteArray = new Uint8Array(byteNumbers);
	    byteArrays.push(byteArray);
	  }

	  const blob = new Blob(byteArrays, {type: contentType});
	  return blob;
}


console.log("js리스트 값 : " +list);
console.log("js클롭리스트 값 : " +clobList);

let lockerImage = null;
for (var i = 0; i < list.length; i++) {
	lockerImage = list[i];
	
	if(lockerImage == "0"){
		const contentType = 'image/png';
		const base64 = clobList[i];
		const blob = b64toBlob(base64, contentType);
		const blobUrl = URL.createObjectURL(blob);	
		document.querySelector(".img"+i).src = blobUrl;
	}
}