<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
	img{width:200px; height: 200px;}
</style>
<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

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
					<h5 class="m-0 font-weight-bold text-danger"> 기업명 : ${jv.j_company } //크기줄이고 세로형태로 만들고싶다</h5>
				</div>
				<div  style="float: left";>
					<img src="${cp }/resources/upload/${jv.j_img }">
					<ul style="list-style-type:none;">
						<li>공고제목 조회수는 사진옆에다가 놔두고싶다.</li>
						<li> 공고제목 : ${jv.j_subject }</li>
						<li> 조회수 : ${jv.j_view }</li>
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
								<div class="poster">
									<img src="${cp }/resources/upload/${jv.j_infoimg }">
								</div>
							</div>
						</div>
					</div> <!-- (2) 모집 부문 끝 -->
						
					<!-- 다른 채용 공고 
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">다른 채용 공고</h6>
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
											<p class="card-text">푸쉬왜안됨!!?????</p>
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
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>	-->
					
						
					<!-- (3) 근무지역 -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
								<div class="bottombar">
									<a href="${jv.j_url }"><i class="fa-regular fa-window-restore"></i>
										<span>채용사이트 바로가기</span>
									</a>
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