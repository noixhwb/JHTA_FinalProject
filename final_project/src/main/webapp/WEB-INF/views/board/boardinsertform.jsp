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


	
		<form
			action="${ cp }/board/boardinsert?${_csrf.parameterName }=${_csrf.token }"
			method="post" enctype="multipart/form-data">
			<div class="container-fluid">

			
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">게시글작성 ${vo1.cu_name }</h1>

				</div>




				<div class="row">
					<div class="col-8 offset-2">
						<div class="card shadow mb-5">
						

							<div class="card-body">

						
								<div class="card mb-3">
									<div class="col-md-12">
										<div class="card-body">
											<h6 class="card-title font-weight-bold text-dark">제목</h6>
											<p class="card-text">

												<input type="text" name="b_title" placeholder="제목"
													maxlength="30" autocomplete="off" class="text">
											<div></div>
											</p>
										</div>

									</div>
								</div>


								<div class="card mb-3">
									<div class="col-md-12">

										<div class="card-body">
											<h6 class="card-title font-weight-bold text-dark">내용</h6>
											<p class="card-text">
												<textarea class="form-control"
												name="b_content" rows="10"></textarea>


										</div>

									</div>
								</div>


							
								<div class="card mb-3">
									<div class="col-md-12">

										<div class="card-body">
											<h6 class="card-title font-weight-bold text-dark">
												이미지 첨부</h6>
											<p class="card-text">
												<input type="file" name="file1"> <br>
											</p>
										</div>

									</div>
								</div>
								
							</div>
							
						</div>
					</div>
				</div>
			





				<input type="hidden" name="cu_num" value="${vo1.cu_num }">
				<input type="hidden" name="m_num" value="${vo.m_num }">
				
			


			</div>
		

			<div class="container show-grid" style="margin: auto; text-align: center; margin-bottom: 100px;">
				<input type="submit" class="btn btn-dark" value="등록하기">
			</div>

			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">

		</form>

	</div>
	


</div>


<%@ include file="/WEB-INF/views/footer.jsp"%>


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

<style>
#dot{
   list-style:none;
   padding-left:5px;
   }
</style>       
