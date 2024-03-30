<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="member.vo.CustomerVO"%>
<%@page import="mypage.service.IMypageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Registration - ClassiGrids Classified Ads and Listing
            Website Template</title>
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/images/favicon.svg" />
        <!-- Place favicon.ico in the root directory -->

        <!-- Web Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

        <!-- ========================= CSS here ========================= -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/LineIcons.2.0.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/animate.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/tiny-slider.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/glightbox.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main.css" />

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
                     <a class="navbar-brand" href="home.do"> <img
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
                              
                           <li class="nav-item"><a class=" dd-menu collapsed"
                              href="<%=request.getContextPath()%>/mypage/setting.do"
                              >마이페이지 &#128064;</a></li>
                     </div>
                     <!-- navbar collapse -->
                     <div class="login-button">
                        <ul>
                           <li><a href="<%=request.getContextPath()%>/views/customer/login.html"><i class="lni lni-enter"></i>
                                 	로그인</a></li>
                           <li><a href="<%=request.getContextPath()%>/views/customer/registration.html"><i
                                 class="lni lni-user"></i>회원가입</a></li>
                        </ul>
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
                            <h1 class="page-title">비밀번호 변경</h1>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <ul class="breadcrumb-nav">
                            <li><a href="../home.do">홈</a></li>
                            <li>비밀번호 변경</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- start Registration section -->
        <section class="login registration section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                        <div class="form-head">
                            <h4 class="title">비밀번호 변경</h4>
                            <form id="findPw">
                                <div class="form-group">
                                    <label>비밀번호</label> <input name="cstmrPw" id="cstmrPw" type="password">
                                </div>
                                <div class="form-group">
                                    <label>비밀번호 확인</label>
                                    <input name="cstmrEmail" id="pwChk" type="password" required">
                                </div>
                                <div id="disp"></div>
                                <div class="button">
                                    <input type="button" id="resBtn" class="btn" value="비밀번호 변경">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            </div>
        </section>
        <!-- End Registration section -->


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
        <a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
        </a>

        <!-- ========================= JS here ========================= -->
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/wow.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/tiny-slider.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/glightbox.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/main.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
        
        let passChk = false;
       		
        $('#pwChk').keyup(function () {
        	
        	let cstmrChk = $('#cstmrPw').val();
        	
        	if ($(this).val() == cstmrChk) {
				$('#disp').text("비밀번호가 일치합니다.").css('color', 'limegreen');
				passChk = true;
			} else {
				$('#disp').text("비밀번호가 일치하지 않거나 사용할 수 없습니다.").css('color', 'orangered');
				passChk = false;
			}
        });
        
        $('#resBtn').click(function () {
        	let $cstmrPw = $('#cstmrPw').val(); 
			
			<%
				String cstmrId = (String) request.getSession().getAttribute("cstmrId");				
			%>
			
			let cstmrId = "<%=cstmrId%>"
			
			$.ajax({
				method : 'post',
				url : '/TasteMap/views/customer/updatePass.jsp',
				data : {
					cstmrId: cstmrId,
					cstmrPw: $cstmrPw
				},
				success : function(rst) {
					if (rst != 0) { 
						alert('비밀변호 변경이 완료되었습니다.');
						location.href = "views/customer/login.html";
					} else {
						alert("비밀번호 변경에 실패했습니다.");
					}
				},
				error : function(xhr) {
					alert(xhr.status);
					}
				});
		});
        
        </script>
    </body>

    </html>