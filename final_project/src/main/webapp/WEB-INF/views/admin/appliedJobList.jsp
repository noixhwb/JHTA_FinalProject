<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!-- 승인요청페이지 -->
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
			<ul class="nav nav-tabs justify-content-center">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="${ cp }/admin/appliedJobList">채용공고 게시요청</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${ cp }/admin/appliedCircleList">동아리 게시요청</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${ cp }/admin/appliedCommuList">커뮤니티 게시요청</a>
				</li>
			</ul>
<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
			<c:forEach var="vo" items="${ jobList }">
			<!-- 첫번째 Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<!-- 동아리 -->
				
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드제목 왼쪽 -->
								<h6 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ vo.j_num }</h6>
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
														<li>회원번호 : ${vo.j_num }</li> <!-- 1번 -->
														<li>아이디 : ${vo.j_num }</li> <!-- 2번 --><br>
														<a href="${ cp }/member/mymember?j_num=${ vo.j_num }">
														회원정보보기</a>
														<p>
														<button class="btn btn-primary" onclick="approve(${vo.j_num})" >approve</button>
														<button class="btn btn-primary" onclick="reject(${vo.j_num})" style="background-color: #FF5E00">reject</button>
														</p>
													</ul>
												</div>
												<div class="col-md-6">
													<ul id="dot">
														<li>연락처 : ${vo.j_num }</li> <!-- 3번 -->
														<li>계정권한 : ${vo.j_num }</li> <!-- 4번 -->
													</ul>
												</div>
											</div>
									</p>
								</div>
							</div>
							<div class="col-md-4"> <!-- 카드본문 오른쪽 (포스터) -->
								<img src="${ cp }/resources/images/circle/${ vo.j_num }" 
									 class="img-fluid rounded-start" alt="..." style="max-width: 150px;">
							</div>
						</div>
					</div> <!-- body 끝 -->
					
				</div> <!-- 끝 -->
				

			</div> <!-- 첫번쨰 Content Column 끝 -->
			</c:forEach>


		</div> <!-- Content Row 끝 -->

		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝 -->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	
<!-- @@@@@@ 페이징처리 @@@@@@-->
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==param.pageNum }">
				<a href="${cp }/admin/jobConfirm?pageNum=${i}&keyword=${keyword}"><span
					style="color: blue">${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/jobConfirm?pageNum=${i}&keyword=${keyword}"><span
					style="color: gray">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>

<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<script>
	function approve(j_num) {
		$.ajax({
			url:'${cp}/admin/confirmJob?j_num=' + j_num, 
			dataType:'json', 
			success:function(data){ 
				if(data.result==true) {
					alert("승인요청 완료!");
				}else {
					alert("에러지롱");
				}
			}
		});
	};
	function reject(j_num) {
		$.ajax({
			url:'${cp}/admin/rejectJob?j_num=' + j_num, 
			dataType:'json', 
			success:function(data){ 
				if(data.result==true) {
					alert("거절요청 완료!");
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
