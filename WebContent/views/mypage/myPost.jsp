<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.service.IMypageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>맛있을지도 🧑‍🍳</title>
<script src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"/>
</head>


<body>
	<div class="col-lg-9 col-md-12 col-12">
		<div class="main-content">
			<div class="dashboard-block mt-0">
				<h3 class="block-title">내 게시글</h3>
				<nav class="list-nav">
					<ul>
									<li class="active"><a href="<%=request.getContextPath()%>/mypage/freeboard.do?active=myPost">게시글목록<span>
									<%if(communityList != null) {%>
									<%=communityList.size()%>
									<%} else {%>
									0
									<%} %>
									</span>
									</a></li>
									<li ><a href="<%=request.getContextPath()%>/mypage/freeboard.do?active=myReview">리뷰목록 <span>
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
					<div class="item-list-title">
						<div class="row align-items-center">
							<div class="col-lg-5 col-md-5 col-12">
								<p>제목</p>
							</div>
							<div class="col-lg-2 col-md-2 col-12">
								<p>작성자</p>
							</div>
							<div class="col-lg-2 col-md-2 col-12">
								<p>작성일</p>
							</div>
							<div class="col-lg-3 col-md-3 col-12 align-right">
								<p>작업</p>
							</div>
						</div>
					</div>
					<!-- End List Title -->
					<!-- Start Single List -->
					<!-- 작성중 -->
					<%
								if (communityList != null) {
									for (CmmntyVO cv : communityList) {
								%>
					<div class="single-item-list">
						<div class="row align-items-center">
							<div class="col-lg-5 col-md-5 col-12">
								<div class="item-image">
									<!-- <img src="https://via.placeholder.com/100x100" alt="#"> -->
									<div class="content">
										<h3 class="title">
											<a
												href="<%=request.getContextPath()%>/cmmnty/detail.do?cmmntyCode=<%=cv.getCmmntyCode()%>">"<%=cv.getCmmntyTitle()%>"
											</a>
										</h3>
										<!-- <span class="price">$800</span> -->
									</div>
								</div>
							</div>

							<div class="col-lg-2 col-md-2 col-12">
								<p>
								<%=mypageService.getNick(cv.getCstmrId())%>
								</p>
							</div>
							<div class="col-lg-2 col-md-2 col-12">
								<p><%=cv.getCmmntyDate()%></p>
							</div>
							<div class="col-lg-3 col-md-3 col-12 align-right">
								<ul class="action-btn">
									<!-- 편집 -->
									<li><a
										href="<%=request.getContextPath()%>/mypage/postmodify.do?cmmntyCode=<%=cv.getCmmntyCode()%>"><i
											class="lni lni-pencil"></i></a></li>
									<!-- 상세보기 -->
									<li><a
										href="<%=request.getContextPath()%>/cmmnty/detail.do?cmmntyCode=<%=cv.getCmmntyCode()%>"><i
											class="lni lni-eye"></i></a></li>
									<!-- 삭제 -->
<!-- 									<li><a -->
<%-- 										href="<%=request.getContextPath()%>/mypage/postdelete.do?cmmntyCode=<%=cv.getCmmntyCode()%>"><i --%>
<!-- 											class="lni lni-trash"></i></a></li> -->
											<li>
									    <a href="#" class="delete-post" data-cmmnty-code="<%=cv.getCmmntyCode()%>">
									        <i class="lni lni-trash"></i>
									    </a>

									</li>
								</ul>
							</div>

						</div>
					</div>
					<%
								}
								}
								%>
				</div>
				
<script type="text/javascript">
    $(document).ready(function() {
        $('.delete-post').click(function(e) {
            e.preventDefault();

            var cmmntyCode = $(this).data('cmmnty-code');

            Swal.fire({
                title: '게시물을 삭제하시겠습니까?',
                text: '삭제한 게시물은 복구할 수 없습니다.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '삭제',
                cancelButtonText: '취소',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 확인을 누른 경우
                    window.location.href = '<%=request.getContextPath()%>/mypage/postdelete.do?cmmntyCode=' + cmmntyCode;
                } else {
                    // 사용자가 취소 또는 거절을 누른 경우
                    Swal.fire('취소되었습니다.', '', 'info');
                }
            });
        });
    });
</script>
				<!-- End Items Area -->
			</div>
		</div>
	</div>

</body>
</html>