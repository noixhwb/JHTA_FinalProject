<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 전체 동아리 목록 -->
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
		<div class="container-fluid">

<!-- Page Heading -->
<%--
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 전체 동아리 목록 </h1>
				<!-- 동아리 검색 -->	
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-white border-secondary small"
							   placeholder="동아리 검색" aria-label="Search"
						       aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-secondary" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form> <!-- 동아리 검색 끝 -->
			</div>
 --%>
<!-- ---------------------------------------------------------------------------------- -->
<nav class="navbar navbar-expand-lg navbar-light bg-light color-white">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" >커뮤니티</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

  
  
</nav>
<%--
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="collapse navbar-collapse" id="navbarNav">
	<ul class="nav nav-pills nav-fill" >
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="#">학술</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">취업</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">Link</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link disabled">Disabled</a>
	  </li>
	  </ul>
	 </div>
</nav>
 --%>
<!-- ---------------------------------------------------------------------------------- -->

<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
		<c:forEach var="vo" items="${ list }">
			<!-- 첫번째 Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<!-- n번 동아리 -->
				<div class="card shadow mb-3" >
				
					<div class="card-header py-2">
						<div class="row g-0">
							<div class="col-md-8" >
							
								<img src="${ cp }/resources/comm/${ vo.cu_coverimg }" 
									 style="width:70px; height:70px;">
							<a href="#">
								<h6 class="m-5 font-weight-bold text-dark" style="display:inline;"> ${ vo.cu_name }</h6>
								</a><br>
							</div>
							
							
						</div>
					</div>
					
					<div class="card-body"> 
						<div class="row g-0">
							<div class="col-md-4"> 
								<div class="card-body">
									<h6 class="card-title"> 
									<a href="#">
										<span> ${ vo.cu_intro }</span> 
										</a>
										
									</h6>
									<p class="card-text">
										
										분류:	 ${ vo.cu_category }										
														
									 </p>
									 <p class="card-text">
										
										좋아요 :	 ${ vo.cu_recommend }										
														
									 </p>
								
								</div>
							</div>
						
						</div>
					</div> <!-- n번 동아리 body 끝 -->
					
				</div> <!-- n번 동아리 끝 -->
				

			</div> <!-- 첫번쨰 Content Column 끝 -->
			</c:forEach>


		</div> <!-- Content Row 끝 -->

		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝 -->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>

	
<style>
	#dot{
	   list-style:none;
	   padding-left:5px;
	  }
</style>  
<script>
	$(document).ready(function() {
	    $(".dropdown-toggle").dropdown();
	});
	
	$(function(){
		let here = $("#here").prev().val();
		var categ = $("#circle_category_study").val();
		$("#circle_category_study").click(function(){
			alert("확인!");
			alert(categ);
			alert(here);			
		});
	});
	<%--
	$(function () { 
		// actvie 활성화 
		$(".nav-item > .active").css("color", "red"); 
		$('.nav-link').click(function () { 
			// .nav-link 클릭시 이전의 active 값 해제 후, 
			$(".nav-item > .active").css("color", "#007bff"); 
			$('.nav-link').removeClass('active'); 
			// 클릭한 위치 active 적용 $(this).addClass('active'); 
			$(".nav-item > .active").css("color", "red"); 
		}); 
	});
	--%>
</script>     
