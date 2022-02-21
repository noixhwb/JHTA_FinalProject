<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 결과 보기 -->
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
			<!-- 
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 동아리 상세보기 </h1>
					
			</div>
			 -->
			 
<!-- Approach -->
			<div class="row">
				<div class="col-6 offset-3">
			<div class="card shadow mb-4 ">

				<div class="card-body">
					
					<!-- 1. 동아리 정보 -->
					<div class="card mb-3">
						<div class="row g-0">
							<div class="col-sm-12">
								<div class="card-body">
									<h5 class="card-title"></h5>
									<p class="card-text">
									
										<div class="row g-0">
											<div class="col-md-6">
												<c:choose>
													<c:when test="${result=='success' }">
														<h1>등록완료</h1>
													</c:when>
													<c:otherwise>
														<h1>실패</h1>
													</c:otherwise>
												</c:choose>
												<a href="${pageContext.request.contextPath }/">홈</a>
											</div>
											
										</div>
												
									</p>
								</div>
									
							</div>
						</div>
					</div> <!-- 1. 동아리 정보 끝 -->
						

		</div> <!-- container-fluid (Main Content의 메인부분) 끝-->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝-->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	
	</div>
	</div>
	</div>

<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->
		
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
