<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<style>
	img{width:200px; height: 200px;}
</style>
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
<!--  		<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 채용 공고 게시요청 </h1>
					
			</div> -->

			<!-- 1. 카드 -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-danger"> ${jv.j_company }</h5>
				</div>
				<div>
					<img src="${cp }/resources/upload/${jv.j_img }">
				</div>
				<div class="card-body" style="float: left;">
					<ul style="list-style-type:none;">
						<li> ${jv.j_subject }</li>
						<li> ${jv.j_view }</li>
					</ul>	
				</div>
			</div> <!-- 1.  카드 끝 -->

<!-- Approach -->

			<div class="card shadow mb-4">
				
				<div class="card-body">
						
					<!-- (1) 상세정보	 -->
					<div class="card mb-3">
						<div class="col-md-8">
							<div class="card-body">
							
								<h6 class="card-title font-weight-bold text-dark">접수 기간</h6>
								<div class="section">
										<p class="dday"></p>
										<p class="indent">${jv.j_startdate } ~ ${jv.j_enddate }</p>
								</div>	
								<div class="section">
									<h6 class="card-title font-weight-bold text-dark">채용 형태</h6>
										<p class="indent">${cv.jc_career }</p>
									<h6 class="card-title font-weight-bold text-dark">모집 부문</h6>
										<p class="indent">${dv.jd_duty }</p>
									<h6 class="card-title font-weight-bold text-dark">근무 지역</h6>
										<p class="indent">${zv.jz_zone }</p>
								</div>
							</div>
						</div>
					</div> <!-- (1) 공고제목, 기업명, 채용기간, 채용형태 끝 -->
					
						
					<!-- (2) 모집 부문 선택  -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
							
								<h6 class="card-title font-weight-bold text-dark">모집 부문</h6>
								<div class="poster">
									<img src="${cp }/resources/upload/${jv.j_infoimg }">
								</div>
							</div>
						</div>
					</div> <!-- (2) 모집 부문 끝 -->
						
					<!-- (3) 근무지역 -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
								<div class="bottombar">
									<a href="${jv.j_url }"><span>채용사이트 바로가기</span></a>  
									<a class="share">공유</a>
								</div>
							</div>
								
						</div>
					</div> <!-- (3) 근무지역 끝 -->
						
				</div> <!-- 채용카드의 body 끝 -->
			</div> <!-- 2. 채용카드 끝 -->
			

<!-- 다른채용공고 
<div class="more">
	<h2>다른 채용공고</h2>
	<a href="">
		<span class="dday"></span>
		<span class="view">${jv.j_view }</span>
	</a>
</div>
-->

		</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>