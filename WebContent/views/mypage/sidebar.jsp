<%@page import="member.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 자바 로직 처리부분
CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
%>
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.svg" />
<!-- Web Font -->
<head>

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
</head>
<body>
	<section class="dashboard section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-12">
					<div class="dashboard-sidebar">
						<div class="user-image">
							<img src="https://via.placeholder.com/300x300" alt="#">
							<h3>
								<%=myInfo.getCstmrName()%>
								<span><a href="javascript:void(0)">@<%=myInfo.getCstmrNick()%></a></span>
							</h3>
						</div>
						<div class="dashboard-menu">
							<ul>
								<li><a class="active"
									href="<%=request.getContextPath()%>/mypage/main.do"><i
										class="lni lni-dashboard"></i> 대쉬보드</a></li>
								<li><a
									href="<%=request.getContextPath()%>/mypage/setting.do"><i
										class="lni lni-pencil-alt"></i> 정보수정</a></li>
								<li><a
									href="<%=request.getContextPath()%>/mypage/freeboard.do"><i
										class="lni lni-bolt-alt"></i> 내 게시글</a></li>
								<li><a
									href="<%=request.getContextPath()%>/views/mypage/sidebar.jsp"><i
										class="lni lni-heart"></i> 즐겨찾는 가게</a></li>
								<li><a href="post-item.html"><i
										class="lni lni-circle-plus"></i> Post An Ad</a></li>
								<li><a href="bookmarked-items.html"><i
										class="lni lni-bookmark"></i> 즐겨찾기</a></li>
								<li><a href="messages.html"><i class="lni lni-envelope"></i>
										채팅</a></li>
								<li><a
									href="<%=request.getContextPath()%>/mypage/withdrawal.do"><i
										class="lni lni-trash"></i> 회원탈퇴</a></li>
								<li><a href="invoice.html"><i class="lni lni-printer"></i>
										Invoice</a></li>
							</ul>
							<div class="button">
								<a class="btn" href="/TasteMap/logout.do">로그아웃</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- ========================= JS here ========================= -->
	
	<script>
  $(document).ready(function() {
    // 클릭 이벤트 처리
    $(".dashboard-menu ul li a").click(function() {
      // 기존에 active 클래스를 가진 요소에서 제거
      $(".dashboard-menu ul li a").removeClass("active");

      // 현재 클릭한 요소에 active 클래스 추가
      $(this).addClass("active");
    });
  });
</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="..." crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/wow.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/tiny-slider.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/glightbox.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/main.js"></script>
</body>