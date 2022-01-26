<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 동아리+게시글 등록 확인 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->

<!-- ---------------------------------------------------------------------------------------------------------------------- -->


<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<!-- Topbar -->
		<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		<h4>3조대학교 캠퍼스픽</h4>


<!-- Sidebar Toggle (Topbar) -->
		<button id="sidebarToggleTop"
				class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>

<!-- Topbar Search -->
	<!-- 
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group">
				<input type="text" class="form-control bg-light border-0 small"
					   placeholder="Search for..." aria-label="Search"
				       aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>
	 -->
	 
<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">

		<div class="topbar-divider d-none d-sm-block"></div>

<!-- Nav Item - User Information -->
			<li class="nav-item dropdown no-arrow">
				<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
				   role="button" data-toggle="dropdown" aria-haspopup="true"
				   aria-expanded="false">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small">홍길동님</span>
					<img class="img-profile rounded-circle"
						 src="${ cp }/resources/img/undraw_profile.svg">
				</a>

<!-- Dropdown - User Information -->
				<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					 aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">
						<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
					</a>
					<a class="dropdown-item" href="#">
						<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 수정
					</a>
					<a class="dropdown-item" href="#"> 
						<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 활동기록
					</a>
					
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
					   data-target="#logoutModal">
						<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
					</a>
				</div>
			</li>

		</ul>

		</nav>
<!-- End of Topbar -->

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<form action="${ cp }/home" style="margin: auto; text-align: center;" enctype="multipart/form-data">
		<div class="container-fluid">

<!-- Page Heading -->
			<!-- 
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 동아리 게시요청 </h1>
					
			</div>
			

			<!-- 게시요청 완료 카드 -->
			<!-- 
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-danger"> 동아리 게시 유의사항 </h5>
				</div>
				
				<div class="card-body">
					<ul>
						<li> 동아리 정보 및 모집 공고 게시는 무료로 진행되며, 
							 3조픽 담당자의 검토 및 승인 절차를 거쳐 48시간 이내 게시됩니다 </li>
						<li> 계정당 한 동아리만 등록 가능합니다 </li>
						<li> 게시글 중복 방지를 위해 동아리당 한 게시글만 등록할 수 있습니다 </li>
					</ul>	
				</div>
			</div>  --><!-- 게시요청 완료 카드 끝 -->
			 
		<c:choose>
			<c:when test="${ requestScope.result == 'success' }">
				<div class="row">
					<div class="col-6 offset-3">
				<div class="card border-success bg-light mb-3" style="margin-top: 10%;">
					<div class="card-header" style="text-align: left;">
						<small class="text-muted"> 게시요청확인 </small> <br> 
					</div>
					<div class="card-body text-danger">
						<img src="${cp}/resources/images/circle/checked.png" class="card-img-top" style="width: 300px; height: 300px; margin-top: 50px; margin-bottom: 50px;">
						<h1 class="card-title"><strong>게시요청이 완료되었습니다</strong></h1>
					</div>
					<div class="card-footer">
	      				<strong>@@동아리명@@</strong> <br>
						<!--
						<c:forEach var="list" items="${myorderlist}">
								주문상세번호 : ${ list.odNum } <br>
								@@상세내용@@
						</c:forEach>
						-->
	    			</div>
				</div>
					</div>
				</div>
			</c:when>
	
			<c:otherwise>
				<div class="row">
					<div class="col-6 offset-3">
				<div class="card shadow text-white bg-danger mb-4">
					<div class="card-header py-3">
						<small class="text-muted" style="text-align:left;"> 게시불가확인 </small> <br> 
					</div>
					<div class="card-body">
						<img src="${cp}/resources/images/circle/sad-face.png" class="card-img-top" style="width: 300px; height: 300px; margin-top: 50px; margin-bottom: 50px;">
						<h1 class="card-title"><strong>게시요청을 완료하지 못했습니다</strong></h1>
					</div>
					<div class="card-footer">
						오류를 확인해주세요!
					</div>
				</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
			
		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->		
		
		<div class="container show-grid" style="margin:auto; text-align:center; margin-bottom:100px;">
			<input type="submit" class="btn btn-dark" value="alert으로 할지.. 고민중..">
		</div>


		</form>
		
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
	
