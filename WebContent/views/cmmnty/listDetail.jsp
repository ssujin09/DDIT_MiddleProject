<%@page import="mypage.vo.ProfileImgVO"%>
<%@page import="community.service.CmmntyServiceImpl"%>
<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="community.service.ICmmntyService"%>
<%@page import="community.service.ICCommentService"%>
<%@page import="community.service.CCommentServiceImpl"%>
<%@page import="community.vo.CommentVO"%>
<%@page import="member.vo.CustomerVO"%>
<%@page import="community.vo.CmmntyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
	CmmntyVO cv = (CmmntyVO) request.getAttribute("cv");
List<CommentVO> comList = (List<CommentVO>) request.getAttribute("comList");
CustomerVO myInfo = new CustomerVO();
myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
ICCommentService commentService = CCommentServiceImpl.getInstance();
IMypageService mypageService = MypageServiceImple.getInstance();
ICmmntyService cmmntyService = CmmntyServiceImpl.getInstance();
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

<!-- SweetAlert 2 CDN -->
<script src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"/>

<!-- Import additional fonts -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap')
	;

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
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
                          
                           <li class="nav-item"><a class=" active dd-menu collapsed"
                              href="<%=request.getContextPath()%>/cmmnty/list.do" 
                              >자유게시판 📋</a>
                              </li>
                            <li class="nav-item"><a class="  dd-menu collapsed"
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

	<!-- 스크립트 -->
	<script>
    // 네비게이션 메뉴 클릭 이벤트 처리
    document.querySelectorAll('nav a').forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            loadContent(this.href);
        });
    });



    // 페이지 내용 로드 함수
    function loadContent(url) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    document.getElementById('content-container').innerHTML = xhr.responseText;

                    // Breadcrumbs 동적 변경
                    var pageTitle = xhr.responseText.match(/<h1 class="page-title">([^<]+)<\/h1>/);
                    if (pageTitle && pageTitle[1]) {
                        document.getElementById('breadcrumb-title').innerText = pageTitle[1];
                        document.getElementById('breadcrumb-current').innerText = pageTitle[1];
                    }
                } else {
                    console.error('Failed to load content.');
                }
            }
        };
        xhr.open('GET', url, true);
        xhr.send();
    }
</script>

	<!-- 네비게이션 바 -->
	<!-- 	<nav> -->
	<!-- 		<ul> -->
	<!-- 			<li><a href="index.html">Home</a></li> -->
	<!-- 			<li><a href="community.html">Community</a></li> -->
	<!-- 			<li><a href="questions.html">Questions</a></li> -->
	<!-- 		</ul> -->
	<!-- 	</nav> -->


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
						<li id="breadcrumb-current">상세보기</li>
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
													class="lni lni-user"></i> <%=mypageService.getNick(cv.getCstmrId())%>
											</a></li>
											<li><a href="javascript:void(0)"> <i
													class="lni lni-calendar"></i> <%=cv.getCmmntyDate()%>
											</a></li>
									
											<li><a href="javascript:void(0)"> <i
													class="lni lni-comments"></i><%=commentService.countComment(cv.getCmmntyCode())%>
											</a></li>
											<li><a href="javascript:void(0)"> <i
													class="lni lni-eye"></i><%=cv.getCmmntyCount()%> View
											</a></li>
											<%-- 											<li><a href="javascript:void(0)"> <i
													class="lni lni-eye"></i> <%= cv.getCmmntyCount()%> View
											</a></li> --%>

											<%-- <li><a href="javascript:void(0)"> <i
													class="lni lni-heart" id="likeBody" onclick="like()"></i> <%= cv.getCmmntyLike()%> Like
											</a></li> --%>

											<%-- <li><a href="<%=request.getContextPath()%>/cmmnty/uplike.do?cmmntyCode=<%=cv.getCmmntyCode()%>"> <i
													class="lni lni-heart" ></i> <%= cv.getCmmntyLike()%> Like
											</a></li> --%>


											<%
												if (cv.getCmmntyLike() == 0) {
											%>
											<li><a
												href="<%=request.getContextPath()%>/cmmnty/uplike.do?cmmntyCode=<%=cv.getCmmntyCode()%>"
												id="likeBody"> <i class="lni lni-heart" id="likeBody"
													onclick="like()"></i><%=cv.getCmmntyLike()%> Like
											</a></li>
											<%
												} else {
											%>
											<li><a
												href="<%=request.getContextPath()%>/cmmnty/uplike.do?cmmntyCode=<%=cv.getCmmntyCode()%>"
												id="likeBody"> <i class="lni lni-heart-filled"
													id="likeBody" onclick="like()"></i><%=cv.getCmmntyLike()%>
													Like
											</a></li>
											<%
												}
											%>
											<%-- 											<% 
											if(cv.getCmmntyLike() == 0) {
											 %>
											<li><a href="<%=request.getContextPath()%>/cmmnty/uplike.do?cmmntyCode=<%=cv.getCmmntyCode()%>" id="likeBody"> <i
													class="lni lni-heart" id="likeBody" onclick="like()"></i><%=cv.getCmmntyLike()%>
													Like
											</a></li>
											<%
											} else {
											 %>
											<li><a href="<%=request.getContextPath()%>/cmmnty/uplike.do?cmmntyCode=<%=cv.getCmmntyCode()%>" id="likeBody"> <i
													class="lni lni-heart-filled" id="likeBody" onclick="like()"></i><%=cv.getCmmntyLike()%>
													Like
											</a></li>
											<%
											}
											%> --%>


											<%-- 요건 vo 날려서 못 쓰는거 <% 
											if(cv.getCmmntyLike() == 0) {
											 %>
											<li><a href="javascript:void(0)" id="likeBody"> <i
													class="lni lni-heart" id="like" onclick="like()"></i><%=cv.getTotalLike()%>
													Like
											</a></li>
											<%
											} else {
											 %>
											<li><a href="javascript:void(0)" id="likeBody"> <i
													class="lni lni-heart-filled" id="like" onclick="like()"></i><%=cv.getTotalLike()%>
													Like
											</a></li>
											<%
											}
											%> --%>

											<li><a
												href="<%=request.getContextPath()%>/cmmnty/report.do?cmmntyCode=<%=cv.getCmmntyCode()%>">
													<i class="lni lni-emoji-sad"></i> <%=("Y".equals(cv.getCmmntyReport()))
		? "<span style='color: #8B008B; font-weight: bold;'>Y</span>"
		: (cv.getCmmntyReport() != null) ? cv.getCmmntyReport() : ""%> Black
											</a></li>




										</ul>
										<%
										String Content = cv.getCmmntyContent().replace("\n", "<br>" );
										%>
										<p style="margin-top: 100px; margin-bottom: 100px"><%=Content%></p>




										<!-- 코멘트 시작부분  -->

										<!-- Comments -->
										<div class="post-comments">
											<h3 class="comment-title">
												<span>Comment</span>
											</h3>

											<%
												if (comList.size() > 0) {
												for (CommentVO comVO : comList) {
											%>
											<ul class="comments-list">
												<li>
													<div class="comment-img">
														<%
															if (mypageService.getProfileImgNo(comVO.getCstmrId()) != 0) {
															ProfileImgVO img = mypageService.profileImgInfo(mypageService.getProfileImgNo(comVO.getCstmrId()));
															String src = img.getProfileImgCours() + "/" + img.getProfileImgName();
														%>S
														<img src="${pageContext.request.contextPath}/<%=src%>"
															alt="Logo">
														<%
															} else {
														%>
														<img
															src="${pageContext.request.contextPath}/assets/images/logo/맛있을지도로고.png"
															alt="기본이미지">
														<%
															}
														%>
													</div>
													<div class="comment-desc">
														<div class="desc-top">
															<h6><%=mypageService.getNick(comVO.getCstmrId())%></h6>
															<span class="date"><%=comVO.getCcommentDate()%></span>


															<%
																if (comVO != null && "Y".equals(comVO.getCcommentReport())) {
															%>
															<a
																href="<%=request.getContextPath()%>/cmmnty/comreport.do?cmmntyCode=<%=comVO.getCmmntyCode()%>&ccommentCode=<%=comVO.getCcommentCode()%>"
																class="reply-link"
																style="font-weight: bold; color: #8B008B;"><i
																class="lni lni-emoji-sad"></i>신고된 댓글 </a>
															<%
																} else {
															%>
															<a
																href="<%=request.getContextPath()%>/cmmnty/comreport.do?cmmntyCode=<%=comVO.getCmmntyCode()%>&ccommentCode=<%=comVO.getCcommentCode()%>"
																class="reply-link"><i class="lni lni-emoji-sad"></i>신고하기</a>

															<%
																}
															%>

															<p style="margin-bottom: 70px; margin-top: 30px;"><br><br><%=comVO.getCcommentContent()%></p>

														</div>
												</li>
											</ul>
											<%
												}
											}
											%>
										</div>

										<div class="comment-form">
											<h3 class="comment-reply-title">
												<span> 댓글 입력</span>
											</h3>
											<form <%if (myInfo != null) {%>
												action="<%=request.getContextPath()%>/comment/insert.do"
												<%} else {%>
												action="<%=request.getContextPath()%>/views/customer/login.html"
												<%}%> method="POST">
												<input type="hidden" name="cmmntyCode"
													value="<%=cv.getCmmntyCode()%>">
												<div class="row">
													<div class="col-12">

														<div class="form-box form-group">

															<%
																if (myInfo != null && !myInfo.getCstmrNick().equals("")) {
															%>

															<input type="text" name="name"
																class="form-control form-control-custom"
																value="<%=myInfo.getCstmrNick()%>" readonly />
															<div class="col-12">
																<div class="form-box form-group">
																	<textarea name="ccommentContent"
																		class="form-control form-control-custom"
																		placeholder="내용을 입력해주세요"></textarea>
																</div>
															</div>
															<%
																} else {
															%>

															<input type="text" name="name"
																class="form-control form-control-custom"
																value="비회원입니다. 로그인 후 사용해주세요." readonly />
															<div class="col-12">
																<div class="form-box form-group">
																	<textarea name="ccommentContent"
																		class="form-control form-control-custom"
																		placeholder="로그인 후 내용을 입력해주세요"></textarea>
																</div>
															</div>

															<%
																}
															%>

														</div>
													</div>


													<script>
    let msg = '<%=session.getAttribute("msg")%>
														';

														console.log(msg);

														if (msg === '댓글성공') {
															Swal
																	.fire({
																		title : '등록 완료',
																		text : '댓글이 등록되었습니다',
																		icon : 'success'
																	});
													<%session.removeAttribute("msg");%>
														}
													</script>


													<%
														if (myInfo != null) {
													%>

													<div class="col-12">
														<div class="button">
															<button type="submit" class="btn" style="float: right;">등록하기</button>
														</div>
													</div>
													<%
														} else {
													%>

													<div class="col-12">
														<div class="button">
															<button type="submit" class="btn" style="float: right;">로그인하기</button>
														</div>
													</div>
													<%
														}
													%>

													<!-- 													<div class="col-12">
														<div class="button">
															<button type="submit" class="btn"
																style="float: right; font-family: 'Noto Sans KR', sans-serif;">등록하기</button>
														</div>
													</div> -->
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




	<!-- 	<script>
		document.querySelector('#addBtn').addEventListener('click',function(){
// 			document.querySelector('form').action('/comment/insert.do');
			//ajax로 form정보 넘기고 응답으로 alert처리하기 내일-	
		});
	</script> -->



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
							웹 사이트 제공자: Minsu, Aujin, Sujin, Jieun, Hyeonheum <br> <br>
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
	<script
		src="<%=request.getContextPath()%>/assets/js/count-like-auzi.js"></script>
	<!-- 폰트어썸 CDN -->
	<script src="https://kit.fontawesome.com/1cc7793b32.js"
		crossorigin="anonymous"></script>
	<!-- jQuery CDN -->
	<script
		src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>
</body>

</html>