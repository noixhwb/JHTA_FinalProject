<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 폼 양식 -->
<%@ include file="/WEB-INF/views/header.jsp" %>

<%--
<!-- Custom fonts for this template-->
<link href="${ pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${ pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">
    
<!-- Bootstrap core JavaScript-->
<script src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${ pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${ pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${ pageContext.request.contextPath }/resources/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="${ pageContext.request.contextPath }/resources/js/demo/chart-area-demo.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/demo/chart-pie-demo.js"></script>
 --%>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->


<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

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
						 src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg">
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
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 폼 양식 </h1>
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
			</div>

<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary"> 카드1 </h6>
					</div>
					
					<div class="card-body">
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg" 
										 class="img-fluid rounded-start" alt="..." style="max-width: 50px;">
								</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">제목1</h5>
										<p class="card-text">텍스트1</p>
										<p class="card-text">
											<small class="text-muted">Last updated 3 mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg" 
										 class="img-fluid rounded-start" alt="..." style="max-width: 50px;">
								</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">제목2</h5>
										<p class="card-text">텍스트2</p>
										<p class="card-text">
											<small class="text-muted">Last updated 3 mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary"> 카드2 </h6>
					</div>
					
					<div class="card-body">
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg" 
										 class="img-fluid rounded-start" alt="..." style="max-width: 50px;">
								</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">제목1</h5>
										<p class="card-text">텍스트1</p>
										<p class="card-text">
											<small class="text-muted">Last updated 3 mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				
<!-- Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary"> 카드3 </h6>
					</div>
					
					<div class="card-body">
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg" 
										 class="img-fluid rounded-start" alt="..." style="max-width: 50px;">
								</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">제목1</h5>
										<p class="card-text">텍스트1</p>
										<p class="card-text">
											<small class="text-muted">Last updated 3 mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg" 
										 class="img-fluid rounded-start" alt="..." style="max-width: 50px;">
								</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">제목2</h5>
										<p class="card-text">텍스트2</p>
										<p class="card-text">
											<small class="text-muted">Last updated 3 mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary"> 카드4 </h6>
					</div>
					
					<div class="card-body">
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg" 
										 class="img-fluid rounded-start" alt="..." style="max-width: 50px;">
								</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">제목1</h5>
										<p class="card-text">텍스트1</p>
										<p class="card-text">
											<small class="text-muted">Last updated 3 mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
<!-- /.container-fluid -->
			
		</div>
<!-- End of Main Content -->

<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->

	</div>
<!-- End of Content Wrapper -->

	</div>
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
	
        
