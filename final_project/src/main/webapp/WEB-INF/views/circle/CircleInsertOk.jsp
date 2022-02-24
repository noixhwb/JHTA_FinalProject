<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 동아리+게시글 등록 확인 -->
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
		<form action="${ cp }/home" style="margin: auto; text-align: center;" enctype="multipart/form-data">
		<div class="container-fluid">

<!-- Page Heading -->
		<c:choose>
			<c:when test="${ requestScope.result == 'success' }">
				<div class="row">
					<div class="col-6 offset-3">
				<div class="card shadow bg-white mb-3 mt-4">
					<div class="card-header bg-light text-dark" style="text-align: left;">
						<small class="text-muted" style="text-align:left;"> 게시요청확인 </small> <br> 
					</div>
					<div class="card-body" style="text-align: 100px;">
						<img src="${cp}/resources/images/circle/checked.png" class="card-img-top" style="width: 300px; height: 300px; margin-top: 50px; margin-bottom: 50px;">
					</div>
					<div class="card-footer text-danger">
						<h5 class="card-title"><strong>게시요청이 완료되었습니다</strong></h5>
						MY동아리 > 동아리 관리 페이지에서 진행 상태를 확인해주세요!
					</div>
				</div>
					</div>
				</div>
			</c:when>
	
			<c:otherwise>
				<div class="row">
					<div class="col-6 offset-3">
				<div class="card shadow bg-white mb-3" style="margin-top: 10%;">
					<div class="card-header bg-secondary text-white">
						<small class="text-muted" style="text-align:left;"> 게시불가확인 </small> <br> 
					</div>
					<div class="card-body" style="margin-bottom: 100px;">
						<img src="${cp}/resources/images/circle/sad-face.png" class="card-img-top" style="width: 300px; height: 300px; margin-top: 50px; margin-bottom: 50px;">
					</div>
					<div class="card-footer text-danger">
						<h5 class="card-title"><strong>게시요청을 완료하지 못했습니다</strong></h5>
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
			<input type="submit" class="btn btn-dark" value="홈으로 돌아가기">
		</div>

		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
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
	
