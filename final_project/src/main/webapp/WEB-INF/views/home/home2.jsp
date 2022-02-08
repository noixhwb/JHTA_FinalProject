<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Final3조</title>

<!-- Custom fonts for this template-->
<link
	href="${ cp }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${ cp }/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="${cp}/example">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					Final <sup>3조</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="${ cp }/home/home2"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>홈</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">
				<!-- 소제목 -->
			</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>커뮤니티</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item" href="buttons.html">Buttons</a> <a
							class="collapse-item" href="cards.html">Cards</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>동아리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="utilities-color.html">Colors</a> <a
							class="collapse-item" href="utilities-border.html">Borders</a> <a
							class="collapse-item" href="utilities-animation.html">Animations</a>
						<a class="collapse-item" href="utilities-other.html">Other</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities2"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>거래장터</span>
			</a>
				<div id="collapseUtilities2" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="${ pageContext.request.contextPath }/deal/deallist">장터</a>
						<a class="collapse-item"
							href="${ pageContext.request.contextPath }/deal/dealinsert">상품등록</a>
						<a class="collapse-item"
							href="${ pageContext.request.contextPath }/deal/management">장터관리</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">
				<!-- 소제목 -->
			</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>취업정보</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages2"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>시간표</span>
			</a>
				<div id="collapsePages2" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages3"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>관리자게시판</span>
			</a>
				<div id="collapsePages3" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages4"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>게시요청</span>
			</a>
				<div id="collapsePages4" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<!-- <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>임시</span></a>
            </li> -->

			<!-- Nav Item - Tables -->
			<!-- <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/deal/dealinsert">
                    <i class="fas fa-fw fa-table"></i>
                    <span>임시</span></a>
            </li> -->

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

			<!-- Sidebar Message -->
			<div class="sidebar-card d-none d-lg-flex">
				<img class="sidebar-card-illustration mb-2"
					src="img/undraw_rocket.svg" alt="...">
				<p class="text-center mb-2">
					<strong>SB Admin Pro</strong> is packed with premium features,
					components, and more!
				</p>
				<a class="btn btn-success btn-sm"
					href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to
					Pro!</a>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<h4>3조대학교 캠퍼스픽</h4>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						
						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">홍길동님</span> <img class="img-profile rounded-circle"
								src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									수정
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									활동기록
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<!-- <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">3조대학교 화이팅</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> 마이페이지</a>
                    </div> -->

					<!-- Content Row -->
					<div class="row">


						<!-- Content Column -->
						<div class="col-lg-6 mb-4">

							<!-- Approach -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">커뮤니티</h6>
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
													<h5 class="card-title">영화모임1</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
									<h6 class="m-0 font-weight-bold text-primary">거래장터</h6>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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

						<div class="col-lg-6 mb-4">

							<!-- Approach -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">동아리</h6>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
									<h6 class="m-0 font-weight-bold text-primary">취업정보</h6>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
													<h5 class="card-title">영화모임</h5>
													<p class="card-text">영화 좋아하시는분</p>
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
				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; 2022 중앙HTA 파이널프로젝트 3조 백송은 백승한 안성진 하지은 한상훈</span>
						</div>
					</div>
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

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
							data-dismiss="modal">취소</button>
						<a class="btn btn-primary" href="login.html">로그아웃</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript-->
		<script
			src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
		<script
			src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script
			src="${ pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script
			src="${ pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script
			src="${ pageContext.request.contextPath }/resources/vendor/chart.js/Chart.min.js"></script>

		<!-- Page level custom scripts -->
		<script
			src="${ pageContext.request.contextPath }/resources/js/demo/chart-area-demo.js"></script>
		<script
			src="${ pageContext.request.contextPath }/resources/js/demo/chart-pie-demo.js"></script>
</body>

</html>