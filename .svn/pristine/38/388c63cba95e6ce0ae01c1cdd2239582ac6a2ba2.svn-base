
<%@page import="admin.service.Paging"%>
<%@page import="mypage.vo.ProfileImgVO"%>
<%@page import="community.service.CmmntyServiceImpl"%>
<%@page import="community.service.ICmmntyService"%>
<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="member.vo.CustomerVO"%>
<%@page import="community.service.CCommentServiceImpl"%>
<%@page import="community.service.ICCommentService"%>
<%@page import="community.vo.CmmntyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
List<CmmntyVO> cmmntyList = (List<CmmntyVO>) request.getAttribute("cmmntyList");
ICCommentService commentService = CCommentServiceImpl.getInstance();
IMypageService mypageService = MypageServiceImple.getInstance();
ICmmntyService cmmntyService = CmmntyServiceImpl.getInstance();
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

<!-- SweetAlert 2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                     <a class="navbar-brand" href="../home.do"> <img
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
                            <li class="nav-item"><a class="dd-menu collapsed"
                              href="<%=request.getContextPath()%>/admin/noticeList.do" 
                              >공지사항📣</a></li>
                              
                           <li class="nav-item"><a class=" dd-menu collapsed"
                              href="<%=request.getContextPath()%>/faq.html" 
                              >자주묻는질문 ❓</a></li>
                              
                            <%if(myInfo !=null ){ %>
                           <li class="nav-item"><a class=" dd-menu collapsed"
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
						<h1 class="page-title" id="breadcrumb-title">자유게시판👨🏻‍👧🏻‍👧🏻</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li>홈</li>
						<li><a href="../cmmnty/list.do">자유게시판</a></li>
						<li><a href="../cmmnty/list.do">조회</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- 여기에 선택된 페이지의 내용을 표시할 컨테이너 -->
	<div id="content-container">
		<!-- 선택된 페이지의 내용이 여기에 동적으로 로드됩니다. -->
	</div>

	<!-- Start Blog Singel Area -->
	<section class="section latest-news-area blog-list">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Your existing "자유" section -->
					<div class="section-title">
						<h2>자유게시판👨🏻‍👧🏻‍👧🏻</h2>
					</div>
					<div class="table-responsive">
						<!-- New table for notices -->
						<table class="table notice-table">
							<thead>
								<tr>
									<th style="width: 10%; text-align: center;">순번</th>
									<th style="width: 30%; text-align: center;">제목</th>
									<th style="width: 15%; text-align: center;">작성일</th>
									<th style="width: 15%; text-align: center;">닉네임</th>
									<th style="width: 15%; text-align: center;">댓글수</th>
									<th style="width: 15%; text-align: center;">조회수</th>
								</tr>
							</thead>
								
<%
	
    // 목록 및 페이징 정보 가져오기
    int writing_Count = cmmntyList.size(); //총 글의 갯수
    int cur_Page = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1; //현재페이지
    int w_Size = 10; // 페이지당 글의 수

    Paging pg = new Paging(w_Size, writing_Count, cur_Page);

    // 현재 페이지에 해당하는 글의 범위 계산
    int startIdx = pg.getStartIdx(); //글 범위 시작번호
    int endIdx = pg.getEndIdx();	//글 범위 끝번호
    List<CmmntyVO> currentList = cmmntyList.subList(startIdx, endIdx);

    // 이전 페이지, 다음 페이지 URL 생성
    int prevPage = pg.getPage_Start() - 1;
    int nextPage = pg.getPage_End() + 1;
  
%>
							


							<tbody>
								<!-- Replace the example content with your actual notices -->
								<!-- 이 아래 넣기 -->
								<%
								 int cnt = writing_Count - startIdx; //페이징부분(전체 총 글 갯수-현재페이지에서 시작글번호)
    for (CmmntyVO cv : currentList) {
    %>
								<tr>
									<td style="text-align: center;"><%= cnt %></td>
									<td style="text-align: center;"><a href="../cmmnty/detail.do?cmmntyCode=<%=cv.getCmmntyCode()%>"
										style="color: black;"><%= cv.getCmmntyTitle() %></a></td>
									<td style="text-align: center;"><%= cv.getCmmntyDate() %></td>
									<td style="text-align: center;"><%=mypageService.getNick(cv.getCstmrId()) %></td>
									<td style="text-align: center;"><%=commentService.countComment(cv.getCmmntyCode())%></td>
									<td style="text-align: center;"><%= cv.getCmmntyCount() %></td>
								</tr>
								<% 
								cnt--;
								} %>

								<!-- Add more rows for each notice -->

							</tbody>
						</table>
					
						<script>
						let msg = "<%=session.getAttribute("msg") %>";
						console.log(msg);

					    if (msg === "글 성공") {
					        Swal.fire({
					            title: '등록 완료',
					            text: '게시글이 등록되었습니다',
					            icon: 'success'
					        });
					        <% session.removeAttribute("msg"); %> 
					    }
					</script>

						

						<!-- 버튼 추가 -->
<div class="button header-button" style="float: right;">
    <a href="../cmmnty/insert.do" class="btn">글 작성하기</a>
</div>

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
					<!-- Pagination 끝-->	
					
					
					
					
					
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
							Designed and Developed by <a href="https://www.ddit.or.kr/"
								rel="nofollow" target="_blank">Team 4 &#x1F4BB;</a>
						</p>
<div style="color: white;">
    웹 사이트 제공자: Minsu, Aujin, Sujin, Jieun, Hyeonheum <br>
    <br>
    <div>
        VAT 번호: IE 202310 | 사업자 등록 번호: IE 202310 | 연락처: 042-222-8201 |
        웹사이트 | <a href="https://www.ddit.or.kr/" style="color: white;" target="_blank">https://www.ddit.or.kr/</a> | 서비스 제공업체: 대덕인재개발원 웹서비스<br>
        <br> 맛있을지도는 통신판매 중개자로 맛집 플랫폼을 통하여 거래가 이루어지는 통신판매의 당사자가
        아닙니다.<br> 맛집 플랫폼을 통하여 음식, 맛, 평가, 예약 서비스에 관한 의무와 책임은 해당 서비스를
        제공하는 점주에게 있습니다.
    </div>
</div>

						<p class="copyright-text">
							© DDIT Corp <a href="https://www.ddit.or.kr/" rel="nofollow"
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
	<script src="<%=request.getContextPath()%>/assets/js/chat-api.js"></script>
</body>

</html>