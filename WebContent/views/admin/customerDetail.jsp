
<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="mypage.vo.ProfileImgVO"%>
<%@page import="admin.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

	CustomerVO cv = (CustomerVO)request.getAttribute("cv");
	IMypageService mypageService = MypageServiceImple.getInstance();
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
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
						<li>회원관리</li>
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
            <li id="noticeMenu"><a href="noticeList.do"><i class="lni lni-pencil-alt"></i> 공지사항</a></li>
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
            <li id="customerMenu"><a href="customerList.do" class="active"><i class="lni lni-users"></i> 회원관리</a></li>
            <li id="reportMenu"><a href="reportPostList.do"><i class="lni lni-bolt-alt"></i> 신고관리</a></li>

        </ul>
        <div class="button">
            <a class="btn" href="/TasteMap/logout.do">로그아웃</a>
        </div>
    </div>
</div>s

	<!-- 사이드바 끝 -->



	<section class="section latest-news-area blog-list">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Your existing "공지사항" section -->
					<div class="section-title">
						<h2>등록 회원 상세보기</h2>


						<div class="col-lg-18 col-md-16 col-12">
							<div class="main-content">
								<!-- Start Profile Settings Area -->
								<div class="dashboard-block mt-0 profile-settings-block">
									<h3 class="block-title">회원 정보</h3>
									<div class="inner-block">
										<div class="image">
										
											<%
												if (mypageService.getProfileImgNo(cv.getCstmrId()) != 0) {
												ProfileImgVO img = mypageService.profileImgInfo(mypageService.getProfileImgNo(cv.getCstmrId()));
												String src = img.getProfileImgCours() + "/" + img.getProfileImgName();
											%>
											<img 
												src="${pageContext.request.contextPath}/<%=src%>" alt="Logo">
											<%
												} else {
											%>
											<img 
												src="${pageContext.request.contextPath}/assets/images/profile/defaulprofile.png"
												alt="기본이미지">
											<%
												}
											%>
											
										</div>
										<form class="profile-setting-form" method="post"
											enctype="multipart/form-data"
											action="/TasteMap/mypage/setting.do">
											<div class="row">
												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>아이디</label> 
														<div name="cstmrId" class="output-box"><%=cv.getCstmrId() %></div>
													</div>
												</div>
												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>이름</label> 
															<div name="cstmrId" class="output-box"><%=cv.getCstmrName() %></div>
													</div>
												</div>
												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>닉네임</label> 			
														<div name="cstmrId" class="output-box"><%=cv.getCstmrNick() %></div>
													</div>
												</div>
												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>성별</label> 
																	<div name="cstmrId" class="output-box"><%=cv.getCstmrGender() %></div>
													</div>
												</div>
												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>생일</label> 			<div name="cstmrId" class="output-box"><%=cv.getCstmrBir() %></div>
													</div>
												</div>
												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>전화번호</label> <div name="cstmrId" class="output-box"><%=cv.getCstmrPhone() %></div>
													</div>
												</div>

												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>이메일 주소</label><div name="cstmrId" class="output-box"><%=cv.getCstmrEmail() %></div>
													</div>
												</div>
												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>주소</label><div name="cstmrId" class="output-box"><%=cv.getCstmrAddr() %></div>
													</div>
												</div>
												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>누적경고</label> <div name="cstmrId" class="output-box"><%=cv.getCstmrWarn() %></div>
													</div>
												</div>
												<div class="col-lg-6 col-12">
													<div class="form-group">
														<label>계정정지여부</label><div name="cstmrId" class="output-box"><%=cv.getCstmrExpel() %></div>
												</div>

												<!--                                         <div class="col-12"> -->
												<!--                                             <div class="form-group message"> -->
												<!--                                                 <label>About You*</label> -->
												<!--                                                 <textarea name="message" placeholder="Enter about yourself"></textarea> -->
												<!--                                             </div> -->
												<!--                                         </div> -->
												<div class="col-12">
													<div class="form-group button mb-0">
													
													
<%-- 													<button class="btn btn-danger" onclick="expelCustomer('<%=cv.getCstmrId()%>')">계정정지</button> --%>
													<a href="#"
													class="expel-member"
													data-cstmr-id="<%=cv.getCstmrId()%>">
													<button class="btn btn-danger">계정정지</button>
													</a>
													
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
								<!-- End Profile Settings Area -->

							</div>



						</div>

					</div>
				</div>
				
				<script>
				$(document).ready(function() {
				    $('.expel-member').click(function(e) {
				        e.preventDefault();

				        var cstmrId = $(this).data('cstmr-id');

				        Swal.fire({
				            title: '회원을 정지 시키시겠습니까?',
				            text: '정지된 회원은 복구할 수 없습니다.',
				            icon: 'warning',
				            showCancelButton: true,
				            confirmButtonColor: '#3085d6',
				            cancelButtonColor: '#d33',
				            confirmButtonText: '정지',
				            cancelButtonText: '취소',
				            reverseButtons: true
				        }).then((result) => {
				            if (result.isConfirmed) {
				                $.ajax({
				                    type: 'POST',
				                    url: '<%=request.getContextPath()%>/admin/expelCustomer.do',
				                    data: { cstmrId: cstmrId },
				                    success: function(response) {
				                        console.log(response);
				                        location.reload();
				                    },
				                    error: function(error) {
				                        console.error(error);
				                    }
				                });
				            } else {
				                Swal.fire('취소되었습니다.', '', 'info');
				            }
				        });
				    });
				});
				
				
<%--     function expelCustomer(cstmrId) {
        // 사용자에게 정말로 계정을 정지할 것인지 확인하는 다이얼로그 등을 추가할 수 있습니다.
        

        // Ajax를 사용하여 서버에 요청을 보냅니다.
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/admin/expelCustomer.do",
            data: { cstmrId: cstmrId },
            success: function (response) {
                // 서버에서 삭제가 성공했을 때 화면에서도 해당 회원을 삭제합니다.
                if (response === "success") {
                    alert("계정이 정지되었습니다.");
                    // 해당 행을 테이블에서 삭제하거나 페이지를 새로고침할 수 있습니다.
                    location.reload();
                } else {
                    alert("계정 정지 실패");
                }
            },
            error: function () {
                alert("계정 정지 중 오류가 발생했습니다.");
            }
        });
    } --%>
</script>
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