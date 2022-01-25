<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp"%>


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
					class="mr-2 d-none d-lg-inline text-gray-600 small">홍길동님</span> <img
					class="img-profile rounded-circle"
					src="${cp}/resources/img/undraw_profile.svg">
			</a> <!-- Dropdown - User Information -->
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
					</a> <a class="dropdown-item" href="#"> <i
						class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 수정
					</a> <a class="dropdown-item" href="#"> <i
						class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 활동기록
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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
									<img
										src="${cp}/resources/img/undraw_profile.svg"
										class="img-fluid rounded-start" alt="..."
										style="max-width: 50px;">
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



	<%@ include file="/WEB-INF/views/footer.jsp"%>