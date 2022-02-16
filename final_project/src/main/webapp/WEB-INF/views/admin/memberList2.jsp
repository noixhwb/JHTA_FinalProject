<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!-- 회원관리 -->
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
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 회원 목록 및 관리 </h1>
				<!-- 권한/이름? 검색 -->	
			</div>
			
<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
			<c:forEach var="vo" items="${ mList }">
			<!-- 첫번째 Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<!-- 동아리 -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드제목 왼쪽 -->
								<h6 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ vo.m_num }</h6>
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
														<li>회원번호 : ${vo.m_num }</li> <!-- 1번 -->
														<li>아이디 : ${vo.m_id }</li> <!-- 2번 --><br>
														<a href="${ cp }/member/mymember?m_num=${ vo.m_num }">
														회원정보보기</a>
													</ul>
												</div>
												<div class="col-md-6">
													<ul id="dot">
														<li>연락처 : ${vo.m_phone }</li> <!-- 3번 -->
														<li>계정권한 : ${vo.m_enabled }</li> <!-- 4번 -->
													</ul>
												</div>
											</div>
									</p>
								</div>
							</div>
							<div class="col-md-4"> <!-- 카드본문 오른쪽 (포스터) -->
								<img src="${ cp }/resources/images/circle/${ vo.m_profile }" 
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


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<style>
#dot{
   list-style:none;
   padding-left:5px;
   }
</style>       
