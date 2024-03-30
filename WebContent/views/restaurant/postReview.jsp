<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>맛있을지도 🧑‍🍳</title>
</head>
<body>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade" id="nav-item-details" role="tabpanel"
			aria-labelledby="nav-item-details-tab">
			<!-- 포스트 광고 스텝 두 콘텐츠 시작 -->
			<div class="step-two-content">
				<form class="default-form-style" method="post" action="#"
					enctype="multipart/form-data">
					<div class="row">
<%-- 								<input type="hidden" name="rstrntCode" value="<%= cv.getRstrntCode()%>"> --%>
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
								<input type="file" id="upload" name="upload"> <label
									for="upload" class="text-center content"> <span
									class="text"> <span class="d-block mb-15">사진을
											넣어주세요.</span> <span class=" mb-15 plus-icon"><i
											class="lni lni-plus"></i></span> <span
										class="main-btn d-block btn-hover">이미지 파일 선택</span> <span
										class="d-block">파일 최대 크기 10MB</span>
								</span>
								</label>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group mt-30">
								<label>리뷰 내용</label>
								<textarea name="message" placeholder="리뷰 내용 작성"
									name="reviewContent"></textarea>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group button mb-0">
								<button type="submit" class="btn alt-btn">Previous</button>
								<button type="submit" class="btn ">Next Step</button>
							</div>
							<!-- 다른 폼 요소들을 여기에 추가하세요 -->
						</div>
					</div>
				</form>
			</div>
			<!-- 포스트 광고 스텝 두 콘텐츠 시작 -->
		</div>
		</div>
		
</body>
</html>