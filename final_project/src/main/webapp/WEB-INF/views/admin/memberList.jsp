<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Page level plugins -->
<script src="${ pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<!-- Page level custom scripts -->
<script src="${ pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>
<!-- Custom styles for this page -->
<link href="${ pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
				<div class="nav navbar-nav justify-content-end">
					<form action="${ cp }/admin/memberList"  
						  class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-white border-secondary small"
								   placeholder="검색" aria-label="Search"
								   aria-describedby="basic-addon2"
								   name="keyword" value="${keyword }">
							<div class="input-group-append">
								<button class="btn btn-secondary" type="submit">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form> <!-- 동아리 검색 끝 -->
				</div>
			</div>
			
			<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>회원번호</th>
                                            <th>회원 아이디</th>
                                            <th>이름</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>회원정보</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>회원번호</th>
                                            <th>회원 아이디</th>
                                            <th>이름</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>회원정보</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
	                                    <c:forEach var="vo" items="${ mList }">
	                                    	<tr>
	                                            <td>${vo.m_num }</td>
	                                            <td>${vo.m_id }</td>
	                                            <td>${vo.m_name }</td>
	                                            <td>${vo.m_phone }</td>
	                                            <td>${vo.m_email }</td>
	                                            <td><a href="${cp }/member/mymember">회원정보</a></td>
	                                        </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                       		<ul class="pagination">
                        		<li class="paginate_button page-item previous disabled" id="dataTable_previous">
                        			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
										<c:choose>
											<c:when test="${i==param.pageNum }">
												<a href="${cp }/admin/memberList?pageNum=${i}&keyword=${keyword}"><span
													style="color: blue">${i }</span></a>
											</c:when>
											<c:otherwise>
												<a href="${cp }/admin/memberList?pageNum=${i}&keyword=${keyword}"><span
													style="color: gray">${i }</span></a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
                        		</li>
                        	</ul>
                        </div>
                    </div>

<!-- Content Row -->
<%-- 	 	<div class="row">

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
<!-- End of Main Content --> --%>	
			
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
