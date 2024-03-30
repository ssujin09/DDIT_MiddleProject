<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>ClassiGrids - Classified Ads and Listing Website Template.</title>
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
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
<!-- 부트스트랩 CSS 파일 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZwT" crossorigin="anonymous">

</head>

<body>
    <section class="items-carousel section custom-padding">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2 class="wow fadeInUp" data-wow-delay=".4s">Latest Products</h2>
                    <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
                </div>
            </div>
        </div>

        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <%                               
                   int rr = 0;
                   for(CategoryVO cv : ctgryList) {
                   int cnt = 0;
                   if(rr == 10) break;
                %>
                <div class="carousel-item <%= cnt == 0 ? "active" : "" %>">
                    <div class="row">
                        <%
                           List<RestaurantVO> rstList = rstService.getRestaurantList(cv.getCtgryCode()); 
                           for(RestaurantVO rv : rstList){
                        %>
                        <div class="col-lg-3 col-md-6 col-12">
                            <!-- Start Single Grid -->
                            <div class="single-grid wow fadeInUp" data-wow-delay=".2s">
                                <p><span style="display: flex; justify-content: left; align-items: center; text-align:left; height: 30px; padding-left: 15px; "><%=cv.getCtgryName() %></span></p> 
                                <div class="image">
                                    <a href="<%=request.getContextPath()%>/restaurantDetail.do?rstrntCode=<%=rv.getRstrntCode()%>" class="thumbnail">
                                        <img src="https://via.placeholder.com/600x400" alt="#">
                                    </a>
                                </div>
                                <div class="content">
                                    <div class="top-content">
                                        <h3 class="title">
                                            <a href="<%=request.getContextPath()%>/restaurantDetail.do?rstrntCode=<%=rv.getRstrntCode()%>"><%=rv.getRstrntName() %></a>
                                        </h3>
                                        <ul class="rating" style="display: flex;">
                                            <li><i class="lni lni-star-filled"></i></li>
                                            <li><i class="lni lni-star-filled"></i></li>
                                            <li><i class="lni lni-star-filled"></i></li>
                                            <li><i class="lni lni-star-filled"></i></li>
                                            <li><i class="lni lni-star-filled"></i></li>
                                            <li><a href="javascript:void(0)">(35)</a></li>
                                        </ul>
                                        <ul class="info-list">
                                            <li style="width: 100%;"><a href="javascript:void(0)"><i class="lni lni-map-marker"></i><%=rv.getRstrntAddr() %></a></li>
                                            <li style="width: 100%;"> <a href="javascript:void(0)"><i class="lni lni-timer"></i><%=rv.getRstrntTel() %></a></li>
                                        </ul>
                                    </div>
                                    <div class="bottom-content">
                                        <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            cnt ++;
                            }
                            rr ++;
                        }
                        %>
                    </div>
                </div>
                <% } %>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</section>
    
    
    <!-- Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- 부트스트랩 JS 파일 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-J6B6aWeeoNOJp4qdgtpQ93GznS9exBEow8m4UKfN25OpQNlq69fi5TBEJWJ4zF" crossorigin="anonymous"></script>
    	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/wow.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/tiny-slider.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/glightbox.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
</body>

</html>