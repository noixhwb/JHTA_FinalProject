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
	<div id="content-wrapper" class="d-flex flex-column" style="height: 800px;">

<!-- Main Content -->
		<div id="content">


<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 커뮤니티 </h1>
				
				<form action="${ cp }/community/communityList"  
					  class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group" style="position: relative; left: 1260px;">
						<input type="text" class="form-control bg-white border-secondary small"
								   placeholder="검색" aria-label="Search"
								   aria-describedby="basic-addon2"
								   name="keyword" value="${keyword}">
							<div class="input-group-append">
								<button class="btn btn-secondary" type="submit">
									<i class="fas fa-search fa-sm"></i>
								</button>
						</div>
					</div>
				</form> <!-- 동아리 검색 끝 -->
        	
			</div>

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

<!-- ---------------------------------------------------------------------------------- -->

<!-- Content Row -->
		<div class="row">

<!-- Content Column -->
		<c:forEach var="vo" items="${ list }">
			<!-- 첫번째 Content Column -->
			<div class="container" style="width: 890px;">

<!-- Approach -->
				<div class="table table-hover" style=" cursor: pointer;" onclick="location.href='${ cp }/community/communitydetail?cu_num=${ vo.cu_num }' ;">
				 <div class="card shadow mb-3" >
				
					 <div class="card-header py-2">
						 <div class="row g-0"> 
							
							<img class="rounded-circle" src="${ cp }/resources/comm/${ vo.cu_coverimg }" style="width:70px; height:70px;">
							<div>${ vo.cu_name }  <br>  ❤${ vo.cu_recommend }	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 12px;"> ${ vo.cu_category }	</span>	<br> <span> ${ vo.cu_intro }</span> <br>  	</div> 
						 
				</div>  
					
					
						  
						
						
						
						<div>
								
								</div> 
								
								
					</div> 
					
					
				</div> <!-- n번 동아리 끝 --> 
				

			</div> <!-- 첫번쨰 Content Column 끝 -->
			</div>
			</c:forEach>


		</div> <!-- Content Row 끝 -->
 </div>
                        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                       		<ul class="pagination">
                        		<li class="paginate_button page-item previous disabled" id="dataTable_previous">
                        			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
										<c:choose>
											<c:when test="${i==param.pageNum }">
												<a href="${cp }/community/communityList?pageNum=${i}&keyword=${keyword}"><span
													style="color: blue">${i }</span></a>
											</c:when>
											<c:otherwise>
												<a href="${cp }/community/communityList?pageNum=${i}&keyword=${keyword}"><span
													style="color: gray">${i }</span></a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
                        		</li>
                        	</ul>
                        </div>
                    </div>
		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->
			
		 <!-- Main Content 끝 -->
<!-- End of Main Content -->
			
	 <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>

	
