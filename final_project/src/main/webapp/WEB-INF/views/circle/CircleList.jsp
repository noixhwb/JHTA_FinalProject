<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!-- 전체 동아리 목록 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">


<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 전체 동아리 목록 </h1>
				<!-- 동아리 검색 -->	
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-white border-secondary small"
							   placeholder="동아리 검색" aria-label="Search"
						       aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form> <!-- 동아리 검색 끝 -->
			</div>

<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
			<c:forEach var="vo" items="${ list }">
			<!-- 첫번째 Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<!-- n번 동아리 -->
				
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드제목 왼쪽 -->
								<img src="${ cp }/resources/images/circle/${ vo.ci_logofile }" 
									 style="max-width: 50px;">
								<h6 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ vo.ci_name }</h6>
							</div>
							<div class="col-md-4"> <!-- 카드제목 오른쪽 -->
								${ vo.ci_category }, ${ vo.ci_person } (더꾸미기..)
							</div>
						</div>
					</div>
					
					<div class="card-body"> <!-- n번 동아리 body -->
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드본문 왼쪽 (정보) -->
								<div class="card-body">
									<h6 class="card-title"> 
										<a href="${ cp }/circle/CircleDetail?ci_num=${ vo.ci_num }">									
										${ vo.ci_title }</a> 
									</h6>
									<p class="card-text">
										
											<div class="row g-0">
												<div class="col-md-6">
													<ul id="dot">
														<!-- <li>모집기간 : ${ vo.ci_startdate } ~ ${ vo.ci_enddate }</li> -->
														<li>디데이</li> <!-- 1번 -->
														<li>모집중</li> <!-- 2번 -->
													</ul>
												</div>
												<div class="col-md-6">
													<ul id="dot">
														<li>조회수 : ${ vo.ci_view }</li> <!-- 3번 -->
														<li>좋아요수 : ${ vo.ci_recommend }</li> <!-- 4번 -->
													</ul>
												</div>
											</div>
											
									</p>
									<p class="card-text">
											<small class="text-muted">....</small>
										</p>
								</div>
							</div>
							<div class="col-md-4"> <!-- 카드본문 오른쪽 (포스터) -->
								<img src="${ cp }/resources/images/circle/${ vo.ci_imgfile }" 
									 class="img-fluid rounded-start" alt="..." style="max-width: 150px;">
							</div>
						</div>
					</div> <!-- n번 동아리 body 끝 -->
					
				</div> <!-- n번 동아리 끝 -->
				

			</div> <!-- 첫번쨰 Content Column 끝 -->
			</c:forEach>


		</div> <!-- Content Row 끝 -->

		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝 -->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
		
<!-- 스크롤 -->		
<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
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
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<a class="btn btn-primary" href="login.html">로그아웃</a>
				</div>
			</div>
		</div>
	</div>
	
<style>
#dot{
   list-style:none;
   padding-left:5px;
   }
</style>       
