<%@page import="meeting.service.MeetingServiceImpl"%>
<%@page import="meeting.service.IMeetingService"%>
<%@page import="meeting.vo.MeetingVO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="mypage.vo.ProfileImgVO"%>
<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="restaurant.service.RestaurantServiceImpl"%>
<%@page import="restaurant.service.RestaurantService"%>
<%@page import="mypage.vo.ReviewVO"%>
<%@page import="member.vo.CustomerVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="restaurant.vo.MenuVO"%>
<%@page import="java.util.List"%>
<%@page import="restaurant.vo.BusinessVO"%>
<%@page import="restaurant.vo.RestaurantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<%
IMypageService mypageService = MypageServiceImple.getInstance();
RestaurantService rstService = RestaurantServiceImpl.getInstance();
IMeetingService meetingService = MeetingServiceImpl.getInstance();

CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");

RestaurantVO rv = (RestaurantVO) request.getAttribute("restaurant");
String[] addressParts = (String[]) request.getAttribute("addr");

BusinessVO bv = (BusinessVO) request.getAttribute("bv");

List<MenuVO> menuList = (List<MenuVO>) request.getAttribute("menuList");

int rstrntCode = Integer.parseInt(request.getParameter("rstrntCode"));

List<ReviewVO> reviewList = rstService.getReviewList(rstrntCode);

List<MeetingVO> meetingList = (List<MeetingVO>) request.getAttribute("meetingList");
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
<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.1.0/uicons-solid-straight/css/uicons-solid-straight.css'>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css" />



<!-- 폰트어썸 CDN -->
<script src="https://kit.fontawesome.com/1cc7793b32.js"
	crossorigin="anonymous"></script>

<!-- jQuery CDN -->
<script
	src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>


<style>
/
body {
/* 	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; */
	background-color: #f8f9fa; /* 밝은 회색 배경으로 변경 */
	margin: 0;
	padding: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* 모달 초기에는 숨기기 */
#myModal {
	display: none;
}

/* 모달이 열릴 때 body에 적용되는 스타일 */
body.modal-open {
	overflow: hidden;
}

/* .modal 스타일 */
.modal {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 15px; /* 상하 여백 조절 */
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	z-index: 1;
	width: 300px;
	height: 800px; /* 예시로 조절, 원하는 크기로 수정하세요 */
	max-width: 80%;
}

/* 모달 내부 요소 스타일 */
.modal label {
	display: block;
	margin-bottom: 8px;
	color: #555;
}

.modal input, .modal textarea, .modal button {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.modal button {
	background-color: #6c3483;
	color: #fff;
	border: none;
	cursor: pointer;
}

.modal button:hover {
	background-color: #5b2c6f;
}

.modal-close {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 20px;
	color: #555;
	cursor: pointer;
}

.success-message {
	color: #6c3483;
	font-weight: bold;
	margin-top: 10px;
	text-align: center;
}

    .upload-input {
        display: flex;
        align-items: center;
    }

    .upload-input label {
        cursor: pointer;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-right: 10px;
    }

    #selected-file {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 150px; /* 최대 너비 제한 */
        flex-grow: 1; /* 남은 공간을 모두 차지하도록 설정 */
    }

    #preview-image {
        max-width: 300px;
        max-height: 300px;
        margin-left: 20px; /* 파일 선택 박스와 미리보기 이미지 사이의 여백 조절 */
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

	<!-- Preloader 로딩중-->
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
										<li><a href="logout.do"><i class="lni lni-enter"></i>
												로그아웃</a></li>
									</ul>
									<%
										}
									%>
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

	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">가게 상세보기</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="index.html">홈</a></li>
						<li>가게 상세보기</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Start Item Details -->
	<section class="item-details section">
		<div class="container">
			<div class="top-area">
				<div class="row">
					<div class="col-lg-6 col-md-12 col-12">
						<div class="product-images">
							<main id="gallery">
								<div class="main-
">
									<%
										int cnt = 0;
									for (ReviewVO review : reviewList) {
										if (mypageService.reviewImgPath(review.getReviewNo()).equals("noImg")) {
										} else if (cnt == 0) {
									%>
									<img
										src="<%=request.getContextPath()%>\<%=mypageService.reviewImgPath(review.getReviewNo())%>"
										id="current" alt="#">
									<%
										cnt++;
									} else if (cnt == 1) {
									%>
									<div class="images">
										<img
											src="<%=request.getContextPath()%>\<%=mypageService.reviewImgPath(review.getReviewNo())%>"
											class="img" alt="#">
										<%
											cnt++;
										} else if (cnt >= 2 && cnt < reviewList.size()) {
										%>
										<img
											src="<%=request.getContextPath()%>\<%=mypageService.reviewImgPath(review.getReviewNo())%>"
											class="img" alt="#">
										<%
											cnt++;
										} else {
										%>
									</div>
									<%
										}
									}
									%>
								</div>
							</main>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-12">
						<div class="product-info">
							<h2 class="title">
								<%=rv.getRstrntName()%>
							</h2>
							<div class="cert_mark">
								<p class="check_mark">
									<%
										String sc = rv.getRstrntScore().substring(0, 2);
									if (Integer.parseInt(sc) > 80) {
									%>
									<i class="fa fa-check-circle" aria-hidden="true"></i>
									<%
										}
									%>
								</p>
								<p class="like_mark">
									<%
										if (rv.getRstrntLike() > 100) {
									%>
									<i class="fa fa-gratipay" aria-hidden="true"></i>
									<%
										}
									%>
								</p>
							</div>
							<p class="location">
								<i class="lni lni-map-marker"></i>
								<%
									for (String addr : addressParts) {
								%>
								<a href='/TasteMap/map.do?addr=<%=rv.getRstrntAddr()%>'
									class="local" target="_blank"> <%=addr%>
								</a>
								<%
									}
								%>
							</p>
							<h5 class="score_avg">
								<%
									
								%>
							</h5>
							<div class="star-wrapper">
								<p class="starBtn">
									<i class="fa fa-star" aria-hidden="true"></i>
								</p>
								<span class="score_starBtn"> <%=rv.getRstrntScore()%>
								</span>
							</div>
							<div class="list-info">
								<h4>Informations</h4>


								<%
									if (myInfo != null) {
									request.setAttribute("rstrntCode", rv.getRstrntCode());
								%>
								<div>
									<p class="map_view" onclick="openModal()">모임 등록</p>

									<div id="myModal" class="modal">
										<span class="modal-close" onclick="closeModal()">&times;</span>
										<label for="locationInput">지역:</label> <input type="text"
											id="locationInput" placeholder="대전"> <label
											for="dateInput">날짜:</label> <input type="date" id="dateInput">

										<label for="timeInput">시간:</label> <input type="time"
											id="timeInput"> <label for="maxPeopleInput">최대
											인원:</label> <input type="number" id="maxPeopleInput" min="1">

										<label for="descriptionInput">한줄 내용:</label>
										<textarea id="descriptionInput" rows="4"
											placeholder="모임에 대한 간단한 설명"></textarea>

										<button onclick="submitForm()">등록</button>
										<button onclick="closeModal()">취소</button>
										<div id="successMessage" class="success-message"></div>
									</div>
									<%
										}
									%>




									<script>
    function toggleModal() {
            const modal = document.getElementById('myModal');
            document.body.classList.toggle('modal-open');
            modal.style.display = (modal.style.display === 'none' || modal.style.display === '') ? 'block' : 'none';
        }
    function openModal() {
        document.getElementById('myModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('myModal').style.display = 'none';
    }

    function submitForm() {
    	var locationValue = document.getElementById('locationInput').value;
    	var dateValue = document.getElementById('dateInput').value;
    	var timeValue = document.getElementById('timeInput').value;
    	var maxPeopleValue = document.getElementById('maxPeopleInput').value;
    	var descriptionValue = document.getElementById('descriptionInput').value;
//     	var hidden = document.getElementById('hiddenInput').value; // 수정된 부분
		var hidden = "<%=rv.getRstrntCode()%>";
		console.log(hidden);

        // Ajax 요청
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    // 응답 처리
                    document.getElementById('successMessage').innerText = '모임이 성공적으로 등록되었습니다!';
                    setTimeout(function() {
                        successMessageElement.innerText = '';
                        closeModal();
                        // 페이지 새로고침
                        location.reload();
                    }, 2000);
                    // 성공 메시지를 몇 초 후에 숨기거나 적절한 방식으로 처리 가능
                    setTimeout(function() {
                        document.getElementById('successMessage').innerText = '';
                        closeModal();
                    }, 2000);
                } else {
                    // 에러 처리
                    document.getElementById('successMessage').innerText = '등록 실패. 다시 시도해주세요.';
                }
            }
        };

        // 동적으로 서블릿 URL 생성
        var servletUrl = "restaurant/meeting.do"; // 실제 서블릿 경로
        var urlWithParams = servletUrl + "?location=" + encodeURIComponent(locationValue) +
                            "&date=" + encodeURIComponent(dateValue) +
                            "&time=" + encodeURIComponent(timeValue) +
                            "&maxPeople=" + encodeURIComponent(maxPeopleValue) +
                            "&description=" + encodeURIComponent(descriptionValue)+
                            "&hidden="+ encodeURIComponent(hidden);

        xhr.open("POST", urlWithParams, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

        xhr.send();
    }

    </script>




									<ul>
										<li><span><i class="fa fa-phone"
												aria-hidden="true"></i></span> "<%=rv.getRstrntTel()%>"</li>
										<li><span><i class="fa fa-tag" aria-hidden="true"></i></span>
											<%=rv.getRstrntTag()%></li>
									</ul>
								</div>






								<div class="contact-info">
									<ul>
<!-- 										<li><a href="#" class="reservation"> <i -->
<!-- 												class="fa fa-calendar-plus-o" aria-hidden="true"></i> 예약 <span>reservation -->
<!-- 													& Get more info</span> -->
<!-- 										</a></li> -->
										<li><a href="javascript:kakaoShare()" class="share open_btn"> <i
												class="fa fa-share-square-o" aria-hidden="true"></i>
										</a></li>
									</ul>
								</div>
								<div class="like-mark">
									<ul>
										<li><a href="javascript:void(0)" class="likeBtn"> <i
												class="fa fa-heart" aria-hidden="true"></i>
										</a></li>
										<span id="count_like"><%=rv.getRstrntLike()%></span>
										
										<%if(myInfo != null){ %>
										<li>
										<a href="#" class="bookBtnY"
										 data-rst-code="<%=rv.getRstrntCode()%>"> 
										<i class="fa fa-bookmark" aria-hidden="true"></i>
										</a>
										</li>
										<%} else{ %>
										<li>
										<a href="#" class="bookBtnN"> 
										<i class="fa fa-bookmark" aria-hidden="true"></i>
										</a>
										</li>
										<%} %>
										
									</ul>
								</div>

							</div>

						</div>
					</div>
				</div>
<script type="text/javascript">
$(".bookBtnY").click(function () {
	var rstrntCode = $(this).data('rst-code');
	Swal.fire({
		   title: '<%=rv.getRstrntName()%>',
		   text: '즐겨찾기에 등록하시겠습니까?',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '등록하기', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소하기', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: true, // 버튼 순서 거꾸로
		   
		}).then(result =>  {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		      Swal.fire('등록을 진행합니다.', '기다려주세요~', 'success');
		      $.ajax({
		          type: 'POST', // 또는 'GET'
		          url: 'restaurant/addfavorite.do', // 서블릿 URL
		          data: { rstrntCode : rstrntCode }, // 전송할 데이터
		          success: function(response) {
		             // 서블릿에서의 처리가 성공했을 때 실행되는 코드
		             Swal.fire('즐겨찾기 추가에 성공하셨습니다.', '축하합니다!', 'success');
		             location.reload();
		          },
		          error: function(error) {
		             // 에러 발생 시 실행되는 코드
		             Swal.fire('에러가 발생했습니다.', '다시 시도해주세요.', 'error');
		          }
		       });
		   
		   }
		});
  });
$(".bookBtnN").click(function () {
    Swal.fire({
      icon: 'error',
      title: '로그인 정보 없음.',
      text: '즐겨찾기 기능은 로그인 이후에 사용 가능합니다.',
    });
  });
</script>
				<!-- 24-01-11/////////////////////////////////////////////////////////////////////// -->
				<div class="item-details-blocks">
					<div class="row">
						<div class="col-lg-8 col-md-7 col-12">
							<!-- Start Single Block -->
							<div class="single-block description time_OL">
								<div class="OLState">
									<h3 class="time">영업시간</h3>
									<%
									LocalTime currentTime = LocalTime.now();
									DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
									LocalTime openTime = LocalTime.parse(bv.getBsnOpentime());
									LocalTime closeTime = LocalTime.parse(bv.getBsnClosetime());
									if (currentTime.isAfter(openTime) && currentTime.isBefore(closeTime)) {
									%>
									<p class="open">OPEN</p>
									<%
										} else {
									%>
									<p class="open">CLOSE</p>
									<%
										}
									%>
									<i class="fa fa-clock-o" aria-hidden="true"></i>
								</div>
								<ul class="details-list">
									<li class="time">오픈시간 : <%=bv.getBsnOpentime()%>
									</li>
									<li class="time">마감시간 : <%=bv.getBsnClosetime()%>
									</li>
									<li class="time additional-info">휴게시간 : <%=bv.getBsnReststart()%>
										~ <%=bv.getBsnRestfinish()%>
									</li>
								</ul>
							</div>
							<!-- End Single Block -->
							<!-- Start Single Block -->
							<!-- End Single Block -->


							<!-- /////////////////////////////////////////////////////////////////////// -->

							<!-- 2021-01-14 여기부터1!!!!!/////////////////////////////////////////////////////////////////////// -->
							<!-- Start Single Block -->
							<div class="single-block menu_box">
								<div class="menu_info">
									<h3>메뉴정보</h3>
									<div class="menu_list">
										<table>
											<%
												int displayMenuCount = 10;
											for (int i = 0; i < Math.min(menuList.size(), displayMenuCount); i++) {
												MenuVO mv = menuList.get(i);
											%>




											<tr class="menu_iist_box">
												<td class="menu_food"><%=mv.getMenuName()%></td>
												<td class="menu_line">----------------------------------------------------------------------------------------------------------------------------------------------------</td>
												<td class="menu_price"><%=mv.getMenuPrice()%></td>
											</tr>

											<%
												}
											%>



										</table>
									</div>
								</div>
							</div>
							<!-- End Single Block -->
							<!-- Start Single Block -->
							<div class="single-block comments visitor_review">
								<h3 class="visitor_review_title">방문자 리뷰</h3>
								<!-- 2024-01-16 작성 -->
								<div class="visitor_review_starBtn">
									<ul class="visitor_review_starBtn_content">

										<%
											int score = 0;
										int taste = 0;
										int price = 0;
										int service = 0;
										for (ReviewVO review : reviewList) {
											score += review.getReviewScore();
											taste += review.getReviewTaste();
											price += review.getReviewPrice();
											service += review.getReviewService();
										}
										%>
										<li class="visitor_review_starBtn_title">리뷰총점 :</li>



										<li class="visitor_review_starBtn_content_i">

											<div class="visitor_review_content_star" id="starContainer">
												<%
													for (int i = 1; i <= 5; i++) {
													if (i <= score / reviewList.size()) {
												%>
												<i class="fa fa-star" aria-hidden="true"></i>
												<%
													} else {
												%>



												<i class="fa fa-star-o" aria-hidden="true"></i>

												<%
													}
												}
												%>
											</div> <!-- 별 넣기 -->
									</ul>


									<div class="visitor_review_starBtn_op">
										<span>맛: <%=(taste / reviewList.size())%><i
											class="fa fa-star" aria-hidden="true"></i></span> <span>가격: <%=(price / reviewList.size())%><i
											class="fa fa-star" aria-hidden="true"></i></span> <span>서비스:
											<%=(service / reviewList.size())%><i class="fa fa-star"
											aria-hidden="true"></i>
										</span>
									</div>


								</div>
<!-- 								<div class="visitor_review_tags"> -->
<!-- 									<ul class="visitor_review_purpose1"> -->
<!-- 										<li class="visitor_review_purpose_title1">방문목적</li> -->
<!-- 										<li class="tag1">tag1</li> -->
<!-- 										<li class="tag2">tag2</li> -->
<!-- 									</ul> -->
<!-- 									<ul class="visitor_review_purpose2"> -->
<!-- 										<li class="visitor_review_purpose_title2">분위기</li> -->
<!-- 										<li class="tag1">tag1</li> -->
<!-- 										<li class="tag2">tag2</li> -->
<!-- 									</ul> -->
<!-- 								</div> -->

								<%
									for (ReviewVO review : reviewList) {
								%>
								<!-- Start Single Comment -->
								<div class="single-comment visitor_review_comment">
									<div class="visitor_review_content">
										<div class="visitor_review_review_comment_box">

											<%
												if (mypageService.getProfileImgNo(review.getCstmrId()) != 0) {
												ProfileImgVO img = mypageService.profileImgInfo(mypageService.getProfileImgNo(review.getCstmrId()));
												String src = img.getProfileImgCours() + "/" + img.getProfileImgName();
											%>
											<img class="profileImg"
												src="${pageContext.request.contextPath}/<%=src%>" alt="Logo">
											<%
												} else {
											%>
											<img class="profileImg"
												src="${pageContext.request.contextPath}/assets/images/profile/defaulprofile.png"
												alt="기본이미지">
											<%
												}
											%>



											<h4>
												<%=mypageService.getNick(review.getCstmrId())%>
											</h4>
											<div class="visitor_review_content_icon">
												<div class="visitor_review_content_ds">
													<div class="visitor_review_content_star"
														id="starContainer_<%=review.getReviewNo()%>">
														<i class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i> <i
															class="fa fa-star-o" aria-hidden="true"></i>
													</div>
													<div class="visitor_review_content_day">
														<%=review.getReviewDate()%>
													</div>
												</div>
												<div class="visitor_review_content_op">
													<span>맛: <%=review.getReviewTaste()%> <i
														class="fa fa-star" aria-hidden="true"></i>
													</span> <span>가격 : <%=review.getReviewPrice()%><i
														class="fa fa-star" aria-hidden="true"></i>
													</span> <span>서비스: <%=review.getReviewService()%> <i
														class="fa fa-star" aria-hidden="true"></i>
													</span>
												</div>
											</div>

											<div class="visitor_review_content_it">
												<span class="visitor_review_content_img"> <%
													 	if (mypageService.reviewImgPath(review.getReviewNo()).equals("noImg")) {
													 %> <%
													 	} else {
													 %> <img class="reviewImg"
													src="<%=request.getContextPath()%>\<%=mypageService.reviewImgPath(review.getReviewNo())%>"
													alt="#"> <%
														 	}
														 %>
												</span>


												<p class="visitor_review_text">
													<%=review.getReviewContent()%>
												</p>
											</div>
										</div>
									</div>
								</div>
								<!-- End Single Comment -->

								<script>
                                    // 숫자에 따라서 별을 채우는 함수
                                    function fillStars(reviewNo, starCount) {
                                        // 해당 리뷰의 별 컨테이너를 찾아서 별을 채움
                                        $('#starContainer_' + reviewNo + ' i').removeClass('fa-star').addClass('fa-star-o');

                                        // 지정된 별까지 색깔을 채움
                                        for (let i = 0; i < starCount; i++) {
                                            $('#starContainer_' + reviewNo + ' i').eq(i).removeClass('fa-star-o').addClass('fa-star');
                                        }
                                    }

                                    // 예제: 숫자 3에 따라서 해당 리뷰의 별을 채움
                                    fillStars(<%=review.getReviewNo()%>, <%=review.getReviewScore()%>);



                                    // 글자 길이에 따라 동적으로 높이를 조절하는 함수
                                    function adjustTextHeight(reviewNo) {
                                        var textElement = $('#reviewText_' + reviewNo);
                                        textElement.css('height', 'auto'); // 초기 높이를 auto로 설정
                                        var textHeight = textElement.height();
                                        var lineHeight = parseInt(textElement.css('line-height'));
                                        var lines = textHeight / lineHeight;
                                        var maxHeight = lineHeight * 3; // 최대 3줄까지 표시하고 더 많은 경우는 스크롤
                                        if (lines > 3) {
                                            textElement.css('height', maxHeight + 'px');
                                        }
                                    }

                                    // 해당 리뷰의 텍스트에 대해 높이를 동적으로 조절
                                    adjustTextHeight(<%=review.getReviewNo()%>);
                                </script>
								<%
									}
								%>
							</div>
							<!-- End Single Block -->
							<div class="single-block comment-form">
								<h3>리뷰 작성하기</h3>
								<%
									if (myInfo != null) {
								%>
								<div class="step-two-content">
									<form class="default-form-style" method="post"
										action="<%=request.getContextPath()%>/restaurant/postreview.do"
										enctype="multipart/form-data">
										<div class="row">
											<input type="hidden" name="rstrntCode"
												value="<%=rv.getRstrntCode()%>">
											<div class="col-12 col-md-4">
												<div class="form-group">
													<label>맛 점수:</label>
													<div class="selector-head">
														<span class="arrow"><i class="lni lni-chevron-down"></i></span>
														<select class="user-chosen-select" name="reviewTaste">
															<option value="1">★</option>
															<option value="2">★★</option>
															<option value="3">★★★</option>
															<option value="4">★★★★</option>
															<option value="5">★★★★★</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-4">
												<div class="form-group">
													<label>가격 점수:</label>
													<div class="selector-head">
														<span class="arrow"><i class="lni lni-chevron-down"></i></span>
														<select class="user-chosen-select" name="reviewPrice">
															<option value="1">★</option>
															<option value="2">★★</option>
															<option value="3">★★★</option>
															<option value="4">★★★★</option>
															<option value="5">★★★★★</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-4">
												<div class="form-group">
													<label>서비스 점수:</label>
													<div class="selector-head">
														<span class="arrow"><i class="lni lni-chevron-down"></i></span>
														<select class="user-chosen-select" name="reviewService">
															<option value="1">★</option>
															<option value="2">★★</option>
															<option value="3">★★★</option>
															<option value="4">★★★★</option>
															<option value="5">★★★★★</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-lg-6 col-12">
    <div class="upload-input">
        <label for="file" class="text-center content">
            <span class="text">
                <span class="mb-15 plus-icon"><i class="lni lni-plus"></i></span>
                <span class="main-btn d-block btn-hover">이미지 파일 선택</span>
            </span>
        </label>
        <input type="file" id="file" name="file" style="display: none;" onchange="displayFilePreview(this)">
        <span id="selected-file">파일 선택</span>
        <div id="preview-image-container">
            <img id="preview-image" src="#" alt="미리보기 이미지">
        </div>
    </div>
</div>


<script>
    function displayFilePreview(input) {
        var fileInput = input.files[0];

        if (fileInput) {
            var reader = new FileReader();

            reader.onload = function (e) {
                document.getElementById('preview-image').src = e.target.result;
                document.getElementById('selected-file').innerText = fileInput.name;
            };

            reader.readAsDataURL(fileInput);
        } else {
            document.getElementById('preview-image').src = '#';
            document.getElementById('selected-file').innerText = '파일 선택';
        }
    }
</script>








											<div class="col-12">
												<div class="form-group mt-30">
													<label for="reviewContent">리뷰 내용</label>
													<textarea placeholder="리뷰 내용 작성" name="reviewContent"></textarea>
												</div>
											</div>
											<div class="col-12">
												<div class="form-group button mb-0">
													<button type="submit" class="btn alt-btn">등록하기</button>
													<button type="button" onclick="refreshPage()" class="btn">취소하기</button>
												</div>

											</div>
										</div>
									</form>
								</div>
								<%
									} else {
								%>
								<div class="col-12">
									<a
										href="<%=request.getContextPath()%>/views/customer/login.html">
										로그인 하러 가기</a>
								</div>
								<%
									}
								%>



								<!-- 다른 폼 요소들을 여기에 추가하세요 -->
								<script>
                                                            function refreshPage() {
                                                                // 현재 페이지를 새로고침
                                                                location.reload();
                                                            }
                                                        </script>
							</div>


							<!-- Start Single Block -->
							<div class="single-block comment-form">
								<h3>블로그 리뷰</h3>
								<div class="blog_form" id="blog_form"></div>
								<form action="#" method="POST">
									<div class="row"></div>
								</form>
							</div>
							<!-- End Single Block -->
						</div>
						<div class="col-lg-4 col-md-5 col-12">
							<div class="item-details-sidebar">
								<!-- Start Single Block -->
								<!-- <div class="single-block author">
								<!-- End Single Block -->
								<!-- Start Single Block -->
								<div class="single-block content-seller comment-form">
									<h3>가게에서 진행중인 모임</h3>
									<div class="meeting_info-container">
										<i class="fa fa-chevron-left" id="prevMeeting"
											aria-hidden="true"></i>
										<div class="meeting_info-list">
											<%
												int number = 1;
											for (MeetingVO mv : meetingList) {
												if (mv.getMeetingNmpr() != meetingService.getMeetingCount(mv.getMeetingNo())) {
											%>
											<div class="meeting_info in_fo<%=number%>">
												<p class="meeting_title">
													닉네임 :
													<%=mypageService.getNick(mv.getCstmrId())%></p>
												<p class="meeting_region">
													장소 :
													<%=mv.getMeetingRegion()%></p>
												<p class="meeting_date">
													날짜 :
													<%=mv.getMeetingDate()%><br>시간 :<%=mv.getMeetingTime()%></p>
												<!-- 클릭 시 JavaScript 함수 호출 및 모임 정보 전달 -->
												<button class="meeting_detile meeting_modal"
													onclick="showMeetingDetail('<%=mypageService.getNick(mv.getCstmrId())%>', '<%=mv.getMeetingRegion()%>', 
                    '<%=mv.getMeetingNmpr()%>', '<%=mv.getMeetingDate()%>', '<%=mv.getMeetingTime()%>', 
                    '<%=mv.getMeetingComment()%>','<%=mv.getMeetingNo()%>','<%=meetingService.getMeetingCount(mv.getMeetingNo())%>')">자세히보기</button>
											</div>
											<%
												number++;
											}
											}
											%>
										</div>
										<i class="fa fa-chevron-right" id="nextMeeting"
											aria-hidden="true"></i>

										<div id="meeting_modal_detail">
											<div class="meeting_modal_top">
												<span class="meeting_modal_title">뭐먹을 지도 모임!</span> <i
													class="fa fa-times close_btn" aria-hidden="true"></i>
											</div>
											<div class="meeting_modal_text">
												<span id="modalMeetingNick"></span> <span
													id="modalMeetingRegion"></span> <span id="modalMeetingNmpr"></span>
												<span id="modalMeetingDate"></span> <span
													id="modalMeetingTime"></span> <span
													id="modalMeetingComment"></span>
												<!-- 수정된 부분: 모임 번호를 저장할 요소 추가 -->
												<span id="modalMeetingNo" style="display: none;"></span>
												<!-- "참여하기" 버튼에 onclick 이벤트 추가 -->
												<%
													if (myInfo != null) {
												%>
												<span class="meeting_go" id="yesLogin">참여하기</span>
												<%
													} else {
												%>
												<span class="meeting_go" id="noLogin">참여하기</span>
												<%
													}
												%>
												<!-- 				<span class="meeting_go" id="yesLogin">참여하기</span> -->
											</div>
										</div>
									</div>
								</div>

								<script type="text/javascript">
$("#yesLogin").click(function () {
	var meetingNo = document.getElementById('modalMeetingNo').innerText;
	Swal.fire({
		   title: meetingNo+'번 모임!',
		   text: '모임에 참여하시겠습니까?',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '참여하기', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소하기', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: true, // 버튼 순서 거꾸로
		   
		}).then(result =>  {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		      Swal.fire('승인이 완료되었습니다.', '화끈하시네요~!', 'success');
		      $.ajax({
		          type: 'POST', // 또는 'GET'
		          url: 'restaurant/join.do', // 서블릿 URL
		          data: { meetingNo: meetingNo }, // 전송할 데이터
		          success: function(response) {
		             // 서블릿에서의 처리가 성공했을 때 실행되는 코드
		             Swal.fire('승인이 완료되었습니다.', '환영합니다!', 'success');
		          },
		          error: function(error) {
		             // 에러 발생 시 실행되는 코드
		             Swal.fire('에러가 발생했습니다.', '다시 시도해주세요.', 'error');
		          }
		       });
		   
		   }
		});
  });
$("#noLogin").click(function () {
    Swal.fire({
      icon: 'error',
      title: '로그인 정보 없음.',
      text: '모임 기능은 로그인 이후에 사용 가능합니다.',
    });
  });
  
    function showMeetingDetail(nick, region, nmpr, date, time, comment, meetingNo,meetingCount) {
        // 각 모임 정보를 모달에 채워넣기
        document.getElementById('modalMeetingNick').innerText = '닉네임 : ' + nick;
        document.getElementById('modalMeetingRegion').innerText = '모임지역 : ' + region;
        document.getElementById('modalMeetingNmpr').innerText = '모임인원수: ' + nmpr + '(' + meetingCount+ ')';
        document.getElementById('modalMeetingDate').innerText = '모임날짜 : ' + date;
        document.getElementById('modalMeetingTime').innerText = '모임시간 : ' + time;
        document.getElementById('modalMeetingComment').innerText = '모임 코멘트 : ' + comment;

        // 모임 번호를 저장
        document.getElementById('modalMeetingNo').innerText = meetingNo;

        // 모달 창 열기 등의 추가적인 동작 수행 가능
        // 예시: 모달 창 열기
        $('#meeting_modal_detail').show();
    }

    

</script>







								<!-- End Single Block -->
								<!-- Start Single Block -->
								<div class="single-block ">
									<h3 class="map_h3">지도</h3>
									<div id="map" style="width: 320px; height: 300px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>
	<!-- End Item Details -->

	<!-- Start Newsletter Area -->
	<!-- End Newsletter Area -->

	<!-- Start Footer Area -->
						
	<%@ include file="../admin/adminFooter.jsp"%>
	<!--/ End Footer Area -->

	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top btn-hover"> <i
		class="lni lni-chevron-up"></i>
	</a>

	<!-- ========================= JS here ========================= -->
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/wow.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/tiny-slider.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/glightbox.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/item-details.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ccd00174a49121da7c06055801ba062&libraries=services"></script>
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">

        let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        let map = new kakao.maps.Map(mapContainer, mapOption);

        // 지도 이동 끄기
        map.setDraggable(false);

        // 지도 확대/축소 끄기
        map.setZoomable(false);



        // 주소-좌표 변환 객체를 생성합니다
        let geocoder = new kakao.maps.services.Geocoder();

        // 주소 정보 담은 배열 선언 후 for문 돌려서 마커 전부 찍기(객체 배열 활용)
        // 해당 가게 지도는 주소 받아서 넣기
        // 가게 주소 클릭 시 해당 가게 주소 넣기


        // 주소로 좌표를 검색합니다
        geocoder.addressSearch("<%=rv.getRstrntAddr()%>", function (result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                let marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                let infowindow = new kakao.maps.InfoWindow({
                    // 주소에 해당하는 가게 명 + 가게 페이지 링크 넣기
                    content: '<div style="text-align:center;width:150px;padding:6px 0;background-color:#fff; font-size:12px; color:#5830E0; font-weight:bold;">' + "<%=rv.getRstrntName()%>"+ '</div>'});
								infowindow.open(map, marker);
								map.setCenter(coords); // 처음 주소 가운데 고정시키기
							}
						});

		let rst = <%=request.getAttribute("blog")%>
		console.log(rst);

		let newUl = document.createElement('ul');
		newUl.className = "ul";

		for (let i = 0; i < rst.length; i++) {

			let titleLi = document.createElement("li");
			titleLi.className = "blog_review_title";

			let titleLink = document.createElement("a");
			titleLink.href = rst[i].link;
			titleLink.target = "_blank";
			titleLink.innerHTML = rst[i].title;

			titleLi.appendChild(titleLink);

			let contentLi = document.createElement("li");
			contentLi.className = "blog_review_content";
			contentLi.innerHTML = rst[i].description;

			// <div> 요소 생성
			let divReview = document.createElement("div");
			divReview.className = "blog_review_nt";

			// <li> 요소들 생성 및 내용 설정
			let nameLi = document.createElement("li");
			nameLi.className = "blog_review_name";
			nameLi.textContent = rst[i].bloggername;

			let dateLi = document.createElement("li");
			dateLi.className = "blog_review_date";

			let dateString = rst[i].postdate;

			let year = dateString.substring(0, 4);
			let month = dateString.substring(4, 6);
			let day = dateString.substring(6, 8);

			let postDate = year + "-" + month + "-" + day;

			dateLi.textContent = postDate;

			divReview.appendChild(nameLi);
			divReview.appendChild(dateLi);

			// <ul> 요소에 <li>와 <div> 요소들 추가
			newUl.appendChild(titleLi);
			newUl.appendChild(contentLi);
			newUl.appendChild(divReview);
		}

		let div = document.getElementById("blog_form");
		div.appendChild(newUl);
		
		console.log("<%=request.getContextPath()%>/<%=rstService.getRstrntFile(request.getParameter("rstrntCode"))%>");
		
		Kakao.init('5ccd00174a49121da7c06055801ba062');
		
		console.log("<%=request.getContextPath()%>\<%=mypageService.reviewImgPath(reviewList.get(0).getReviewNo())%>");

        function kakaoShare() {
            Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                    title: "<%=rv.getRstrntName()%>",
                    description: `<%=menuList.get(0).getMenuName()%>
<%=rv.getRstrntAddr()%>`,
                    imageUrl: 'http://192.168.143.33:8888/<%=request.getContextPath()%><%=mypageService.reviewImgPath(reviewList.get(0).getReviewNo())%>',
                    link: {
                        mobileWebUrl: 'http://localhost:8888/TasteMap/restaurantDetail.do?rstrntCode=<%=rv.getRstrntCode()%>',
                        webUrl: 'http://localhost:8888/TasteMap/restaurantDetail.do?rstrntCode=<%=rv.getRstrntCode()%>',
                    },
                },
                buttons: [
                    {
                        title: '웹으로 보기',
                        link: {
                            mobileWebUrl: 'http://localhost:8888/TasteMap/restaurantDetail.do?rstrntCode=<%=rv.getRstrntCode()%>',
                            webUrl: 'http://localhost:8888/TasteMap/restaurantDetail.do?rstrntCode=<%=rv.getRstrntCode()%>'
                        },
                    },
                ],
                // 카카오톡 미설치 시 카카오톡 설치 경로이동
                installTalk: true,
            })
        }
	</script>



</body>

</html>