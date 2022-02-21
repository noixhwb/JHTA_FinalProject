<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 전체 동아리 목록 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> MY 커뮤니티 </h1>
			</div>
			
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light color-white">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
	</button>
    	<!-- (1) Navbar 왼쪽 -->
    	<div class="collapse navbar-collapse" id="navbarNavDropdown">
    		<ul class="nav nav-tabs navbar-nav">
		        <li class="nav-item">
		        	<a class="nav-link" href="${ cp }/community/communityMyList">내가쓴글 / 내가쓴댓글 </a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="${ cp }/community/communityMyLike">좋아요한 커뮤니티</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link active" href="${ cp }/community/communityMy">커뮤니티 관리</a>
		        </li>
     		</ul>
    	</div> <!-- (1) Navbar 왼쪽 끝 -->
    
    	<!-- (2) Navbar 오른쪽 -->
    	
</nav> 
<div>내가좋아요한 커뮤니티</div>

<!-- Approach -->
		

<!-- ----------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------- -->
<!-- ----------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------- -->
<!-- ----------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------- -->
<!-- ----------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------- -->
<!-- ----------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------- -->
<!-- ----------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------- -->
<!-- ----------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------- -->
<!-- ----------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@----------------- -->
<!-- 신청한 학생 목록 보이기 -->
						
					
					



		</div> <!-- container-fluid (Main Content의 메인부분) 끝-->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝-->
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
	
<style>
#dot{
   list-style:none;
   padding-left:5px;
   }
</style>       
