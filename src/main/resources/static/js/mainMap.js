var map;

function map() {

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new naver.maps.LatLng(lati, longi), // 지도의 중심좌표
            zoom: 12 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    map = new naver.maps.Map(mapContainer, mapOption);
    var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(lati, longi),
        map: map
    });
}

var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
};

function success(pos) {
    crd = pos.coords;
    lati = crd.latitude;
    longi = crd.longitude;

    //alert(crd.latitude+","+crd.longitude);

    map();
};

function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
};



var lati, longi;
navigator.geolocation.getCurrentPosition(success, error, options);