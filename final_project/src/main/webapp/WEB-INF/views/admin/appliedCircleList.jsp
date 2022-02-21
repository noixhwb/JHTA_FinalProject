<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!-- 회원관리 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
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
				<h1 class="h3 mb-0 text-gray-800"> 게시요청 페이지 </h1>
			</div>
<!-- Navi -->	
		 
			<ul class="nav nav-tabs justify-content-center  mb-10">
				<li class="nav-item">
					<a class="nav-link" href="${ cp }/admin/appliedJobList">채용공고 게시요청</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="${ cp }/admin/appliedCircleList">동아리 게시요청</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${ cp }/admin/appliedCommuList">커뮤니티 게시요청</a>
				</li>
			</ul>
<!-- ------------------------------------------------------------ -->	

<!-- Approach -->
			<!-- 동아리 상세정보 카드 -->
			<div class="row">
				<div class="col-8 offset-2">
			<div class="card shadow mb-4 mt-4">

				<div class="card-body">

				<nav class="navbar navbar-expand-sm navbar-white bg-white">
 
				<ul class="nav navbar-nav justify-content-end">
					<!-- 정렬 -->
		        	<li class="nav-item dropdown ml-auto">
			            <!-- Nav Item - User Information -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
							   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-sm-inline text-gray-600 small"></span> 
								전체
							</a> 
						<!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								 aria-labelledby="userDropdown">
								<a class="dropdown-item" 
								   href="${ cp }/admin/appliedCircleList?category=ci_category&keyword=학술"> 
									학술
								</a>
								<a class="dropdown-item" 
								   href="${ cp }/circle/appliedCircleList?category=ci_category&keyword=취업">
									취업
								</a>
								<a class="dropdown-item" 
								   href="${ cp }/circle/appliedCircleList?category=ci_category&keyword=봉사">
									봉사
								</a>
								<a class="dropdown-item" 
								   href="${ cp }/circle/appliedCircleList?category=ci_category&keyword=기타">
									기타
								</a>
							</div>
						</li>
		       		</li> <!-- 정렬 끝 -->
				</ul>
				</nav>
				
				
				
				<table class="table table-hover" style="text-align: center;">
					<thead>
					<tr>
						<th scope="col">번호</th>
				    	<th scope="col">동아리
				    	
				    	</th>
				    	<th scope="col">요청자</th>
				    	<th scope="col">게시요청일</th> <!-- 하고싶은데... 안되겠죠? -->
				    	<th scope="col">승인여부</th> <!-- approve, reject -->
				    </tr>
					</thead>
					<c:forEach var="vo" items="${ appliedcirclelist }">
					<tr>
						<th scope="row">${ vo.ci_num }</th>
						<td>
							<button class="btn btn-white" data-target="#circleInfoModal${vo.ci_num }" data-toggle="modal">${ vo.ci_name }</button>
<!-- Modal -->
<div class="modal fade" id="circleInfoModal${ vo.ci_num }" tabindex="-1" role="dialog"
	 aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">동아리 정보</h5>
				<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			
			<div class="modal-body">
				<ul id="dot">
					<!-- 동아리 정보 -->
					<li style="text-align:center;">
						<img src="${ cp }/resources/images/circle/${ vo.ci_logofile }" 
						 	 style="width:80px; height:80px;">
						<input type="text" name="ci_name"
							   style="border:none;" 
							   value="${ vo.ci_name }"
							   readonly="readonly">
					</li>
					<li>
						<!-- ${ myvo.ci_category } -->
						<h6 class="card-title font-weight-bold text-dark">동아리 분야</h6>
						<p>
							${ vo.ci_category }
						</p>
					</li>
					<li>
						<h6 class="card-title font-weight-bold text-dark">동아리 규모</h6>
						${ vo.ci_person }
					</li>
					<!-- 게시글 정보 -->
					<li>
						<h6 class="card-title font-weight-bold text-dark">글 제목</h6>
							${ vo.ci_title }
						</li>
						<li>
							<h6 class="card-title font-weight-bold text-dark">모집 기간</h6>
							<p>
								${ vo.ci_startdate } ~ ${ vo.ci_enddate }
							</p>
						</li>
						<li>
							<h6 class="card-title font-weight-bold text-dark">상세 내용</h6>
			                    	${ vo.ci_content }
						</li>
				</ul>
			</div>
				
		</div>
	</div>
</div>
<!-- End Modal -->
						</td>
						<td>${ vo.m_id }</td>
						<td>요청일어케?</td>
						<td>
							<button class="btn btn-primary" onclick="approve(${vo.ci_num})">approve</button>
							<button class="btn btn-primary" onclick="reject(${vo.ci_num})" style="background-color: #FF5E00">reject</button>
						</td>
					</tr>
					</c:forEach>
				</table>
				</div>
				
				
				
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==param.pageNum }">
				<a href="${cp }/admin/appliedCircleList?pageNum=${i}&keyword=${keyword}"><span
					style="color: blue">${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/appliedCircleList?pageNum=${i}&keyword=${keyword}"><span
					style="color: gray">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>

			</div>
				</div>
			</div>

		
<%--			
<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
			<c:forEach var="vo" items="${ circleList }">
			<!-- 첫번째 Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<!-- 동아리 -->
				
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드제목 왼쪽 -->
								<h6 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ vo.ci_num }</h6>
							</div>
							<div class="col-md-4"> <!-- 카드제목 오른쪽 -->
							</div>
						</div>
					</div>
					
					<div class="card-body"> <!-- body -->
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드본문 왼쪽 (정보) -->
								<div class="card-body">
									<h6 class="card-title"> 
										<!--  --> 
									</h6>
									<p class="card-text">
										
											<div class="row g-0">
												<div class="col-md-6">
													<ul id="dot">
														<li>회원번호 : ${vo.ci_num }</li> <!-- 1번 -->
														<li>아이디 : ${vo.ci_num }</li> <!-- 2번 --><br>
														<a href="${ cp }/member/mymember?ci_num=${ vo.ci_num }">
														회원정보보기</a>
														<p><button class="btn btn-primary" onclick="approve(${vo.ci_num})">approve</button>
														<button class="btn btn-primary" onclick="reject(${vo.ci_num})" style="background-color: #FF5E00">reject</button></p>
													</ul>
												</div>
												<div class="col-md-6">
													<ul id="dot">
														<li>연락처 : ${vo.ci_num }</li> <!-- 3번 -->
														<li>계정권한 : ${vo.ci_num }</li> <!-- 4번 -->
													</ul>
												</div>
											</div>
									</p>
								</div>
							</div>
							<div class="col-md-4"> <!-- 카드본문 오른쪽 (포스터) -->
								<img src="${ cp }/resources/images/circle/${ vo.ci_num }" 
									 class="img-fluid rounded-start" alt="..." style="max-width: 150px;">
							</div>
						</div>
					</div> <!-- body 끝 -->
					
				</div> <!-- 끝 -->
				

			</div> <!-- 첫번쨰 Content Column 끝 -->
			</c:forEach>


		</div> <!-- Content Row 끝 -->
 --%>
		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝 -->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	
<!-- @@@@@@ 페이징처리 @@@@@@-->


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->


<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<script>
	function approve(ci_num) {
		$.ajax({
			url:'${cp}/admin/confirmCircle?ci_num=' + ci_num, 
			dataType:'json', 
			success:function(data){ 
				if(data.result==true) {
					alert("승인완료!");
				}else {
					alert("에러지롱");
				}
			}
		});
	};
	function reject(j_num) {
		$.ajax({
			url:'${cp}/admin/rejectCircle?ci_num=' + ci_num, 
			dataType:'json', 
			success:function(data){ 
				if(data.result==true) {
					alert("거절완료!");
				}else {
					alert("에러지롱");
				}
			}
		});
	};
</script>
<style>
#dot{
   list-style:none;
   padding-left:5px;
   }
</style>       






<%--
 <nav class="navbar navbar-light bg-light color-white">
 
    	<ul class="navbar-nav">
<!-- 정렬 -->
		        	<li class="nav-item dropdown ml-auto">
			            <!-- Nav Item - User Information -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
							   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-sm-inline text-gray-600 small"></span> 
								동아리
							</a> 
						<!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								 aria-labelledby="userDropdown">
								<a class="dropdown-item" 
								   href="${ cp }/admin/appliedCircleList?category=ci_category&keyword=${ keyword }&order=1"> 
									학술
								</a>
								<a class="dropdown-item" 
								   href="${ cp }/circle/appliedCircleList?category=ci_category&keyword=${ keyword }&order=2">
									취업
								</a>
								<a class="dropdown-item" 
								   href="${ cp }/circle/appliedCircleList?category=ci_category&keyword=${ keyword }&order=2">
									봉사
								</a>
								<a class="dropdown-item" 
								   href="${ cp }/circle/appliedCircleList?category=ci_category&keyword=${ keyword }&order=2">
									기타
								</a>
							</div>
						</li>
		       		</li> 
		       		<!-- 정렬 끝 -->
				    		</ul>
				    		</nav>
				    		 --%>
