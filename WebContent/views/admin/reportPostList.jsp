<%@page import="admin.service.Paging"%>
<%@page import="community.vo.CommentVO"%>
<%@page import="admin.vo.CmmntyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<CmmntyVO> reportPostList = (List<CmmntyVO>) request.getAttribute("reportPostList");
	List<CommentVO> reportComList = (List<CommentVO>) request.getAttribute("reportComList");
	
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

<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.svg" />
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
	width: 140px;
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

.submenu {
	display: none;
}

.has-submenu.active .submenu {
	display: block;
}

}
.submenu {
	display: block;
	height: 0;
	overflow: hidden;
	transition: height 0.3s ease-out;
}

.has-submenu.active .submenu {
	height: auto; /* 자동으로 높이를 조절하도록 변경 */
}

.dropdown {
	display: inline-block;
	margin-right: 20px; /* 원하는 간격으로 조정 */
}

.dropdown-menu {
	min-width: 100%; /* 풀 너비로 설정 */
}
</style>
</head>
<script>
	// JavaScript를 사용하여 클릭 시 토글 기능 구현
	document.addEventListener('DOMContentLoaded', function() {
		var submenuItems = document.querySelectorAll('.has-submenu');

		for (var i = 0; i < submenuItems.length; i++) {
			submenuItems[i].addEventListener('click', function() {
				this.classList.toggle('active');
			});
		}
	});
</script>
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
						<li>신고관리</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
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
    @media (max-width: 768px) {
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
            <li id="noticeMenu"><a href="noticeList.do" ><i class="lni lni-pencil-alt"></i> 공지사항</a></li>
            <li id="storeMenu" class="has-submenu"><a><i class="lni lni-restaurant"></i> 매장관리</a>
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
                </ul>
            </li>
            <li id="customerMenu"><a href="customerList.do"><i class="lni lni-users"></i> 회원관리</a></li>
            <li id="reportMenu"><a href="reportPostList.do" class="active"><i class="lni lni-bolt-alt"></i> 신고관리</a></li>

        </ul>
        <div class="button">
            <a class="btn" href="/TasteMap/logout.do">로그아웃</a>
        </div>
    </div>
</div>


	<section class="section latest-news-area blog-list">
		<div class="container">
			<div class="row">
				<div class="col-lg-">
					<!-- Your existing "공지사항" section -->
					<div class="section-title">
						<h2>신고 관리</h2>
						<!-- 						<div class="button notice-insert"> -->
						<!-- 							<a href="warnCustomer.do" class="noticeInsert">경고회원보기</a> -->
						<!-- 						</div> -->

					</div>
					<nav class="list-nav">
						<ul>
							<li class="active"><a href="reportPostList.do">신고게시글목록<span><%=reportPostList.size() %></span> 
							</a></li>
							<li><a href="reportPostList.do?param=com">신고댓글목록 <span><%=reportComList.size() %></a></li>

						</ul>
					</nav>

					<div class="table-responsive">


						<!-- New table for notices -->
						<table class="table notice-table">
							<thead>
								<tr>
									<th style="width: 10%;">순번</th>
									<th style="width: 10%;">작성자</th>
									<th style="width: 40%;">게시글제목</th>
									<th style="width: 10%;">게시일자</th>
									<th style="width: 20%;">조회수</th>
								</tr>
							</thead>
								
<%
	
    // 목록 및 페이징 정보 가져오기
    int writing_Count = reportPostList.size(); //총 글의 갯수
    
    int cur_Page = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1; //현재페이지
    int w_Size = 10; // 페이지당 글의 수

    Paging pg = new Paging(w_Size, writing_Count, cur_Page);

    // 현재 페이지에 해당하는 글의 범위 계산
    int startIdx = pg.getStartIdx(); //글 범위 시작번호
    int endIdx = pg.getEndIdx();	//글 범위 끝번호
//     System.out.println(startIdx);
//     System.out.println(endIdx);
    List<CmmntyVO> currentList = reportPostList.subList(startIdx, endIdx);

    // 이전 페이지, 다음 페이지 URL 생성
    int prevPage = pg.getPage_Start() - 1;
    int nextPage = pg.getPage_End() + 1;
  
%>

							<tbody>
								<!-- Replace the example content with your actual notices -->

								<%
									if (reportPostList.size() == 0) {
								%>
								<tr>
									<td>0</td>
									<td>0</td>
									<td>신고 게시글이 없습니다</td>
								</tr>
								<%
									} else {
								int cnt = writing_Count-startIdx;
								for (CmmntyVO cv : currentList) {
								%>
								<tr>
									<td><%=cnt%></td>
									<td><%=cv.getCstmrId()%></td>
									<td><a
										href="../admin/reportPostDetail.do?cmmntyCode=<%=cv.getCmmntyCode()%>">
										<%=cv.getCmmntyTitle()%></a></td>
									<td><%=cv.getCmmntyDate()%></td>
									<td><%=cv.getCmmntyCount()%></td>

								</tr>

								<%
									cnt--;
								}
								}
								%>
								<!-- Add more rows for each notice -->
							</tbody>

						</table>
					</div>

					<!-- 페이지 번호 버튼 부분 시작-->
					<div class="pagination-container">
						<div class="pagination left">
							<ul class="pagination-list">
								<!-- 이전 페이지로 이동하는 링크 -->
								<%
									if (prevPage >= 1) {
								%>
								<li><a href="?page=<%=prevPage%>"><i
										class="lni lni-chevron-left"></i></a></li>
								<%
									} else {
								%>
								<li class="disabled"><span><i
										class="lni lni-chevron-left"></i></span></li>
								<%
									}
								%>

								<!-- 페이지 번호 출력 -->
								<%
									for (int i = pg.getPage_Start(); i <= pg.getPage_End(); i++) {
								%>
								<li class="<%=(i == cur_Page) ? "active" : ""%>"><a
									href="?page=<%=i%>"><%=i%></a></li>
								<%
									}
								%>

								<!-- 다음 페이지로 이동하는 링크 -->
								<%
									if (nextPage <= pg.getPage_Count()) {
								%>
								<li><a href="?page=<%=nextPage%>"><i
										class="lni lni-chevron-right"></i></a></li>
								<%
									} else {
								%>
								<li class="disabled"><span><i
										class="lni lni-chevron-right"></i></span></li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>

	</section>
	<!-- End Blog Singel Area -->

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