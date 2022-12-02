var map;
var lati,longi;
var infoWindow;
var markerList=[];
var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');

function map() {

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new naver.maps.LatLng(lati, longi), // 지도의 중심좌표
            zoom: 12, // 지도의 확대 레벨
            mapTypeControl: true
        };

    // 지도를 생성합니다
    map = new naver.maps.Map(mapContainer, mapOption);

    // 내 위치에 마커 띄우기
    var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(lati, longi),
        map: map
    });

    infoWindow = new naver.maps.InfoWindow({
        anchorSkew: true
    });

    map.setCursor('pointer');

    map.getPanes().floatPane.appendChild(menuLayer[0]);
    map.addListener('click', function(e) {
        searchCoordinateToAddress(e.coord);
        setMarkerAndInfo(e);
    });

    naver.maps.Event.addListener(map, 'keydown', function(e) {
        var keyboardEvent = e.keyboardEvent,
            keyCode = keyboardEvent.keyCode || keyboardEvent.which;

        var ESC = 27;

        if (keyCode === ESC) {
            keyboardEvent.preventDefault();

            for (var i=0, ii=markerList.length; i<ii; i++) {
                markerList[i].setMap(null);
            }

            markerList = [];
            menuLayer.hide();

        }
    });

    naver.maps.Event.addListener(map, 'mousedown', function(e) {
        menuLayer.hide();
    });
    function setMarkerAndInfo(e){
        var marker = new naver.maps.Marker({
            position: e.coord,
            map: map
        });

        markerList.push(marker);

        // var coordHtml = 'Point: ' + e.point + '<br />';
        //
        // menuLayer.show().css({
        //     left: e.offset.x-22,
        //     top: e.offset.y-90,
        //     borderRadius:20
        // }).html(coordHtml);

        console.log('Coord: ' + e.coord.toString());
    };

}

function searchCoordinateToAddress(latlng) {

    infoWindow.close();

    naver.maps.Service.reverseGeocode({
        coords: latlng,
        orders: [
            naver.maps.Service.OrderType.ADDR,
            naver.maps.Service.OrderType.ROAD_ADDR
        ].join(',')
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var items = response.v2.results,
            address = '',
            htmlAddresses = [];

        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
            item = items[i];
            address = makeAddress(item) || '';
            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
        }

        infoWindow.setContent([
            '<div style="padding:10px;min-width:200px;line-height:150%;">',
            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));

        infoWindow.open(map, latlng);
    });
}
function makeAddress(item) {
    if (!item) {
        return;
    }

    var name = item.name,
        region = item.region,
        land = item.land,

        isRoadAddress = name === 'roadaddr';

    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

    if (hasArea(region.area1)) {
        sido = region.area1.name;
    }

    if (hasArea(region.area2)) {
        sigugun = region.area2.name;
    }

    if (hasArea(region.area3)) {
        dongmyun = region.area3.name;
    }

    if (hasArea(region.area4)) {
        ri = region.area4.name;
    }

    if (land) {
        if (hasData(land.number1)) {
            if (hasData(land.type) && land.type === '2') {
                rest += '산';
            }

            rest += land.number1;

            if (hasData(land.number2)) {
                rest += ('-' + land.number2);
            }
        }

        if (isRoadAddress === true) {
            if (checkLastString(dongmyun, '면')) {
                ri = land.name;
            } else {
                dongmyun = land.name;
                ri = '';
            }

            if (hasAddition(land.addition0)) {
                rest += ' ' + land.addition0.value;
            }
        }
    }

    return [sido, sigugun, dongmyun, ri, rest].join(' ');
}

function hasArea(area) {
    return !!(area && area.name && area.name !== '');
}

function hasData(data) {
    return !!(data && data !== '');
}

function checkLastString (word, lastString) {
    return new RegExp(lastString + '$').test(word);
}

function hasAddition (addition) {
    return !!(addition && addition.value);
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
navigator.geolocation.getCurrentPosition(success, error, options);
