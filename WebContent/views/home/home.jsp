
<%@page import="mypage.vo.ProfileImgVO"%>
<%@page import="mypage.vo.ReviewImgVO"%>
<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="member.vo.CustomerVO"%>
<%@page import="restaurant.service.RestaurantServiceImpl"%>
<%@page import="restaurant.service.RestaurantService"%>
<%@page import="restaurant.vo.RestaurantVO"%>
<%@page import="home.vo.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	List<CategoryVO> ctgryList = (List<CategoryVO>)request.getAttribute("cv");
	RestaurantService rstService = RestaurantServiceImpl.getInstance();
	CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
	IMypageService mypageService = MypageServiceImple.getInstance();
	
%>

<%@page import="java.util.List"%>
<html class="no-js" lang="zxx">
\


<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>맛있을지도 🧑‍🍳</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
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


<!-- 폰트어썸 CDN -->
<script src="https://kit.fontawesome.com/1cc7793b32.js" crossorigin="anonymous"></script>

<!-- jQuery CDN -->
<script src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>

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



.home_check_mark,
.home_like_mark {
  display: inline-block;
  font-size: 30px;
  position: absolute;
  right: 15px;
  top: 35px;
  color: #5830E0;
}

.home_check_mark {
  margin-right: 35px;
}

.home_like_mark {
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
                     <%if(myInfo == null) {%> 
                        <ul>
                           <li><a href="<%=request.getContextPath()%>/views/customer/login.html"><i class="lni lni-enter"></i>
                                 	로그인</a></li>
                           <li><a href="<%=request.getContextPath()%>/views/customer/registration.html"><i
                                 class="lni lni-user"></i>회원가입</a></li>
                        </ul>
                       <%} else { %>
                        <ul>
                           <li><a href="logout.do"><i class="lni lni-enter"></i>
                                 로그아웃</a></li>
                        </ul>
                        <%} %>
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
    <!-- End Header Area -->

    <!-- Start Hero Area -->
    <section class="hero-area overlay">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                    <div class="hero-text text-center">
                        <!-- Start Hero Text -->
                        <div class="section-heading">
                            <h2 class="wow fadeInUp" data-wow-delay=".3s">'맛있을 지도'에 오신 것을 환영합니다.</h2>
                            <p class="wow fadeInUp" data-wow-delay=".5s">도시마다 특별한 맛집들을 지도 위에 표시하여 여러분에게 소개합니다. 
                            <br>맛있는 여정을 함께 떠나보세요, 지도 위에 여러 도시의 특별한 맛집들이 여러분을 기다리고 있습니다.</p>
                        </div>
                        <!-- End Search Form -->
                        <!-- Start Search Form -->
                        <div class="search-form wow fadeInUp" data-wow-delay=".7s">
                            <form action="/TasteMap/search.do">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-12 p-0">
                                    <div class="search-input">
                                        <label for="keyword"><i class="lni lni-search-alt theme-color"></i></label>
                                        <input type="text" name="rstrntName" id="rstrntName" placeholder="가게명">
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-12 p-0">
                                    <div class="search-input">
                                        <label for="category"><i class="lni lni-grid-alt theme-color"></i></label>
                                        <input type="text" name="menuName" id="menuName" placeholder="메뉴">
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
                        <!-- End Search Form -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Hero Area -->

    <!-- Start Categories Area -->
<!--     <section class="categories"> -->
<!--         <div class="container"> -->
<!--             <div class="cat-inner"> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-12 p-0"> -->
<!--                         <div class="category-slider"> -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/car.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Vehicle</h3> -->
<!--                                 <h5 class="total">35</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/laptop.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Electronics</h3> -->
<!--                                 <h5 class="total">22</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/matrimony.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Matrimony</h3> -->
<!--                                 <h5 class="total">55</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/furniture.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Furnitures</h3> -->
<!--                                 <h5 class="total">21</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/jobs.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Jobs</h3> -->
<!--                                 <h5 class="total">44</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/real-estate.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Real Estate</h3> -->
<!--                                 <h5 class="total">65</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/laptop.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Education</h3> -->
<!--                                 <h5 class="total">35</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/hospital.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Health & Beauty</h3> -->
<!--                                 <h5 class="total">22</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/tshirt.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Fashion</h3> -->
<!--                                 <h5 class="total">25</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/education.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Education</h3> -->
<!--                                 <h5 class="total">42</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/controller.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Gadgets</h3> -->
<!--                                 <h5 class="total">32</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/travel.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Backpacks</h3> -->
<!--                                 <h5 class="total">15</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                             Start Single Category -->
<!--                             <a href="category.html" class="single-cat"> -->
<!--                                 <div class="icon"> -->
<!--                                     <img src="assets/images/categories/watch.svg" alt="#"> -->
<!--                                 </div> -->
<!--                                 <h3>Watches</h3> -->
<!--                                 <h5 class="total">65</h5> -->
<!--                             </a> -->
<!--                             End Single Category -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- /End Categories Area -->

    <!-- Start Items Grid Area -->
    <section class="items-grid section custom-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">추천 맛집</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">다양한 맛집 정보로 가득한 특별한 공간에서 함께 즐겨보세요.</p>
                    </div>
                </div>
            </div>
            <div class="single-head">
                <div class="row">
                
                <!-- 포문 -->
                		<%
                        	int rr = 0;
                        	for(CategoryVO cv : ctgryList) {
                        	int cnt = 0;
                        	if(rr == 1) break;
                        	
                        	List<RestaurantVO> rstList = rstService.getRestaurantList(cv.getCtgryCode()); 
                        	for(RestaurantVO rv : rstList){
                        		if(cnt == 12)break;
                        %>
                
                <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".2s">
                        
                            <div class="image">
                               <% String src = "";
                               if(!mypageService.getRstImg(rv.getRstrntCode()).equals("noImg")) {
                               src = mypageService.getRstImg(rv.getRstrntCode()); }
                               %>
                                <a style="width: 100%;" 
                                href="<%=request.getContextPath()%>/restaurantDetail.do?rstrntCode=<%=rv.getRstrntCode()%>" class="thumbnail">
                                <img src="<%=request.getContextPath()%>\<%=src%>" alt="#">
                                </a>
                                
                                <div class="author">
                                
<!--                                     <div class="author-image"> -->
<!--                                         <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"> -->
<!--                                             <span>Smith jeko</span></a> -->
<!--                                     </div> -->
<!--                                     <p class="sale">For Sale</p> -->
								<div class="home_mark">
								<p class="home_check_mark">
									<%
										String sc = rv.getRstrntScore().substring(0, 2);
									if (Integer.parseInt(sc) > 80) {
									%>
									<i class="fa fa-check-circle" aria-hidden="true"></i>
									<%
										}
									%>
								</p>
								<p class="home_like_mark">
									<%
										if (rv.getRstrntLike() > 100) {
									%>
									<i class="fa fa-gratipay" aria-hidden="true"></i>
									<%
										}
									%>
								</p>
							</div>
                                </div>
                            </div>
                            <div class="content">
                                <div class="top-content">
                                <%if(rv.getRstrntTag() == null || rv.getRstrntTag() == "" || rv.getRstrntTag() == "null") {%>
                                    <a href="javascript:void(0)" class="tag"> </a>
                                <%} else  {%>
                                    <a href="javascript:void(0)" class="tag"><%=rv.getRstrntTag() %></a>
                                <%} %>
                                    <h3 class="title">
                                    
                                       <a href="<%=request.getContextPath()%>/restaurantDetail.do?rstrntCode=<%=rv.getRstrntCode()%>"><%= rv.getRstrntName() %></a>
                                    
                                    </h3>
                                    
                                    
                                    
                                    
                                    <ul class="rating">
                                    <%
                                    // 리뷰점수	
                                    int reviewScore = Integer.parseInt(rv.getRstrntScore().replace("점", ""));
                                    
                                    // 리뷰 점수에 따른 별
                                    int starScore;
                                    
                                    if(reviewScore > 80  ) {
                                    	starScore = 5;
                                    	
                                    }else if(reviewScore > 60){
                                    	starScore = 4;
                                    }else if (reviewScore > 40) {
                                    	starScore = 3;
                                    }else if (reviewScore > 20) {
                                    	starScore = 2;
                                    }else {
                                    	starScore = 1;
                                    }
                                    
                                    
                                    int starCount = 0;
                                    for(int i=0; i<5; i++){
                                    	if(starCount != starScore) {
                                    		
                                    %>	
                                    	
                                    		<li><i class="lni lni-star-filled"></i></li>
                                    		
                                    <%
                                    
                                    starCount++;
                                    	}else {
                                    
                                    %>
                                    	<li><i class="lni lni-star"></i></li>
                                   	<%
                                    	}
                                    }
                                   
                                   	%>
                                    
                                  
                                    
                                    
                                    
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><a href="javascript:void(0)">(35)</a></li> -->
									
                                    </ul>
                                    
                               
                                    
                                    <ul class="info-list">
                                        <li style="width: 100%;">
                                        <a href="javascript:void(0)">
                                        <i class="lni lni-map-marker">
                                        </i><%=rv.getRstrntAddr()%>
                                        </a>
                                        </li>
                                        <li style="width: 100%;">
                                         <a href="javascript:void(0)">
                                         <i class="fa fa-phone" aria-hidden="true">
                                         </i>
                                         <%=rv.getRstrntTel()%>
                                         </a>
                                         </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </div>
                        <!-- End Single Grid -->
                    </div>
                    
                    <%
                        cnt ++;
                        	}
                        	rr ++;
                        }
                        %>
                <!-- 포문 -->
                
         
                        </div>
                 </div>
            </div>
        </div>
    </section>
                        
                        <!-- End Single Grid -->
                    </div>
<!--                     <div class="col-lg-4 col-md-6 col-12"> -->
<!--                          Start Single Grid  -->
<!--                         <div class="single-grid wow fadeInUp" data-wow-delay=".4s"> -->
<!--                             <div class="image"> -->
<!--                                 <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a> -->
<!--                                 <div class="author"> -->
<!--                                     <div class="author-image"> -->
<!--                                         <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"> -->
<!--                                             <span>Alex Jui</span></a> -->
<!--                                     </div> -->
<!--                                     <p class="sale">For Sale</p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="content"> -->
<!--                                 <div class="top-content"> -->
<!--                                     <a href="javascript:void(0)" class="tag">Real Estate</a> -->
<!--                                     <h3 class="title"> -->
<!--                                         <a href="item-details.html">Amazing Room for Rent</a> -->
<!--                                     </h3> -->
<!--                                     <p class="update-time">Last Updated: 2 hours ago</p> -->
<!--                                     <ul class="rating"> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><a href="javascript:void(0)">(20)</a></li> -->
<!--                                     </ul> -->
<!--                                     <ul class="info-list"> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> Dallas, Washington</a></li> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> Jan 7, 2023</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="bottom-content"> -->
<!--                                     <p class="price">Start From: <span>$450.00</span></p> -->
<!--                                     <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                          End Single Grid  -->
<!--                     </div> -->
<!--                     <div class="col-lg-4 col-md-6 col-12"> -->
<!--                         Start Single Grid -->
<!--                         <div class="single-grid wow fadeInUp" data-wow-delay=".6s"> -->
<!--                             <div class="image"> -->
<!--                                 <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a> -->
<!--                                 <div class="author"> -->
<!--                                     <div class="author-image"> -->
<!--                                         <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"> -->
<!--                                             <span>Devid Milan</span></a> -->
<!--                                     </div> -->
<!--                                     <p class="sale">For Sale</p> -->
<!--                                 </div> -->
<!--                                 <p class="item-position"><i class="lni lni-bolt"></i> Featured</p> -->
<!--                             </div> -->
<!--                             <div class="content"> -->
<!--                                 <div class="top-content"> -->
<!--                                     <a href="javascript:void(0)" class="tag">Mobile Phones</a> -->
<!--                                     <h3 class="title"> -->
<!--                                         <a href="item-details.html">Canon SX Powershot D-SLR</a> -->
<!--                                     </h3> -->
<!--                                     <p class="update-time">Last Updated: 3 hours ago</p> -->
<!--                                     <ul class="rating"> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><a href="javascript:void(0)">(55)</a></li> -->
<!--                                     </ul> -->
<!--                                     <ul class="info-list"> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> New York, US</a></li> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> Mar 18, 2023</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="bottom-content"> -->
<!--                                     <p class="price">Start From: <span>$700.00</span></p> -->
<!--                                     <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                          End Single Grid  -->
<!--                     </div> -->
<!--                     <div class="col-lg-4 col-md-6 col-12"> -->
<!--                          Start Single Grid -->
<!--                         <div class="single-grid wow fadeInUp" data-wow-delay=".2s"> -->
<!--                             <div class="image"> -->
<!--                                 <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a> -->
<!--                                 <div class="author"> -->
<!--                                     <div class="author-image"> -->
<!--                                         <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"> -->
<!--                                             <span>Jesia Jully</span></a> -->
<!--                                     </div> -->
<!--                                     <p class="sale">For Sale</p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="content"> -->
<!--                                 <div class="top-content"> -->
<!--                                     <a href="javascript:void(0)" class="tag">Vehicles</a> -->
<!--                                     <h3 class="title"> -->
<!--                                         <a href="item-details.html">BMW 5 Series GT Car</a> -->
<!--                                     </h3> -->
<!--                                     <p class="update-time">Last Updated: 4 hours ago</p> -->
<!--                                     <ul class="rating"> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><a href="javascript:void(0)">(35)</a></li> -->
<!--                                     </ul> -->
<!--                                     <ul class="info-list"> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> New York, US</a></li> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> Apr 12, 2023</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="bottom-content"> -->
<!--                                     <p class="price">Start From: <span>$1000.00</span></p> -->
<!--                                     <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                          End Single Grid  -->
<!--                     </div> -->
<!--                     <div class="col-lg-4 col-md-6 col-12"> -->
<!--                          Start Single Grid -->
<!--                         <div class="single-grid wow fadeInUp" data-wow-delay=".4s"> -->
<!--                             <div class="image"> -->
<!--                                 <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a> -->
<!--                                 <div class="author"> -->
<!--                                     <div class="author-image"> -->
<!--                                         <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"> -->
<!--                                             <span>Thomas Deco</span></a> -->
<!--                                     </div> -->
<!--                                     <p class="sale">For Sale</p> -->
<!--                                 </div> -->
<!--                                 <p class="item-position"><i class="lni lni-bolt"></i> Featured</p> -->
<!--                             </div> -->
<!--                             <div class="content"> -->
<!--                                 <div class="top-content"> -->
<!--                                     <a href="javascript:void(0)" class="tag">Apple</a> -->
<!--                                     <h3 class="title"> -->
<!--                                         <a href="item-details.html">Apple Macbook Pro 13 Inch</a> -->
<!--                                     </h3> -->
<!--                                     <p class="update-time">Last Updated: 5 hours ago</p> -->
<!--                                     <ul class="rating"> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><a href="javascript:void(0)">(35)</a></li> -->
<!--                                     </ul> -->
<!--                                     <ul class="info-list"> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> Louis, Missouri, US</a></li> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> May 25, 2023</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="bottom-content"> -->
<!--                                     <p class="price">Start From: <span>$550.00</span></p> -->
<!--                                     <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                          End Single Grid  -->
<!--                     </div> -->
<!--                     <div class="col-lg-4 col-md-6 col-12"> -->
<!--                         Start Single Grid  -->
<!--                         <div class="single-grid wow fadeInUp" data-wow-delay=".6s"> -->
<!--                             <div class="image"> -->
<!--                                 <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a> -->
<!--                                 <div class="author"> -->
<!--                                     <div class="author-image"> -->
<!--                                         <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"> -->
<!--                                             <span>Jonson zack</span></a> -->
<!--                                     </div> -->
<!--                                     <p class="sale">For Sale</p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="content"> -->
<!--                                 <div class="top-content"> -->
<!--                                     <a href="javascript:void(0)" class="tag">Restaurant</a> -->
<!--                                     <h3 class="title"> -->
<!--                                         <a href="item-details.html">Cream Restaurant</a> -->
<!--                                     </h3> -->
<!--                                     <p class="update-time">Last Updated: 7 hours ago</p> -->
<!--                                     <ul class="rating"> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><i class="lni lni-star-filled"></i></li> -->
<!--                                         <li><a href="javascript:void(0)">(20)</a></li> -->
<!--                                     </ul> -->
<!--                                     <ul class="info-list"> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> New York, US</a></li> -->
<!--                                         <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> Feb 18, 2023</a></li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="bottom-content"> -->
<!--                                     <p class="price">Start From: <span>$500.00</span></p> -->
<!--                                     <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                          End Single Grid  -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- /End Items Grid Area -->

    <!-- Start Why Choose Area -->
    

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
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/wow.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/tiny-slider.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/glightbox.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/item-details.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ccd00174a49121da7c06055801ba062&libraries=services"></script>
   <script src="<%=request.getContextPath()%>/assets/js/chat-api.js"></script>
    <script type="text/javascript">
        //========= Category Slider 
        tns({
            container: '.category-slider',
            items: 3,
            slideBy: 'page',
            autoplay: false,
            mouseDrag: true,
            gutter: 0,
            nav: false,
            controls: true,
            controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 2,
                },
                768: {
                    items: 4,
                },
                992: {
                    items: 5,
                },
                1170: {
                    items: 6,
                }
            }
        });
        
        //========= testimonial 
        tns({
            container: '.testimonial-slider',
            items: 3,
            slideBy: 'page',
            autoplay: false,
            mouseDrag: true,
            gutter: 0,
            nav: true,
            controls: false,
            controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                992: {
                    items: 2,
                },
                1170: {
                    items: 2,
                }
            }
        });
    </script>
</body>

</html>