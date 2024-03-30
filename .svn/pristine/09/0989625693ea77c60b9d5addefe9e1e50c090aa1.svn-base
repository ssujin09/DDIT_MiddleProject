<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="mypage.vo.ProfileImgVO"%>
<%@page import="member.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html class="no-js" lang="zxx">
<%
	// 자바 로직 처리부분
CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");

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

<script src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"/>

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

<header class="header navbar-area">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-12">
               <div class="nav-inner">
                  <nav class="navbar navbar-expand-lg">
                     <a class="navbar-brand" href="../home.do"> <img
                        src="${pageContext.request.contextPath}/assets/images/logo/맛있을지도로고.png"
                        alt="Logo">
                     </a> </a>
                     <button class="navbar-toggler mobile-menu-btn" type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="toggler-icon"></span> <span class="toggler-icon"></span>
                        <span class="toggler-icon"></span>
                     </button>
                     <div class="collapse navbar-collapse sub-menu-bar"
                        id="navbarSupportedContent">
                        <ul id="nav" class="navbar-nav ms-auto">
                           <!-- <li class="nav-item"><a class=" dd-menu collapsed"
                              href="javascript:void(0)" data-bs-toggle="collapse"
                              data-bs-target="#submenu-1-1"
                              aria-controls="navbarSupportedContent" aria-expanded="false"
                              aria-label="Toggle navigation">Home</a>
                              </li> -->
                           <li class="nav-item"><a class=" dd-menu collapsed"
                              href="<%=request.getContextPath()%>/cmmnty/list.do" 
                              >자유게시판 📋</a>
                              </li>
                            <li class="nav-item"><a class=" dd-menu collapsed"
                              href="<%=request.getContextPath()%>/admin/noticeList.do" 
                              >공지사항📣</a></li>
                              
                           <li class="nav-item"><a class=" dd-menu collapsed"
                              href="<%=request.getContextPath()%>/faq.html" 
                              >자주묻는질문 ❓</a></li>
                              
                            <%if(myInfo !=null ){ %>
                           <li class="nav-item"><a class=" active dd-menu collapsed"
                              href="<%=request.getContextPath()%>/mypage/setting.do"
                              >마이페이지 &#128064;</a></li>
                              <%}else{ %>
                           <li class="nav-item" id="noMypage"><a class=" dd-menu collapsed" href="#"
                              >마이페이지 &#128064;</a></li>
                              <%} %>
                              </ul>
                     </div>
                     
<script type="text/javascript">
$("#noMypage").click(function () {
    Swal.fire({
      icon: 'error',
      title: '로그인 정보 없음.',
      text: '마이페이지 기능은 로그인 이후에 사용 가능합니다.',
    });
  });
</script>                     
                     <!-- navbar collapse -->
                     <div class="login-button">
                        <ul>
									<%
										if (myInfo == null) {
									%>
									<ul>
										<li><a
											href="<%=request.getContextPath()%>/views/customer/login.html"><i
												class="lni lni-enter"></i>로그인</a></li>
										<li><a
											href="<%=request.getContextPath()%>/views/customer/registration.html"><i
												class="lni lni-user"></i>회원가입</a></li>
									</ul>
									<%
										} else {
									%>
									<ul>
										<li><a href="<%=request.getContextPath()%>/logout.do"><i class="lni lni-enter"></i>
												로그아웃</a></li>
									</ul>
									<%
										}
									%>
								</ul>
                     </div>
                     <div class="button header-button">
<!--                      <span style="width: 60px; height:60px; border: 3px solid #5830E0; border-radius: 50%;"> -->
                     	<%if(myInfo != null){
							if (myInfo.getProfileImgNo() != 0) {
							ProfileImgVO img = mypageService.profileImgInfo(myInfo.getProfileImgNo());
							String src = img.getProfileImgCours() + "/" + img.getProfileImgName();
						%>	<img src="${pageContext.request.contextPath}/<%=src%>" alt="프로필사진">
						<%
						}else{
							%>
							<img src="${pageContext.request.contextPath}/assets/images/profile/defaulprofile.png" alt="기본이미지">
						<%	
						}
                     	}
						%>
<!--                      </span> -->
                     </div>
                  </nav>
                  <!-- navbar -->
               </div>
            </div>
         </div>
         <!-- row -->
      </div>
      <!-- container -->
   </header>
   <!-- End Header Area -->

	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">회원 탈퇴</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="index.html">마이페이지</a></li>
						<li>회원 탈퇴</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Start Dashboard Section -->
	<section class="dashboard section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-12">
					<!-- Start Dashboard Sidebar -->
					<div class="dashboard-sidebar">
						<div class="user-image">
							<%
						if(myInfo.getProfileImgNo() != 0){
							ProfileImgVO img = mypageService.profileImgInfo(myInfo.getProfileImgNo());
					   		String src = img.getProfileImgCours()+"/"+img.getProfileImgName();
%>							<img src="${pageContext.request.contextPath}/<%=src%>" alt="Logo">
						<%
						}else{
							%>
							<img src="${pageContext.request.contextPath}/assets/images/logo/맛일을지도로고.png" alt="기본이미지">
						<%	
						}
						%>
							<h3>
								<%=myInfo.getCstmrName()%>
								<span><a href="javascript:void(0)">@<%=myInfo.getCstmrNick()%></a></span>
							</h3>
						</div>
						<div class="dashboard-menu">
							<ul>
								<li><a href="<%=request.getContextPath()%>/mypage/main.do"><i
										class="lni lni-dashboard"></i> 대쉬보드</a></li>
								<li><a
									href="<%=request.getContextPath()%>/mypage/setting.do"><i
										class="lni lni-pencil-alt"></i> 정보수정</a></li>
								<li><a
									href="<%=request.getContextPath()%>/mypage/freeboard.do?active=myPost"><i
										class="lni lni-bolt-alt"></i> 내 게시글</a></li>
								<li><a
									href="<%=request.getContextPath()%>/mypage/favorite.do"><i
										class="lni lni-bookmark"></i> 즐겨찾는 가게</a></li>
								<li><a class="active" href="../views/mypage/withDraw.jsp"><i
										class="lni lni-trash"></i> 회원탈퇴</a></li>
							</ul>
							<div class="button">
								<a class="btn" href="/TasteMap/logout.do">로그아웃</a>
							</div>
						</div>
					</div>
					<!-- Start Dashboard Sidebar -->
				</div>
				<div class="col-lg-9 col-md-8 col-12">
					<div class="main-content">
						<div class="dashboard-block close-content mt-0">
							<h2>회원 탈퇴</h2>
							<h4>정말로 맛있을 지도를 떠나실 생각이신가요 ?</h4>
							<div class="button">
								<a href="/TasteMap/mypage/withdrawal.do" class="btn">회원 탈퇴하기</a>
								<a href="/TasteMap/mypage/main.do" class="btn btn-alt">취소</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Dashboard Section -->

	<!-- Start Newsletter Area -->
	<!-- End Newsletter Area -->

	<!-- Start Footer Area -->
<%@include file="Footer.jsp" %>

	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top btn-hover"> <i
		class="lni lni-chevron-up"></i>
	</a>

	<!-- ========================= JS here ========================= -->
	<script src="<%=request.getContextPath()%>/assets/js/chat-api.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/wow.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/tiny-slider.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/glightbox.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
</body>

</html>