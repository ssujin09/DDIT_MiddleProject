
<%@page import="restaurant.vo.MenuVO"%>
<%@page import="restaurant.vo.BusinessVO"%>
<%@page import="restaurant.vo.RestaurantVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.service.Paging"%>
<%@page import="admin.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	
%>

<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>맛있을지도 🧑‍🍳</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.svg" />
<!-- Place favicon.ico in the root directory -->

<!-- Web Font -->

<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/LineIcons.2.0.css" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/animate.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/tiny-slider.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/glightbox.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/main.css" />


<!-- 폰트어썸 CDN -->
<script src="https://kit.fontawesome.com/1cc7793b32.js"
	crossorigin="anonymous"></script>

<!-- jQuery CDN -->
<script
	src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>

<style>
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
 /* 메뉴 이름과 메뉴 가격 간격 조절 */
    .menu_list .menu_iist_box .menu_food input,
    .menu_list .menu_iist_box .menu_price input {
        margin-right: 10px; /* 조절하고자 하는 간격 크기 설정 */
    }

    /* 메뉴 추가 버튼과 테이블 간격 조절 */
    #addMenuBtn {
        margin-top: 10px; /* 조절하고자 하는 간격 크기 설정 */
    }
/*  .single-block.description.time_OL1 { */
/*         text-align: left; */
/*     } */

.single-block.description.time_OL1 {
    display: flex;
}

    .OLState1 {
        text-align: left;
    }

.details-list1 {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin-left: 10px; /* 원하는 여백 값으로 조절 */
}

/*     .details-list1 { */
/*         list-style-type: none; */
/*         padding: 0; */
/*     } */

    .time1 {
        text-align: left;
        margin-top : 20px;
        margin-left : 0px;
    }
    .time additional-info1{
     text-align: left;
    }
    

.btn-insert {
	display: inline-block;
	font-size: 15px;
	font-weight: 500;
	padding: 10px 20px;
	background-color: #5830E0;
	color: #fff;
	border: none;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	border-radius: 4px;
	width: 70px; /* Width adjustment */
	margin-right: 10px; /* Spacing between buttons */
}

.btn-cancel {
	display: inline-block;
	font-size: 15px;
	font-weight: 500;
	padding: 10px 20px;
	background-color: #ddd; /* Adjust the color as needed */
	color: #333; /* Adjust the color as needed */
	border: none;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	border-radius: 4px;
	width: 70px; /* Width adjustment */
}


 input[type="text"] {
        border: none;
        border-bottom: 1px solid #ddd; /* 밑줄 스타일 및 색상 지정 */
        outline: none; /* 포커스시 테두리 제거 */
        padding: 5px; /* 인풋박스 패딩 조정 */
    }

    /* 주소 입력 인풋박스에 밑줄 스타일 추가 */
    #addr1 {
        border-bottom: 1px solid #ddd; /* 메인 색상과 일치하도록 지정 */
    }

    /* 메뉴 이름과 가격 입력 인풋박스에 밑줄 스타일 추가 */
    .menu_iist_box input[type="text"] {
        border-bottom: 1px solid #ddd; /* 메인 색상과 일치하도록 지정 */
    }
    /* 간격 조절을 위한 스타일 추가 */
    .list-info li {
        margin-bottom: 10px; /* 간격 조절을 위한 마진 추가 */
    }

    /* 주소검색 버튼에도 마진 추가 */
    .address-btn {
        margin-left: 10px;
    }

.address-btn {
    background-color: #5830E0; /* 메인 색상과 일치하도록 지정 */
    color: #fff; /* 흰색 텍스트 색상 */
    border: none;
    padding: 3px 3px;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s; /* 마우스 호버 효과 */
}

.address-btn:hover {
    background-color: #4d25a1; /* 마우스 호버 시 배경색 변경 */
}
.table-responsive {
	position: relative;
}

.noticeInsert {
	display: inline-block;
	font-size: 15px;
	font-weight: 500;
	padding: 10px 20px;
	background-color: #5830E0;
	color: #fff;
	border: none;
	-webkit-transition: 0.5s;
	transition: 0.5s;
	border-radius: 4px;
	width: 70px;
	height: 40px;
	position: absolute;
	right: 20px;
	top: 0px; /* 테이블 오른쪽 위에 위치시킬 수 있는 값으로 조정해주세요 */
}
/* 페이지디자인 */
.pagination-container {
	display: flex;
	justify-content: center; /* 컨텐츠를 수평으로 정렬 */
	margin-top: 20px; /* 간격 조정 */
}

.pagination-list li a {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 30px; /* 아이콘 크기에 맞게 조정하세요 */
	height: 30px; /* 아이콘 크기에 맞게 조정하세요 */
}

.pagination-list li a i {
	text-align: center;
}

#addMenuBtn, .deleteMenuBtn {
    display: inline-block;
    font-size: 20px;
    background-color: #5830E0;
    color: #fff;
    border: none;
    padding: 0px 0px; /* 조절하고자 하는 padding 크기 설정 */
    border-radius: 50%; /* 동그랗게 만들기 위한 속성 */
    cursor: pointer;
    margin-left: 10px;
    height: 20px; /* 조절하고자 하는 height 크기 설정 */
    width: 20px; /* 조절하고자 하는 width 크기 설정 */
     line-height: 20px; /* 텍스트를 버튼의 가운데로 정렬하기 위한 속성 */
}
}

#addMenuBtn:hover, .deleteMenuBtn:hover {
	background-color: #4d25a1;
}
}

/* 카테고리 스타일 */
#categoryDropdown {
    background-color: #b19cd9; /* 옅은 보라색 */
    color: #fff; /* 흰색 텍스트 색상 */
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease; /* 부드러운 색상 전환을 위한 트랜지션 설정 */
}

#categoryDropdown:hover {
    background-color: #8a6ea3; /* 마우스 호버 시 배경색 변경 */
}
   .dropdown {
        position: relative;
        display: inline-block;
         margin-bottom: 10px;
    }

    .dropdown-content {
         display: none;
        position: absolute;
        background-color: #fff;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        z-index: 1;
        min-width: 200px;
        border: 1px solid #ddd;
        border-radius: 5px;
        max-height: 200px; /* 적절한 최대 높이로 조절하세요 */
        overflow-y: auto; /* 스크롤 활성화 */
    }

    .dropdown-content a {
        color: #333;
        padding: 12px 10px;
        text-decoration: none;
        display: block;
        transition: background-color 0.3s;
    }

    .dropdown-content a:hover {
        background-color: #f1f1f1;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .dropdown button {
        background-color: #3498db;
        color: #fff;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
    }
    .select-box {
    float: right; /* 오른쪽으로 이동 */
    /* 또는 다른 방법으로 위치 조정 가능 */
}

/* 카테고리 인풋 위치 오른쪽으로 옮기기 */
.category-input {
    float: right; /* 오른쪽으로 이동 */
    /* 또는 다른 방법으로 위치 조정 가능 */
}

</style>
</head>

<body>
	<!--[if lte IE 9]>
	      <p class="browserupgrade">
	        You are using an <strong>outdated</strong> browser. Please
	        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
	        your experience and security.
	      </p>
	    <![endif]-->

	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->



	<!-- Start Breadcrumbs -->


	<!-- Start Breadcrumbs -->

	<style>
/* 헤더디자인 */
.header.navbar-area {
	background-color: #fff; /* 배경색 */
	color: #333; /* 글자색 */
	/* 다른 스타일 속성들을 필요에 따라 추가할 수 있어요 */
}
</style>

	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">관리자게시판</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="index.html">관리자</a></li>
						<li>공지사항</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
	<!-- End Breadcrumbs -->
	<!-- End Breadcrumbs -->

	<!-- Start Blog Singel Area -->
	<!-- 	사이드바 start -->

	<style>
/* 사이드바디자인 */
.dashboard-sidebar {
	float: left;
	width: 250px; /* Adjust the width as needed */
	padding-right: 30px; /* Add some padding for spacing */
}

/* Style for the main content */
.blog-list {
	margin-left: 280px; /* Set margin to accommodate the sidebar */
}

/* Responsive style to handle smaller screens */
@media ( max-width : 768px) {
	.dashboard-sidebar {
		float: none;
		width: auto;
		padding-right: 0;
	}
	.blog-list {
		margin-left: 0;
	}
}
</style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.has-submenu > a').click(function(e) {
				e.preventDefault();

				// 토글 동작
				$(this).toggleClass('active');
				$(this).next('.submenu').slideToggle();
			});
		});
	</script>

	<div class="dashboard-sidebar">
		<div class="user-image">
			<img src="${pageContext.request.contextPath}/views/admin/관리자아이콘.png" alt="#">
			<h3>
				관리자 <span><a href="javascript:void(0)"></a></span>
			</h3>
		</div>
		<div class="dashboard-menu">
			<ul>
				<li id="noticeMenu"><a href="noticeList.do"><i
						class="lni lni-pencil-alt"></i> 공지사항</a></li>
				<li id="storeMenu" class="has-submenu"><a><i
						class="lni lni-restaurant"></i> 매장관리</a>
					<ul class="submenu" style="display: none;">
						<li><a href="../admin/restaurantList.do?city=서울">서울</a></li>
						<li><a href="../admin/restaurantList.do?city=경기">경기</a></li>
						<li><a href="../admin/restaurantList.do?city=인천">인천</a></li>
						<li><a href="../admin/restaurantList.do?city=대전">대전</a></li>
						<li><a href="../admin/restaurantList.do?city=충청">충청</a></li>
						<li><a href="../admin/restaurantList.do?city=강원">강원</a></li>
						<li><a href="../admin/restaurantList.do?city=전라">전라</a></li>
						<li><a href="../admin/restaurantList.do?city=경상">경상</a></li>
						<li><a href="../admin/restaurantList.do?city=대구">대구</a></li>
						<li><a href="../admin/restaurantList.do?city=부산">부산</a></li>
						<li><a href="../admin/restaurantList.do?city=제주">제주</a></li>
						<!-- 기타 서브메뉴 항목들을 여기에 추가 -->
					</ul></li>
				<li id="customerMenu"><a href="customerList.do"><i
						class="lni lni-users"></i> 회원관리</a></li>
				<li id="reportMenu"><a href="reportPostList.do"><i
						class="lni lni-bolt-alt"></i> 신고관리</a></li>

			</ul>
			<div class="button">
				<a class="btn" href="/TasteMap/logout.do">로그아웃</a>
			</div>
		</div>
	</div>

	<!-- 사이드바 끝 -->



	<section class="section latest-news-area blog-list">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-7 col-12"></div>
				<!-- 24-01-11/////////////////////////////////////////////////////////////////////// -->
				<div class="item-details-blocks">
					<div class="row">
						<div class="section-title">
							<h2>신규가게등록</h2>
						</div>
						<form class="rstrnt-update-form" method="post"
							enctype="multipart/form-data"
							action="<%=request.getContextPath()%>/admin/insertrstrnt.do">
							<div class="col-lg-8 col-md-7 col-12" style="margin: 0 auto">
								<div class="single-block description time_OL">
									<div class="product-info">
							<input type="hidden" id="count" name="count">
										<h4>
											가게이름:<input type="text" name="rstrntName">
										</h4>
										<div class="list-info">
											<li><span><i class="lni lni-map-marker"
													aria-hidden="true"></i></span>주소<input type="text" id="addr1"
												name="rstrntAddr">
													<button type="button" id="addrBtn"
														class="btn btn-info btn-sm address-btn">주소검색</button>
											</li>
											<li><span><i class="fa fa-phone"
													aria-hidden="true"></i></span>전화번호<input type="text"
												name="rstrntTel"></li>
											<li><span><i class="fa fa-tag" aria-hidden="true"></i></span>태그<input
												type="text" name="rstrntTag"></li>
											<li><span><i class="fa fa-tag" aria-hidden="true"></i></span>카테고리<input
												type="text" id ="selectedCategory" name="rstrntCtgry"></li>
												<input type="hidden" id="categoryCode" name="categoryCode">
												
												<!-- 카테고리 드롭다운 추가 -->
<div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" id="categoryDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        카테고리 선택
    </button>
    <div class="dropdown-content" id="categoryList">
        <a href="#" data-category="칼국수">칼국수</a>
        <a href="#" data-category="카페">카페</a>
        <a href="#" data-category="분위기좋은">분위기좋은</a>
        <a href="#" data-category="돈까스">돈까스</a>
        <a href="#" data-category="스시">스시</a>
        <a href="#" data-category="삼겹살">삼겹살</a>
        <a href="#" data-category="삼겹살">삼겹살</a>
        <a href="#" data-category="중화요리">중화요리</a>
        <a href="#" data-category="백반">백반</a>
        <a href="#" data-category="데이트">데이트</a>
        <a href="#" data-category="가성비맛집">노포</a>
        <a href="#" data-category="오마카세">오마카세</a>
        <a href="#" data-category="소고기">소고기</a>
        <a href="#" data-category="빵">빵</a>
        <a href="#" data-category="갈비">갈비</a>
        <a href="#" data-category="혼밥">혼밥</a>
        <a href="#" data-category="중식당">중식당</a>
    </div>
</div>
<!-- 카테고리 드롭다운 끝 -->

						

										</div>
									</div>
								</div>
								<!-- Start Single Block -->
								<div class="single-block description time_OL1">
									<div class="OLState1">
										<h4 class="time">영업시간</h4>

									<ul class="details-list1">

										<li class="time1">오픈시간 : <input type="text"
											name="rstrntOpen">
										</li>
										<li class="time1">마감시간 : <input type="text"
											name="rstrntclose">
										</li>
										<li class="time additional-info1">휴게시간 : <input
											type="text" name="rstrntSt"> ~ <input type="text"
											name="rstrntEnd">
										</li>
									</ul>
									</div>
								</div>


								<!-- 2021-01-14 여기부터1!!!!!/////////////////////////////////////////////////////////////////////// -->
								<!-- Start Single Block -->
								<div class="single-block menu_box">
									<div class="menu_info">
										<h4>메뉴정보</h4>
										<div class="menu_list">
											<table id="menuTable">
												<%-- <% int displayMenuCount=10; for (int i=0; i < Math.min(menuList.size(), displayMenuCount); i++) { MenuVO mv=menuList.get(i); %> --%>
													
												<tr class="menu_iist_box">
												
													<td class="menu_food"><input type="text"
														name="menuName" placeholder="메뉴 이름"></td>

													<td class="menu_price"><input type="text"
														name="menuPrice" placeholder="메뉴 가격"></td>
												</tr>
											</table>
											<!-- 메뉴 추가 버튼 -->
											<button type="button" id="addMenuBtn">+</button>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="text-end">
										<button type="submit" class="btn-insert">등록</button>
										<button type="button" class="btn-cancel">
											<a href="./restaurantList.do?city=서울">취소</a>
										</button>
									</div>
								</div>

								<!-- End Single Block -->
								<!-- Start Single Block -->

								<!-- End Single Block -->
							</div>
						</form>


					</div>
					<!-- End Single Block -->
					<!-- 			</div> -->
				</div>



			</div>
		</div>
	</section>
	<!-- Pagination 끝-->

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		//주소검색 api이용
		$('#addrBtn')
				.on(
						'click',
						function() {

							//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var roadAddr = data.roadAddress; // 도로명 주소 변수
											var extraRoadAddr = ''; // 참고 항목 변수

											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraRoadAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraRoadAddr += (extraRoadAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraRoadAddr !== '') {
												extraRoadAddr = ' ('
														+ extraRoadAddr + ')';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById("addr1").value = roadAddr;
											//	                 document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

										}
									}).open();

						});

		//메뉴추가		
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							let menuCounter = 1;
							
							console.log(menuCounter);
							document.getElementById("addMenuBtn")
									.addEventListener("click", function() {
										menuCounter++;
										document.getElementById("count").value=menuCounter;
										addMenuRow(menuCounter);
									});

							function addMenuRow(counter) {
								const menuNameInput = document
										.createElement("input");
								menuNameInput.type = "text";
								menuNameInput.name = "menuName";
								menuNameInput.placeholder = "메뉴 이름";

								const menuPriceInput = document
										.createElement("input");
								menuPriceInput.type = "text";
								menuPriceInput.name = "menuPrice";
								menuPriceInput.placeholder = "메뉴 가격";

								const deleteBtn = document
										.createElement("button");
								deleteBtn.type = "button";
								deleteBtn.className = "deleteMenuBtn";
								deleteBtn.innerText = "-";
								deleteBtn.addEventListener("click", function() {
									deleteMenuRow(deleteBtn);
								});

								const newRow = document.createElement("tr");
								newRow.className = "menu_iist_box";
								newRow.innerHTML = `<td class="menu_food"></td><td class="menu_price"></td><td class="menu_delete"></td>`;

								newRow.querySelector(".menu_food").appendChild(
										menuNameInput);
								newRow.querySelector(".menu_price")
										.appendChild(menuPriceInput);
								newRow.querySelector(".menu_delete")
										.appendChild(deleteBtn);

								document.getElementById("menuTable")
										.appendChild(newRow);
							}

							function deleteMenuRow(deleteBtn) {
								const rowToDelete = deleteBtn
										.closest(".menu_iist_box");
								if (rowToDelete) {
									rowToDelete.remove();
								}
							}

						});
		
		$(document).ready(function () {
		    // 카테고리를 선택하면 해당 값을 받아와서 고정시키는 이벤트
		    $('#categoryList a').click(function (e) {
		        e.preventDefault();
		        var selectedCategory = $(this).data('category');
		        var categoryCode = $(this).index() + 1; // 카테고리에 대응하는 값

		        // 해당 카테고리 값을 인풋박스에 설정
		        $('#selectedCategory').val(selectedCategory);
		        // 선택한 카테고리에 대응하는 값을 히든 필드에 설정
		        $('#categoryCode').val(categoryCode);
		    });
		});
	</script>
<%@ include file="adminFooter.jsp"%>


	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top btn-hover"> <i
		class="lni lni-chevron-up"></i>
	</a>

	<!-- ========================= JS here ========================= -->
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/wow.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/tiny-slider.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/glightbox.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
</body>

</html>