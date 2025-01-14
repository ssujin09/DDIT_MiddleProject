<%@page import="community.vo.CommentVO"%>
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


<!-- jQuery -->
<script src="<%=request.getContextPath()%>/assets/js/jquery-3.7.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"/>
</head>
<body>
	<div class="col-lg-9 col-md-12 col-12">
		<div class="main-content">
			<div class="dashboard-block mt-0">
				<h3 class="block-title">내 댓글목록</h3>
				<nav class="list-nav">
					<ul>
						<li><a
							href="<%=request.getContextPath()%>/mypage/freeboard.do?active=myPost">게시글목록<span>
									<%
										if (communityList != null) {
									%> <%=communityList.size()%> <%
 	} else {
 %> 0 <%
 	}
 %>
							</span>
						</a></li>
						<li><a
							href="<%=request.getContextPath()%>/mypage/freeboard.do?active=myReview">리뷰목록
								<span> <%
 	if (reviewList != null) {
 %> <%=reviewList.size()%> <%
 	} else {
 %> 0 <%
 	}
 %>
							</span>
						</a></li>
						<li class="active"><a
							href="<%=request.getContextPath()%>/mypage/freeboard.do?active=myComment">댓글목록
								<span> <%
 	if (commentList != null) {
 %> <%=commentList.size()%> <%
 	} else {
 %> 0 <%
 	}
 %>
							</span>
						</a></li>
					</ul>
				</nav>
				<!-- Start Items Area -->
				<!-- 작성중 -->
				<!-- Start Invoice Items Area -->
				<div class="my-items">
					<!-- Start List Title -->
					<div class="item-list-title">
						<div class="row align-items-center">
							<div class="col-lg-5 col-md-5 col-12">
								<p>게시글 제목</p>
							</div>
							<!-- 										<div class="col-lg-2 col-md-2 col-12"> -->
							<!-- 											<p>작성 일자</p> -->
							<!-- 										</div> -->
							<div class="col-lg-2 col-md-2 col-12">
								<p>댓글 내용</p>
							</div>
							<div class="col-lg-2 col-md-2 col-12">
								<p>좋아요</p>
							</div>
							<div class="col-lg-3 col-md-3 col-12 align-right">
								<p>작업</p>
							</div>
						</div>
					</div>
					<!-- End List Title -->
					<!-- Start Single List -->
					<%
						for (CommentVO cv : commentList) {
					%>
					<div class="single-item-list">
						<div class="row align-items-center">
							<div class="col-lg-5 col-md-5 col-12">
								<p>
									<%=mypageService.getTitle(cv.getCmmntyCode())%>
								</p>
							</div>
							<div class="col-lg-2 col-md-2 col-9">
								<p>
									<%=cv.getCcommentContent()%>
								</p>
							</div>
							<div class="col-lg-2 col-md-2 col-12">
								<p class="paid"><%=cv.getCcommentLike()%></p>
							</div>
							<div class="col-lg-2 col-md-2 col-12 align-right">
								<ul class="action-btn">
									<li><a
										href="<%=request.getContextPath()%>/cmmnty/detail.do?cmmntyCode=<%=cv.getCmmntyCode()%>"><i
											class="lni lni-eye"></i></a></li>
									<li><a href="#" class="delete-post" data-comment-code="<%=cv.getCcommentCode()%>">
									<i class="lni lni-trash"></i>
									</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
<!--<%=request.getContextPath()%>/mypage/commentdelete.do?ccommentCode= <%=cv.getCcommentCode()%> -->
					<%
						}
					%>
					<!-- End Single List -->
				</div>
			</div>

			<!-- End Items Area -->
		</div>
	</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('.delete-post').click(function(e) {
            e.preventDefault();

            var ccommentCode = $(this).data('comment-code');

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
                    window.location.href = '<%=request.getContextPath()%>/mypage/commentdelete.do?ccommentCode='+ccommentCode ;
                } else {
                    // 사용자가 취소 또는 거절을 누른 경우
                    Swal.fire('취소되었습니다.', '', 'info');
                }
            });
        });
    });
</script>



</body>
</html>
