<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="mypage.vo.ProfileImgVO"%>
<%@page import="member.vo.CustomerVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="restaurant.vo.RestaurantVO"%>
<%@page import="restaurant.service.RestaurantServiceImpl"%>
<%@page import="restaurant.service.RestaurantService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<%
	request.setCharacterEncoding("UTF-8");

	CustomerVO cv = (CustomerVO) request.getSession().getAttribute("loginCode");	
	IMypageService mypageService = MypageServiceImple.getInstance();

	List<RestaurantVO> rl = (List<RestaurantVO>) request.getAttribute("searchList");

	RestaurantService restaurantService = RestaurantServiceImpl.getInstance();
	
	String menu = (String) request.getParameter("menuName");
	String location = (String) request.getParameter("location");
	String rstName = (String) request.getParameter("rstrntName");
	
	
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
	
	<style type="text/css">
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
                <span></span>
                <span></span>
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
                        src="assets/images/logo/맛있을지도로고.png"
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
                              href="../../cmmnty/list.do" 
                              >자유게시판 📋</a>
                              </li>
                            <li class="nav-item"><a class=" dd-menu collapsed"
                              href="../../admin/noticeList.do" 
                              >공지사항📣</a></li>
                              
                           <li class="nav-item"><a class=" dd-menu collapsed"
                              href="faq.html" 
                              >자주묻는질문 ❓</a></li>
                              
                           <li class="nav-item"><a class=" dd-menu collapsed"
                              href="mypage/setting.do"
                              >마이페이지 &#128064;</a></li>
                     </div>
                     <!-- navbar collapse -->
                     <div class="login-button">
                        <%
										if (cv == null) {
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
                     	<%if(cv != null){
							if (cv.getProfileImgNo() != 0) {
							ProfileImgVO img = mypageService.profileImgInfo(cv.getProfileImgNo());
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
                        <h1 class="page-title">검색 결과</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="../../home.do">홈</a></li>
                        <li>맛집 검색</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Items Listing Grid -->
     <div class="search-form wow fadeInUp" style="display: flex; justify-content: center; align-items: center;">
                            <form action="/TasteMap/search.do">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-12 p-0">
                                    <div class="search-input">
                                        <label for="keyword"><i class="lni lni-search-alt theme-color"></i></label>
                                        <%if(rstName != null) { %>
                                        <input type="text" name="rstrntName" id="rstrntName" placeholder="가게명" value="<%=rstName%>">
                                        <%} else {%>
                                        <input type="text" name="rstrntName" id="rstrntName" placeholder="가게명">
                                        <%} %>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-12 p-0">
                                    <div class="search-input">
                                        <label for="category"><i class="lni lni-grid-alt theme-color"></i></label>
                                         <%if(rstName != null) { %>
                                        <input type="text" name="rstrntName" id="rstrntName" placeholder="메뉴" value="<%=menu%>">
                                        <%} else {%>
                                        <input type="text" name="rstrntName" id="rstrntName" placeholder="메뉴">
                                        <%} %>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-12 p-0">
                                    <div class="search-input">
                                        <label for="location"><i class="lni lni-map-marker theme-color"></i></label>
                                        <select name="location" id="location">
                                            <option value="none" selected disabled>지역</option>
                                            <option value="서울">서울</option>
                                            <option value="강원">강원</option>
                                            <option value="경기">경기</option>
                                            <option value="경남">경남</option>
                                            <option value="경북">경북</option>
                                            <option value="광주">광주</option>
                                            <option value="대구">대구</option>
                                            <option value="대전">대전</option>
                                            <option value="부산">부산</option>
                                            <option value="세종">세종</option>
                                            <option value="울산">울산</option>
                                            <option value="인천">인천</option>
                                            <option value="전남">전남</option>
                                            <option value="전북">전북</option>
                                            <option value="제주">제주</option>
                                            <option value="충남">충남</option>
                                            <option value="충북">충북</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-2 col-12 p-0">
                                    <div class="search-btn button">
                                        <button class="btn" type="submit" id="searchList"><i class="lni lni-search-alt"></i> 검색</button>
                                    </div>
                                </div>
                            </div>
                            </form>
                        </div>
    <section class="category-page section">
        <div class="container">
        <div id="result"></div>
            <div class="row" style="display: flex; justify-content: center; align-items: center; min-height: 100vh;">
<!--                 <div class="col-lg-3 col-md-4 col-12"> -->
<!--                     <div class="category-sidebar"> -->
<!--                     </div> -->
<!--                 </div> -->
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="category-grid-list">
                        <div class="row">
                            <div class="col-12">
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-grid" role="tabpanel"
                                        aria-labelledby="nav-grid-tab">
                                        <div class="row" id="rstrntList">
                                            
                                        </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-list" role="tabpanel"
                                        aria-labelledby="nav-list-tab">
                                        <div class="row">
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- Pagination -->
                                                <div class="pagination left">
                                                    <ul class="pagination-list">
                                                        <li><a href="javascript:void(0)">1</a></li>
                                                        <li class="active"><a href="javascript:void(0)">2</a></li>
                                                        <li><a href="javascript:void(0)">3</a></li>
                                                        <li><a href="javascript:void(0)">4</a></li>
                                                        <li><a href="javascript:void(0)"><i class="lni lni-chevron-right"></i></a></li>
                                                    </ul>
                                                </div>
                                                <!--/ End Pagination -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Items Listing Grid -->


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
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
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
	
	<script type="text/javascript">
    const itemsPerPage = 30; // 페이지당 표시할 아이템 수
    const restaurantData = [
        <% for(int i = 0; i < rl.size(); i++) {
        	
            int code = rl.get(i).getRstrntCode();
            String rstrntCode = Integer.toString(code);
            
        %>
        {
            imageUrl: "<%=request.getContextPath()%>/<%=restaurantService.getRstrntFile(rstrntCode)%>",
            tag: "<%=rl.get(i).getRstrntTag()%>",
            title: "<%=rl.get(i).getRstrntName()%>",
            titleUrl: "<%=request.getContextPath()%>/restaurantDetail.do?rstrntCode="+<%=code%>,
            location: "<%=rl.get(i).getRstrntAddr()%>",
            tel: "<%=rl.get(i).getRstrntTel()%>"
        },
        <% } %>
    ];

    const initialPageHeight = document.body.scrollHeight;
    
    const totalItems = restaurantData.length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);
    let currentPage = 1;

    function renderItems(page) {
        const startIdx = (page - 1) * itemsPerPage;
        const endIdx = startIdx + itemsPerPage;
        const itemsToRender = restaurantData.slice(startIdx, endIdx);

        const rstrntList = document.getElementById('rstrntList');
        
        rstrntList.innerHTML = ''; // 기존의 내용을 지우고 다시 그림

        itemsToRender.forEach(data => {
        	// 새로운 요소들을 동적으로 생성
    	    const colDiv = document.createElement('div');
    	    colDiv.className = 'col-lg-4 col-md-6 col-12';

    	    const singleItemGrid = document.createElement('div');
    	    singleItemGrid.className = 'single-item-grid';

    	    const imageDiv = document.createElement('div');
    	    imageDiv.className = 'image';

    	    const imageLink = document.createElement('a');
    	    imageLink.href = 'javascript:void(0)';

    	    const image = document.createElement('img');
    	    image.src = data.imageUrl;
    	    image.alt = '#';

    	    const contentDiv = document.createElement('div');
    	    contentDiv.className = 'content';

    	    const tagLink = document.createElement('a');
    	    tagLink.href = 'javascript:void(0)';
    	    tagLink.className = 'tag';
    	    if (data.tag && data.tag !== "null") {
    		    tagLink.textContent = data.tag;
			} else {
    		    tagLink.textContent = "";
			}

    	    const titleLink = document.createElement('h3');
    	    titleLink.className = 'title';

    	    const titleAnchor = document.createElement('a');
    	    titleAnchor.href = data.titleUrl;
    	    titleAnchor.textContent = data.title;

    	    const locationLink = document.createElement('p');
    	    locationLink.className = 'location';

    	    const locationAnchor = document.createElement('a');
    	    locationAnchor.href = 'javascript:void(0)';

    	    const locationIcon = document.createElement('i');
    	    locationIcon.className = 'lni lni-map-marker';

    	    const locationText = document.createElement('span');
    	    locationText.textContent = data.location;

    	    const infoUl = document.createElement('ul');
    	    infoUl.className = 'info';

    	    const telText = document.createElement('span');
    	    telText.className = 'tel';
    	    telText.textContent = data.tel;



    	    // 생성한 요소들을 부모 요소에 추가
    	    colDiv.appendChild(singleItemGrid);
    	    singleItemGrid.appendChild(imageDiv);
    	    imageDiv.appendChild(imageLink);
    	    imageLink.appendChild(image);
    	    singleItemGrid.appendChild(contentDiv);
    	    contentDiv.appendChild(tagLink);
    	    contentDiv.appendChild(titleLink);
    	    titleLink.appendChild(titleAnchor);
    	    contentDiv.appendChild(locationLink);
    	    locationLink.appendChild(locationAnchor);
    	    locationAnchor.appendChild(locationIcon);
    	    locationAnchor.appendChild(locationText);
    	    contentDiv.appendChild(infoUl);
    	    infoUl.appendChild(telText);
    	    
    	    if (singleItemGrid.children.length > 0) {
    	        rstrntList.appendChild(colDiv);
    	    }
        });
        
        if (rstrntList.children.length % itemsPerRow === 0) {
            const colDiv = document.createElement('div');
            colDiv.className = 'row';

            rstrntList.appendChild(colDiv);
            document.body.style.overflow = 'auto';
        }
    }

    
    function renderPagination() {
    	
    	document.body.style.overflow = 'hidden';
    	if (document.body.scrollHeight > window.innerHeight) {
    	    document.body.style.overflow = 'auto';
    	} else {
    	    document.body.style.overflow = 'hidden';
    	}
        const paginationList = document.createElement('ul');
        paginationList.className = 'pagination-list';

        for (let i = 1; i <= totalPages; i++) {
            const listItem = document.createElement('li');
            listItem.className = i === currentPage ? 'active' : '';

            const pageLink = document.createElement('a');
            pageLink.href = 'javascript:void(0)';
            pageLink.textContent = i;

            pageLink.addEventListener('click', () => {
                currentPage = i;
                renderItems(currentPage);
                renderPagination();
            });

            listItem.appendChild(pageLink);
            paginationList.appendChild(listItem);
        }

        const paginationDiv = document.createElement('div');
        paginationDiv.className = 'pagination';
        paginationDiv.style.textAlign = 'center';
        paginationDiv.appendChild(paginationList);

        rstrntList.appendChild(paginationDiv);
        

    	 // 동적으로 요소를 추가한 후 페이지 높이를 동적으로 조절
	     document.body.style.height = 'auto'; // 'auto'로 설정하여 높이를 동적으로 조절
	
	     // 페이지 하단에 보이지 않는 영역 제거
	
	     // 스크롤이 없는 상태에서는 높이를 initialPageHeight로 고정
	    	 
	     	document.body.style.overflow = 'auto';
        
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }
    // 초기 렌더링
    renderItems(currentPage);
    renderPagination();
    <%if(location != null || location != "")%> document.getElementById('location').value = "<%=location%>";
</script>

</body>

</html>