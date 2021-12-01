(() => {
	
	var mapContainer = document.getElementById('map'),
		mapOption = {
		    center: new daum.maps.LatLng(longitude, latitude),
		    level: 3
		};
			
	var map = new daum.maps.Map(mapContainer, mapOption);
	var geocoder = new daum.maps.services.Geocoder();
	var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(longitude, latitude),
		map: map
	});
	
	
})();