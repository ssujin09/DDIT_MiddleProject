
<%@page import="admin.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	NoticeVO nv = (NoticeVO) request.getAttribute("nv");
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
<script src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"/>
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

	<%@ include file="adminHeader.jsp"%>
	<!-- End Breadcrumbs -->

	<!-- Start Blog Singel Area -->
	<!-- 	사이드바 start -->
 

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
            <li id="noticeMenu"><a href="noticeList.do" class="active"><i class="lni lni-pencil-alt"></i> 공지사항</a></li>
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
            <li id="reportMenu"><a href="reportPostList.do"><i class="lni lni-bolt-alt"></i> 신고관리</a></li>

        </ul>
        <div class="button">
            <a class="btn" href="/TasteMap/logout.do">로그아웃</a>
        </div>
    </div>
</div>
<!-- 사이드바 끝 -->



	<!-- Start Blog Singel Area -->
	<section class="section latest-news-area blog-list">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Your existing "공지사항" section -->
					<div class="section-title">
						<h2>공지사항</h2>
					</div>
					<div class="table-responsive">
						<!-- New table for notices -->

						<!-- Replace the example content with your actual notices -->
						<section class="notice-details">
							<div class="container">
								<div class="row">
									<div class="col-lg-8 offset-lg-2">
										<div class="notice-content">

											<h3><%=nv.getNoticeTitle()%></h3>
											<div class="row justify-content-end">
												<div class="col-md-6 text-end">
													<p>
														작성일:
														<%=nv.getNoticeDate()%>
													</p>
													<p>
														조회수:
														<%=nv.getNoticeCount()%></p>
												</div>
											</div>
											<hr>
											<% String Content=nv.getNoticeContent().replace("\n", "<br>"); %>
											<p><%=Content%></p>
											<div class="row justify-content-end mt-4">
												<div class="col-md-6 text-end">
													<a href="../admin/noticeUpdate.do?noticeCode=<%=nv.getNoticeCode()%>" class="btn btn-primary">수정</a> 
													
													
<%-- 													<a href="../admin/noticeDelete.do?noticeCode=<%=nv.getNoticeCode()%>" --%>
<!-- 														class="btn btn-danger" -->
<!-- 														onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a> -->
														
													<a href="#"
														class="delete-notice"
														data-notice-code="<%=nv.getNoticeCode()%>"
														><i class="btn btn-danger">삭제</i></a>
														
														
												</div>
											</div>


										</div>

									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
    $(document).ready(function() {
        $('.delete-notice').click(function(e) {
            e.preventDefault();

            var noticeCode = $(this).data('notice-code');

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
                    window.location.href = '../admin/noticeDelete.do?noticeCode='+noticeCode;
                } else {
                    // 사용자가 취소 또는 거절을 누른 경우
                    Swal.fire('취소되었습니다.', '', 'info');
                }
            });
        });
    });
</script>
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