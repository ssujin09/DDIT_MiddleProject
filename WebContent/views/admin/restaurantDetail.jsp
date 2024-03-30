
<%@page import="admin.service.IRestaurantService"%>
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
	RestaurantVO rv = (RestaurantVO) request.getAttribute("rv");
BusinessVO bv = (BusinessVO) request.getAttribute("bv");
List<MenuVO> menuList = (List<MenuVO>) request.getAttribute("menuList");

String city = rv.getRstrntAddr().substring(0, 2);
String ctgryName = (String) request.getAttribute("ctgryName");
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

<script src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"/>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">

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
/* title1의 폰트 스타일 수정 */
.single-block.description.time_OL h2.title {
    font-family: 'Noto Sans KR', sans-serif; /* Google Fonts에서 가져온 폰트 명시 */
    font-weight: 700; /* 폰트 굵기 설정 (원하는 굵기로 조절) */
    font-size: 36px; /* 폰트 크기 설정 (원하는 크기로 조절) */
    line-height: 1.4; /* 원하는 줄 간격으로 조절 */
    margin-bottom: 15px; /* 아래 여백 조절 */
}
 .single-block.description.time_OL .product-info1 {
    margin-bottom: 20px; /* 가게 이름 아래 간격을 조절하세요 */
    line-height: 3.0; /* 원하는 줄 간격으로 조절하세요 */
}

/* 주소, 전화번호, 태그, 카테고리 디자인 수정 */
.single-block.description.time_OL .list-info1 li {
    font-size: 16px; /* 폰트 크기 조절 (원하는 크기로 변경) */
    line-height: 2.0; /* 원하는 줄 간격으로 조절하세요 */
}
.menu_food1 {
	width: 30%;
}

.menu_line1 {
	width: 40%; /* Adjust the width to leave space for dashes */
}

.menu_price1 {
	width: 10%;
}

/* Add a pseudo-element (::before) to create dashes */
.menu_line1::before {
	content: '---';
	display: inline-block;
	text-align: center;
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
							<h2>가게상세정보</h2>
						</div>

						<div class="col-lg-8 col-md-7 col-12" style="margin: 0 auto">
							<div class="single-block description time_OL">
								<div class="product-info1">
									<h2 class="title1"><%=rv.getRstrntName()%></h2>
									<div class="list-info1">
										<h4></h4>
										<li><span><i class="lni lni-map-marker"
												aria-hidden="true"></i></span><%=rv.getRstrntAddr()%></li>

										<li><span><i class="fa fa-phone"
												aria-hidden="true"></i></span><%=rv.getRstrntTel()%></li>
										<li><span><i class="fa fa-tag" aria-hidden="true"></i></span>
											<%=rv.getRstrntTag()%></li>
										<li><span><i class="fa fa-tag" aria-hidden="true"></i></span><%=ctgryName%></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- Start Single Block -->
							<div class="single-block description time_OL">
								<div class="OLState">
									<h3 class="time">
										<i class="fa fa-clock-o" aria-hidden="true"></i> 영업시간
									</h3>
								</div>
								<ul class="details-list">
									<li class="time">오픈시간 : <%=bv.getBsnOpentime()%></li>
									<li class="time">마감시간 : <%=bv.getBsnClosetime()%></li>
									<li class="time additional-info">휴게시간 : <%=bv.getBsnReststart()%>
										~ <%=bv.getBsnRestfinish()%>
									</li>
								</ul>
							</div>


							<!-- 2021-01-14 여기부터1!!!!!/////////////////////////////////////////////////////////////////////// -->
							<!-- Start Single Block -->
							<div class="single-block menu_box">
								<div class="menu_info">
									<h3>메뉴정보</h3>
									<div class="menu_list1">
										<table>
											<%
												int displayMenuCount = 10;
											for (int i = 0; i < Math.min(menuList.size(), displayMenuCount); i++) {
												MenuVO mv = menuList.get(i);
											%>




											<tr class="menu_iist_box1" style="margin: 0 auto">
												<td class="menu_food1"><%=mv.getMenuName()%></td>
												<td class="menu_line1">--------------------------------------------------</td>
												<td class="menu_price1"><%=mv.getMenuPrice()%></td>
											</tr>

											<%
												}
											%>




										</table>

									</div>
								</div>
							</div>
							<div class="row justify-content-end mt-4">
								<div class="col-md-6 text-end">
									<a
										href="../admin/rstrntDetail.do?rstrntCode=<%=rv.getRstrntCode()%>&param=update"
										class="btn btn-primary">수정</a> 
										
										
<%-- 										<a href="../admin/rstrntDelete.do?rstrntCode=<%=rv.getRstrntCode()%>&city=<%=city%>" --%>
<!-- 										class="btn btn-danger" -->
<!-- 										onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a> -->
										
										<a href="#"
										class="delete-rst"
										data-rst-code="<%=rv.getRstrntCode()%>"
										data-city-code="<%=city%>"
										><i class="btn btn-danger">삭제</i></a>
								</div>
							</div>
							<!-- End Single Block -->
							<!-- Start Single Block -->

							<!-- End Single Block -->
						</div>
					</div>
					<!-- End Single Block -->
					<!-- 			</div> -->
				</div>
			</div>
		</div>
	</section>
	<!-- Pagination 끝-->
<script type="text/javascript">
    $(document).ready(function() {
        $('.delete-rst').click(function(e) {
            e.preventDefault();

            var rstrntCode = $(this).data('rst-code');
			var city = $(this).data('city-code');
            Swal.fire({
                title: '게시물을 삭제하시겠습니까?',
                text: '삭제한 게시물은 복구할 수 없습니다.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '삭제',
                cancelButtonText: '취소',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 확인을 누른 경우
                    window.location.href = '../admin/rstrntDelete.do?rstrntCode='+rstrntCode+'&city='+city;
                } else {
                    // 사용자가 취소 또는 거절을 누른 경우
                    Swal.fire('취소되었습니다.', '', 'info');
                }
            });
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