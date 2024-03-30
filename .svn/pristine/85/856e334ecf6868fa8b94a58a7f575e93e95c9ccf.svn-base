<%@page import="restaurant.vo.RestaurantVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
     <title>맛있을지도 🧑‍🍳</title>
    
    <style type="text/css">
    
    	body, html {
    		height: 100%;
    		margin: 0;
    		overflow: hidden; /* 스크롤을 감추기 위해 추가 */
		}
		.map_wrap,
        .map_wrap * {
            margin: 0;
            padding: 0;
            font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
            font-size: 12px;
        }
        #map {
    		width: 100%;
    		height: 100%;
		}

        .map_wrap a,
        .map_wrap a:hover,
        .map_wrap a:active {
            color: #000;
            text-decoration: none;
        }

        .map_wrap {
            position: relative;
            width: 100%;
            height: 500px;
            height: 100vh;
            overflow: hidden;
        }

        #menu_wrap {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 250px;
            margin: 10px 0 30px 10px;
            padding: 5px;
            overflow-y: auto;
            background: rgba(255, 255, 255, 0.7);
            z-index: 1;
            font-size: 12px;
            border-radius: 10px;
            height: 95%;
        }

        .bg_white {
            background: #fff;
        }

        #menu_wrap hr {
            display: block;
            height: 1px;
            border: 0;
            border-top: 2px solid #5F5F5F;
            margin: 3px 0;
        }

        #menu_wrap .option {
            text-align: center;
        }

        #menu_wrap .option p {
            margin: 10px 0;
        }

        #menu_wrap .option button {
            margin-left: 5px;
        }

        #placesList li {
            list-style: none;
        }

        #placesList .item {
            position: relative;
            border-bottom: 1px solid #888;
            overflow: hidden;
            cursor: pointer;
            min-height: 65px;
        }

        #placesList .item span {
            display: block;
            margin-top: 4px;
        }

        #placesList .item h5,
        #placesList .item .info {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

        #placesList .item .info {
            padding: 10px 0 10px 55px;
        }

        #placesList .info .gray {
            color: #8a8a8a;
        }

        #placesList .info .jibun {
            padding-left: 26px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
        }

        #placesList .info .tel {
            color: #009900;
        }

        #placesList .item .markerbg {
            float: left;
            position: absolute;
            width: 36px;
            height: 37px;
            margin: 10px 0 0 10px;
            background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
        }

        #placesList .item .marker_1 {
            background-position: 0 -10px;
        }

        #placesList .item .marker_2 {
            background-position: 0 -56px;
        }

        #placesList .item .marker_3 {
            background-position: 0 -102px
        }

        #placesList .item .marker_4 {
            background-position: 0 -148px;
        }

        #placesList .item .marker_5 {
            background-position: 0 -194px;
        }

        #placesList .item .marker_6 {
            background-position: 0 -240px;
        }

        #placesList .item .marker_7 {
            background-position: 0 -286px;
        }

        #placesList .item .marker_8 {
            background-position: 0 -332px;
        }

        #placesList .item .marker_9 {
            background-position: 0 -378px;
        }

        #placesList .item .marker_10 {
            background-position: 0 -423px;
        }

        #placesList .item .marker_11 {
            background-position: 0 -470px;
        }

        #placesList .item .marker_12 {
            background-position: 0 -516px;
        }

        #placesList .item .marker_13 {
            background-position: 0 -562px;
        }

        #placesList .item .marker_14 {
            background-position: 0 -608px;
        }

        #placesList .item .marker_15 {
            background-position: 0 -654px;
        }

        #pagination {
            margin: 10px auto;
            text-align: center;
        }

        #pagination a {
            display: inline-block;
            margin-right: 10px;
        }

        #pagination .on {
            font-weight: bold;
            cursor: default;
            color: #777;
        }
        
@import
   url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap')
   ;
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
  font-family: 'GmarketSansMedium';
}
    
    </style>
</head>

<body>
    <p style="margin-top:-12px">
        <em class="link">
        </em>
    </p>
       <div class="map_wrap">
        <div id="map" style="width:100%;height:100vh;"></div>

        <div id="menu_wrap" class="bg_white">
            <div class="option">
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
        </div>
    </div>

    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ccd00174a49121da7c06055801ba062&libraries=services"></script>
<script>
let mapContainer = document.getElementById('map'); // 지도를 표시할 div 
let mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

// 지도를 생성합니다    
let map = new kakao.maps.Map(mapContainer, mapOption);
let bounds = new kakao.maps.LatLngBounds();
let infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

let markers = [];
let geocoder = new kakao.maps.services.Geocoder();
let addrs = [];

let rstrnt;

<%
    List<RestaurantVO> rl = (List) request.getAttribute("addrList");
    String thisAddress = (String) request.getAttribute("addr");

    for(int i = 0; i < rl.size(); i++) {
%>
    rstrnt = {
            "name": "<%=rl.get(i).getRstrntName()%>",
            "addr": "<%=rl.get(i).getRstrntAddr()%>",
            "tel": "<%=rl.get(i).getRstrntTel()%>",
            "code": "<%=rl.get(i).getRstrntCode()%>"
    };
    addrs.push(rstrnt);
<%
    }
%>
let thisAddr = "<%=thisAddress%>";

let listEl = document.getElementById('placesList');
let menuEl = document.getElementById('menu_wrap');
let fragment = document.createDocumentFragment();

let pagination = {
    current: 1,
    last: Math.ceil(addrs.length / 15),
    gotoPage: function (page) {
        this.current = page;
        removeAllChildNods(listEl);
        removeMarker();
        processAddresses((page - 1) * 15);
        displayPagination(this);
    }
};

// 기존 마커 제거 함수 수정
function removeMarker() {
    for (let i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
}

//마커를 추가하는 함수
function addMarker(position, idx) {
    let imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
        imageSize = new kakao.maps.Size(36, 37),
        imgOptions = {
            spriteSize: new kakao.maps.Size(36, 691),
            spriteOrigin: new kakao.maps.Point(0, (idx % 15 * 46) + 10),
            offset: new kakao.maps.Point(13, 37)
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao.maps.Marker({
            position: position,
            image: markerImage,
            zIndex: 1
        });

    marker.setMap(map);
    markers.push(marker);

    return marker;
}

// 페이지 이동 함수 수정
function processAddresses(index) {
    if (index < addrs.length && index < pagination.current * 15) {
        let title = addrs[index].name;

        let options = {
            page: 3,
            size: 15,
        }

        return new Promise((resolve) => {
            geocoder.addressSearch(addrs[index].addr, (result, status) => {
                if (status == kakao.maps.services.Status.OK) {
                    let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    bounds.extend(coords);
                    let marker = addMarker(coords, index);
                    let itemEl = getListItem(index, addrs[index]);
                    fragment.appendChild(itemEl);

                    (function (marker, index) {
                        kakao.maps.event.addListener(marker, 'mouseover', function () {
                            displayInfowindow(marker, addrs[index].name);
                        });

                        kakao.maps.event.addListener(marker, 'mouseout', function () {
                            infowindow.close();
                        });

                        itemEl.onmouseover = function () {
                            displayInfowindow(marker, addrs[index].name);
                        };

                        itemEl.onmouseout = function () {
                            infowindow.close();
                        };
                    })(marker, index);

                    resolve();
                } else {
                    resolve();
                }
            }, options);
        }).then(() => {
            processAddresses(index + 1);
        });
    } else {
        listEl.appendChild(fragment);
        map.setBounds(bounds);
    }
}

displayPagination(pagination);
processAddresses(0);

function getListItem(index, places) {
    let el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + ((index % 15) + 1) + '"></span>' +
            '<div class="info">' +
            '<h5><a href="http://localhost:8888/TasteMap/restaurantDetail.do?rstrntCode=' + encodeURIComponent(places.code) + '" target="_blank">' + places.name + '</a></h5>';
    itemStr += '    <span>' + places.addr + '</span>';
	
    if (places.tel && places.tel !== "null") {
		
    	itemStr += '  <span class="tel">' + places.tel + '</span>' +
        '</div>';
	} else {
    	itemStr += '  <span class="tel">'+ "전화번호 없음" +'</span>' +
        '</div>';
		
	}

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

function displayInfowindow(marker, title) {
    let content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

function removeAllChildNods(el) {
    while (el.hasChildNodes()) {
        el.removeChild(el.lastChild);
    }
}

function displayPagination(pagination) {
    let paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i;

    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild(paginationEl.lastChild);
    }

    for (i = 1; i <= pagination.last; i++) {
        let el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i === pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function (i) {
                return function () {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

function getStoreURL(places) {
    // 여기에 가게의 URL을 반환하는 로직을 추가
    // 예를 들어 가게의 상세 페이지 URL을 반환하거나, 특정 동작을 수행하는 JavaScript 함수를 호출할 수 있습니다.
    return 'https://example.com/store/' + encodeURIComponent(places.name);
}

</script>
</body>

</html>