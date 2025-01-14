<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="mypage.dao.MypageDaoImpl"%>
<%@page import="mypage.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>맛있을지도 🧑‍🍳</title>
</head>
<body>
	<div class="col-lg-9 col-md-12 col-12">
					<div class="main-content">
						<div class="dashboard-block mt-0">
							<h3 class="block-title">내 리뷰목록</h3>
							<nav class="list-nav">
								<ul>
									<li ><a href="<%=request.getContextPath()%>/mypage/freeboard.do?active=myPost">게시글목록<span>
									<%if(communityList != null) {%>
									<%=communityList.size()%>
									<%} else {%>
									0
									<%} %>
									</span>
									</a></li>
									<li class="active"><a href="<%=request.getContextPath()%>/mypage/freeboard.do?active=myReview">리뷰목록 <span>
									<%if(reviewList != null){ %>
									<%= reviewList.size() %>
									<%}else{%>
									0
									<%} %>
									</span></a></li>
									<li ><a href="<%=request.getContextPath()%>/mypage/freeboard.do?active=myComment">댓글목록 <span>
									<%if(commentList != null){ %>
									<%= commentList.size()%>
									<%} else{%>
									0
									<%} %>
									</span></a></li>
								</ul>
							</nav>
							<!-- Start Items Area -->
							<div class="my-items">
								<!-- Start Item List Title -->
<!-- 								<div class="item-list-title"> -->
<!-- 									<div class="row align-items-center"> -->
<!-- 										<div class="col-lg-5 col-md-5 col-12"> -->
<!-- 											<p>내 리뷰목록</p> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<!-- End List Title -->
								<!-- Start Single List -->
								<!-- 작성중 -->
								    <!-- Start Single Item -->
								    <%for(ReviewVO rv : reviewList){ %>
                                                <div class="single-item-grid">
                                                    <div class="row align-items-center">
                                                        <div class="col-lg-5 col-md-7 col-12">
                                                            <div class="image">
                                                            <%if(mypageService.reviewImgPath(rv.getReviewNo()).equals("noImg")){ %>
                                                            	
                                                           <%}else{ %>
                                                                <a href="item-details.html"><img src="<%=request.getContextPath()%>\<%=mypageService.reviewImgPath(rv.getReviewNo())%>" alt="#"></a>
                                                            <%} %>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-7 col-md-5 col-12">
                                                            <div class="content">
                                                                <a href="javascript:void(0)" class="tag">
                                                                	맛 : <%=rv.getReviewTaste() %>점,
                                                                    서비스 : <%=rv.getReviewService() %>점,
                                                                    가격 : <%=rv.getReviewPrice() %>점
                                                                </a>
                                                                <h3 class="title">
                                                                    <a href="item-details.html"><%=mypageService.getName(rv.getRstrntCode())%></a>
                                                                </h3>
                                                               	<p><%=rv.getReviewContent() %></p>
                                                                <p class="location"><a href="javascript:void(0)"><i
                                                                            class="lni lni-map-marker">
                                                                        </i><%=mypageService.getAddr(rv.getRstrntCode()) %></a></p>
                                                                <ul class="info">
                                                                    <li class="price">
                                                                    <%=rv.getReviewScore() %><%for(int i=0; i<rv.getReviewScore(); i++){
                                                                     %>★<%} %>
                                                                    </li>
                                                                    <li class="like"><a href="<%=request.getContextPath()%>/mypage/reviewdelete.do?reviewNo=<%=rv.getReviewNo()%>"><i
                                                                                class="lni lni-trash"></i></a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Single Item -->
                                                <%} %>
							<!-- End Items Area -->
						</div>
					</div>
				</div>
</body>
</html>