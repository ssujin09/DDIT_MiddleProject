
<%@page import="member.vo.CustomerVO"%>
<%@page import="community.vo.CmmntyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
    List<CmmntyVO> cmmntyList = (List<CmmntyVO>) request.getAttribute("cmmntyList");
	CustomerVO myInfo = (CustomerVO)request.getSession().getAttribute("loginCode");
%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
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

<!-- Import additional fonts -->
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
</style>

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

 <!-- Start Header Area -->
   <header class="header navbar-area">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-12">
               <div class="nav-inner">
                  <nav class="navbar navbar-expand-lg">
                     <a class="navbar-brand" href="index.html"> <img
                        src="${pageContext.request.contextPath}/assets/images/logo/맛있을지도로고.png"
                        alt="Logo">
                     </a> 
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
                           
                           <li class="nav-item"><a class="active dd-menu collapsed"
                              href="<%=request.getContextPath()%>/cmmnty/list.do" 
                              >자유게시판 📋</a>
                              </li>
                            <li class="nav-item"><a class=" dd-menu collapsed"
                              href="<%=request.getContextPath()%>/admin/noticeList.do" 
                              >공지사항📣</a></li>
                              
                           <li class="nav-item"><a class=" dd-menu collapsed"
                              href="<%=request.getContextPath()%>/faq.html" 
                              >자주묻는질문 ❓</a></li>
                              
                           <li class="nav-item"><a class=" dd-menu collapsed"
                              href="<%=request.getContextPath()%>/mypage/setting.do"
                              >마이페이지 &#128064;</a></li>
                     	</ul>
                     </div>
                     <!-- navbar collapse -->
                     <div class="login-button">
                        <ul>
                           <li><a href="<%=request.getContextPath()%>/views/customer/login.html"><i class="lni lni-enter"></i>
                                 로그인</a></li>
                           <li><a href="<%=request.getContextPath()%>/regist.do"><i
                                 class="lni lni-user"></i> 회원가입</a></li>
                        </ul>
                     </div>
                     <div class="button header-button">
                        <a href="<%=request.getContextPath()%>/mypage/setting.do"class="btn">프로필사진</a>
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



	<!-- 네비게이션 바 -->
	<nav>
		<ul>
			<li><a href="index.html">홈</a></li>
			<li><a href="community.html">Community</a></li>
			<li><a href="questions.html">Questions</a></li>
		</ul>
	</nav>


	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title" id="breadcrumb-title">자유게시판👨🏻‍👧🏻‍👧🏻</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="index.html">홈</a></li>
						<li><a href="../cmmnty/list.do">자유게시판</a></li>
						<li id="breadcrumb-current">글작성하기</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->
	<!-- Start Blog Singel Area -->
	<section class="section blog-single">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1 col-md-12 col-12">
					<div class="single-inner">
						<div class="post-thumbnils">
						</div>
						<div class="post-details">
							<div class="detail-inner">
							<div class="comment-form">
								<h3 class="comment-reply-title">
									<span>
									글작성하기&#x1F4DD;
									</span>
								</h3>
								
								<form
												<%if(myInfo != null) {%>
												action="<%=request.getContextPath()%>/cmmnty/insert.do"
												<%}else{ %>
												action="<%=request.getContextPath()%>/views/customer/login.html"
												<%} %>
												method="POST">
												
												<%
																if ( myInfo != null) {
															%>

															<div class="row">
											<div class="col-12">
												<div class="form-box form-group">
													<input type="text" name="cmmntyTitle"
														class="form-control form-control-custom"
														placeholder="제목을 입력해주세요" />
												</div>
											</div>
											<div class="col-12">
												<div class="form-box form-group">
													<textarea name="cmmntyContent"
														class="form-control form-control-custom"
														placeholder="내용을 입력해주세요"></textarea>
												</div>
											</div>
															<%
																} else {
															%>

															<div class="row">
											<div class="col-12">
												<div class="form-box form-group">
													<input type="text" name="cmmntyTitle"
														class="form-control form-control-custom"
														placeholder="로그인 후 입력해주세요" />
												</div>
											</div>
											<div class="col-12">
												<div class="form-box form-group">
													<textarea name="cmmntyContent"
														class="form-control form-control-custom"
														placeholder="로그인 후 내용을 입력해주세요"></textarea>
												</div>
											</div>

															<%
																}
															%>
								
										<!-- <div class="row">
											<div class="col-12">
												<div class="form-box form-group">
													<input type="text" name="cmmntyTitle"
														class="form-control form-control-custom"
														placeholder="제목을 입력해주세요" />
												</div>
											</div>
											<div class="col-12">
												<div class="form-box form-group">
													<textarea name="cmmntyContent"
														class="form-control form-control-custom"
														placeholder="내용을 입력해주세요"></textarea>
												</div>
											</div> -->

												<%
													if (myInfo != null) {
												%>

												<div class="button"
													style="display: flex; justify-content: flex-end;">
													<button type="submit" class="btn btn-secondary"
														>등록하기</button>
												</div>
												<%
													} else {
												%>

												<div class="button"
													style="display: flex; justify-content: flex-end;">
													<button type="submit" class="btn btn-secondary"
														>로그인하기</button>
												</div>
												<%
													}
												%>

										</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Blog Singel Area -->

	<!-- Start Footer Area -->
	<footer class="footer">
		<div class="footer-bottom">
			<div class="container">
				<div class="inner">
					<div class="row">
						<p class="copyright-text" style="font-size: 30px;">
							Designed and Developed by <a href="https://graygrids.com/"
								rel="nofollow" target="_blank">Team 4 &#x1F4BB;</a>
						</p>
<div style="color: white;">
							웹 사이트 제공자: Minsu, Aujin, Sujin, Jieun, Hyeonheum <br>
							<br>
							<div>
								VAT 번호: IE 202310 | 사업자 등록 번호: IE 202310 | 연락처: 042-222-8201 |
								웹사이트 | https://www.ddit.or.kr/ | 서비스 제공업체: 대덕인재개발원 웹서비스<br>
								<br> 맛있을지도는 통신판매 중개자로 맛집 플랫폼을 통하여 거래가 이루어지는 통신판매의 당사자가
								아닙니다.<br> 맛집 플랫폼을 통하여 음식, 맛, 평가, 예약 서비스에 관한 의무와 책임은 해당 서비스를
								제공하는 점주에게 있습니다.
							</div>
						</div>
						<p class="copyright-text">
							© DDIT Corp <a href="https://graygrids.com/" rel="nofollow"
								target="_blank">Team 4 🧑</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/ End Footer Area -->

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