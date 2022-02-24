<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->


<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">


	
		<form onsubmit="return joinSubmit();"
			action="${ cp }/community/communityInsert?${_csrf.parameterName }=${_csrf.token }"
			method="post" enctype="multipart/form-data">
			<div class="container-fluid">

			
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">커뮤니티 게시요청</h1>

				</div>



				<div class="row">
					<div class="col-8 offset-2">
						<div class="card shadow mb-5 bg-white">
							<div class="card-header py-3 bg-light"
								style="margin-left: 0; margin-right: 0">
								<h5 class="m-0 font-weight-bold text-danger">커뮤니티 게시 유의사항</h5>
							</div>

							<div class="card-body">
								<ul>
									<li>채용 공고 게시는 무료로 진행되며, 3조대학교 캠퍼스픽 담당자의 검토 및 승인 절차를 거쳐
										48시간 이내 게시됩니다 <br>
									</li>
									<li>게시글 중복 방지를 위해 계정당 한 공고만 등록할 수 있습니다</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				

				<div class="row">
					<div class="col-8 offset-2">
						<div class="card shadow mb-5">
							<div class="card-header py-3">
								<h5 class="m-0 font-weight-bold text-dark">커뮤니티 정보 등록</h5>
							</div>

							<div class="card-body">

						
								<div class="card mb-3">
									<div class="col-md-12">
										<div class="card-body">
											<h6 class="card-title font-weight-bold text-dark">커뮤니티 명</h6>
											<p class="card-text">

												<input type="text" name="cu_name" placeholder="커뮤니티 이름"
													maxlength="30" autocomplete="off" class="text">
											<div></div>
											</p>
										</div>

									</div>
								</div>


								<div class="card mb-3">
									<div class="col-md-12">

										<div class="card-body">
											<h6 class="card-title font-weight-bold text-dark">커뮤니티
												소개글 작성</h6>
											<p class="card-text">
												<input type="text" name="cu_intro" placeholder="커뮤니티 소개글 작성"
													maxlength="30" autocomplete="off" class="text">
										</div>

									</div>
								</div>


								<div class="card mb-3">
									<div class="col-md-12">

										<div class="card-body">
											<h6 class="card-title font-weight-bold text-dark">커뮤니티
												분류</h6>
											<p class="card-text">
												<input type="radio" name="cu_category" value="게임">게임
												<input type="radio" name="cu_category" value="대학생활">대학생활
												<input type="radio" name="cu_category" value="유머">유머
												<input type="radio" name="cu_category" value="취미">취미
												<input type="radio" name="cu_category" value="스포츠">스포츠
												<input type="radio" name="cu_category" value="기타">기타
											</p>
										</div>

									</div>
								</div>
							
								<div class="card mb-3">
									<div class="col-md-12">

										<div class="card-body">
											<h6 class="card-title font-weight-bold text-dark">커뮤니티
												대표이미지</h6>
											<p class="card-text">
												<input type="file" name="file1"> <br>
											</p>
										</div>

									</div>
								</div>
								
							</div>
							
						</div>
					</div>
				</div>
			





				
				<div class="row">
					<div class="col-8 offset-2">
						<div class="card shadow mb-5">
							<div class="card-header py-3">
								<h5 class="m-0 font-weight-bold text-info">담당자 정보</h5>
							</div>

							<div class="card-body">

							
								<div class="card mb-3">
									<div class="col-md-12">

										<div class="card-body">
											<h6 class="card-title font-weight-bold text-dark"
												style="display: inline;">아이디</h6>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="m_id"
												value="${vo.m_id}" maxlength="40" autocomplete="off"
												readonly="readonly"> <br>
											<h6 class="card-title font-weight-bold text-dark"
												style="display: inline;"></h6>
											&nbsp; <input type="hidden" name="m_num" value="${vo.m_num}"
												maxlength="40" autocomplete="off" readonly="readonly">

										</div>

									</div>
								</div>
								
								<div class="card mb-3">
									<div class="col-md-12">

										<div class="card-body">
											<h6 class="card-title font-weight-bold text-dark">권한</h6>
											<p class="card-text">
											<ul>

												<li>커뮤니티 정보 수정 
											</ul>
											</p>
										</div>

									</div>
								</div>
								

							</div>
						
						</div>
					</div>
				</div>
			


			</div>
		

			<div class="container show-grid" style="margin: auto; text-align: center; margin-bottom: 100px;">
				<input type="submit" class="btn btn-dark" value="커뮤니티 게시요청">
			</div>

			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">

		</form>

	</div>
	


</div>


<%@ include file="/WEB-INF/views/footer.jsp"%>

<script type="text/javascript">
function joinSubmit(){
	
	alert("게시 요청완료!");
	return true;

}
</script>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- 로그아웃 -->
<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>

			<div class="modal-body">로그아웃하시려면 '로그아웃' 버튼을 눌러주세요.</div>

			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소
				</button>
				<a class="btn btn-primary" href="login.html">로그아웃</a>
			</div>
		</div>
	</div>
</div>


<style>
.test_obj input[type="radio"] {
	display: none;
}

.test_obj input[type="radio"]+span {
	display: inline-block;
	padding: 15px 10px;
	border: 1px solid #dfdfdf;
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #113a6b;
	color: #ffffff;
}
</style>
