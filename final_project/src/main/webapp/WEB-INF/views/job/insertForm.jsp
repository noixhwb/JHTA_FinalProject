<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
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
<!-- Begin Page Content -->
<form method="post" action="${cp}/job/insert?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data">
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 채용 공고 게시요청 </h1>
					
			</div>

			<!-- 1. 채용공고 게시요청 주의사항 카드 -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-danger"> 채용공고 게시 안내사항 </h5>
				</div>
				
				<div class="card-body">
					<ul>
						<li> 채용 공고 게시는 무료로 진행되며,  
							 3조대학교 캠퍼스픽 담당자의 검토 및 승인 절차를 거쳐 48시간 이내 게시됩니다 </li>
						<li> 게시글 중복 방지를 위해 계정당 한 공고만 등록할 수 있습니다 </li>
					</ul>	
				</div>
			</div> <!-- 1. 채용공고 게시요청 주의사항 카드 끝 -->
<!-- Approach -->
			
			<!-- 2. 채용공고 만들기 카드 -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-dark"> 채용공고 정보 작성</h5>
				</div>
				
				<div class="card-body">
						
					<!-- (1) 공고제목, 기업명, 채용기간, 채용형태	 -->
					<div class="card mb-3">
						<div class="col-md-8">
							<div class="card-body">
							
								<h6 class="card-title font-weight-bold text-dark">공고 제목</h6>
								<p class="card-text">
									<!-- 공고제목 입력 -->
									<input type="text" name="j_subject" placeholder="" maxlength="30" autocomplete="off" class="text"><br>
								</p>
								
								<h6 class="card-title font-weight-bold text-dark">기업명</h6> // 기업리스트 API로 검사?
								<p class="card-text">
									<input type="text" name="j_company" maxlength="30" autocomplete="off" class="text"><br>
									<!-- 기업리스트 API 써야할듯! -->
									<div>
									</div>
								</p>
								
								<h6 class="card-title font-weight-bold text-dark">채용 기간</h6>
								<p class="card-text">
									<input type="date" name="j_startdate" autocomplete="off" class="text"> ~
									<input type="date" name="j_enddate" autocomplete="off" class="text">
								</p>
								
								<h6 class="card-title font-weight-bold text-dark">채용 형태</h6>
								<p class="card-text">
									<fieldset style="width:300px">
										<c:forEach items="${fn:split('신입|경력','|') }" var="career">
								    		<label><input type="checkbox" name="jc_career" value="${career }">${career }</label>
								    	</c:forEach>
							    	</fieldset>
								</p>
								
							</div>
						</div>
					</div> <!-- (1) 공고제목, 기업명, 채용기간, 채용형태 끝 -->
					
						
					<!-- (2) 모집 부문 선택  -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
							
								<h6 class="card-title font-weight-bold text-dark">모집 부문</h6>
								<p class="card-text">
									<fieldset style="width:400px">
										<c:forEach items="${fn:split('영업·영업관리|전략·기획|마케팅·광고·홍보|회계·재무|인사·노무|유통·물류|IT·SW|연구개발·설계|생산·생산관리|건축·인테리어|토목·환경|의료·보건|교육|미디어|디자인|기타','|') }"
													var="duty">
									    	<label><input type="checkbox" name="jd_duty" value="${duty }" >${duty }</label>
									    </c:forEach><br>
									    <input type="reset" value="초기화">
								    </fieldset>
								</p>
								
							</div>
						</div>
					</div> <!-- (2) 모집 부문 끝 -->
						
					<!-- (3) 근무지역 -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
								<h6 class="card-title font-weight-bold text-dark">근무 지역</h6>
								<p class="card-text">
									<fieldset style="width:300px">
										<c:forEach items="${fn:split('서울|경기|광주|대구|대전|부산|세종|울산|인천|강원|경남|경북|전남|전북|충남|충북|제주|해외|기타','|') }"
													var="zone">
									    	<label><input type="checkbox" name="jz_zone" value="${zone }">${zone }</label>
									    </c:forEach><br>
									    <input type="reset" value="초기화">
								    </fieldset>
								</p>
									
							</div>
								
						</div>
					</div> <!-- (3) 근무지역 끝 -->
						
					<!-- (4) 이미지 업로드 -->
					<div class="card mb-3">
						<div class="col-md-8">
							<div class="card-body">
								<h6 class="card-title font-weight-bold text-dark">기업 이미지 업로드</h6>
								<p class="card-text">
									<input type="file" name="file1"> <br>
								</p>
								<h6 class="card-title font-weight-bold text-dark">공고 이미지 업로드</h6>
								<p class="card-text">
									<input type="file" name="file2"> <br>
								</p>
							</div>
						</div>
					</div> <!-- (4) 이미지 업로드 끝 -->
					
					<!-- (5) 공고 URL -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
								<h6 class="card-title font-weight-bold text-dark">공고 URL</h6>
								<p class="card-text">
									<input type="text" name="j_url">
								</p>
							</div>
						</div>
					</div> <!-- (3) 근무지역 끝 -->
					<input type="submit" value="신청하기">
				</div> <!-- 채용카드의 body 끝 -->
			</div> <!-- 2. 채용카드 끝 -->
		</div>			
</form>
       
<%@ include file="/WEB-INF/views/footer.jsp" %>