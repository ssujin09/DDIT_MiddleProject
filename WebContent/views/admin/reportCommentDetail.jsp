<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="community.vo.CommentVO"%>
<%@page import="admin.vo.CmmntyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	CmmntyVO cv = (CmmntyVO) request.getAttribute("cv");
CommentVO ccv = (CommentVO) request.getAttribute("ccv");
IMypageService m = MypageServiceImple.getInstance();
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

<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.svg" />
<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">


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
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap')
	;

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
<!-- <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> -->
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
            <li id="noticeMenu"><a href="noticeList.do"s><i class="lni lni-pencil-alt"></i> 공지사항</a></li>
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
	<!-- 사이드바 끝 -->


	<section class="section latest-news-area blog-list">
		<div class="row">
			<div class="col-lg-10 offset-lg-1 col-md-12 col-12">
				<div class="section-title">
					<h2>신고 게시판 상세</h2>


				</div>

				<div class="single-inner">
					<div class="post-thumbnils"></div>
					<div class="post-details">
						<div class="detail-inner">
							<!-- 추가된 부분 -->
							<div class="post-attributes">
								<div class="community-post-info__header">
									<div class="post-title">
										<h3><%=cv.getCmmntyTitle()%></h3>
									</div>
									<div class="header__sub-title">
										<div class="content-date">
											<div class="button"></div>
										</div>
									</div>


									<!-- post meta -->
									<ul class="custom-flex post-meta">
										<li><a href="javascript:void(0)"> <i
												class="lni lni-user"></i><%=m.getNick(cv.getCstmrId())%>
										</a></li>
										<li><a href="javascript:void(0)"> <i
												class="lni lni-calendar"></i> <%=cv.getCmmntyDate()%>
										</a></li>
										<li><a href="javascript:void(0)"> <i
												class="lni lni-comments"></i>
										</a></li>
										<li><a href="javascript:void(0)"> <i
												class="lni lni-eye"></i> <%=cv.getCmmntyCount()%>
										</a></li>

										<li><a href="javascript:void(0)"> <i
												class="lni lni-heart"></i><%=cv.getCmmntyLike()%>
										</a></li>

										<%-- 											<li><a href="javascript:void(0)" class="likeLike" onclick="likeLike('<%= cv.getCmmntyLike() %>')">
											<i class="lni lni-heart" aria-hidden="true"></i>
											</a>
											<span id="count_like"><%= cv.getCmmntyLike()%></span>Like</li> --%>

										<li><a href="javascript:void(0)"> <i
												class="lni lni-emoji-sad"></i> Black
										</a></li>


									</ul>

									<p style="margin-top: 100px; margin-bottom: 100px">7</p>




									<!-- 코멘트 시작부분  -->

									<!-- Comments -->
									<div class="post-comments">
										<h3 class="comment-title">
											<span>Comment</span>
										</h3>

										<%
											// 											if (comList.size() > 0) {
										// 											for (CommentVO comVO : comList) {
										%>
										<ul class="comments-list">
											<li>
												<div class="comment-img">
													<img src="https://via.placeholder.com/150x150"
														class="rounded-circle" alt="img">
												</div>
												<div class="comment-desc">
													<div class="desc-top">
														<h6><%=m.getNick(cv.getCstmrId())%></h6>
														<span class="date"><%=ccv.getCcommentDate()%></span>
														<!-- <a href="javascript:void(0)"
															class="reply-link"><i class="lni lni-emoji-sad"></i>신고하기</a> -->
														<!-- 안되는 부분 콘솔에는 찍힘 -->
														<%--  	<a href="javascript:void(0)" class="comLike" onclick="rcount_like('<%= comVO.getCcommentLike() %>')">
    <i class="fa fa-heart" aria-hidden="true"></i>
    <span id="rcount_like"><%= comVO.getCcommentLike() %></span> Like
    
</a> --%>
														<div class="text-end">
															<!-- Align buttons to the right -->
															<a
																href="../admin/managecomm.do?ccommentCode=<%=ccv.getCcommentCode()%>&active=복원"
																class="btn btn-primary">복원</a>

															<!-- Move submit button to the right -->
<!-- 															<a -->
<%-- 																href="../admin/managecomm.do?ccommentCode=<%=ccv.getCcommentCode()%>&active=삭제" --%>
<!-- 																class="btn btn-danger" -->
<!-- 																onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a> -->
															<a
																href="#"
																class="delete-comment"
																data-comment-code="<%=ccv.getCcommentCode()%>"
																><i class="btn btn-danger">삭제</i></a>
															<!-- Added cancel button -->
														</div>

														<p style="margin-bottom: 70px; margin-top: 30px;"><%=ccv.getCcommentContent()%></p>

													</div>
											</li>
										</ul>
										<%
											// 											}
										// 										}
										%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>






	</section>
	<!-- End Blog Singel Area -->

<script type="text/javascript">
    $(document).ready(function() {
        $('.delete-comment').click(function(e) {
            e.preventDefault();

            var ccommentCode = $(this).data('comment-code');

            Swal.fire({
                title: '댓글을 삭제하시겠습니까?',
                text: '삭제한 댓글은 복구할 수 없습니다.',
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
                    window.location.href = '../admin/managecomm.do?ccommentCode='+ccommentCode +'&active=삭제';
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