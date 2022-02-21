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
	                                            <td><button class="btn btn-primary" 
	                                            onclick="location.href='${cp }/member/memberDetail?m_id=${vo.m_id }'">회원정보</button></td>
	                                        </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
																
                        <div class="pagination">
							<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
								<c:choose>
									<c:when test="${i==param.pageNum }">
										<a href="${cp }/admin/memberList?pageNum=${i}&keyword=${keyword}" 
										class="active"><span>${i }</span></a>
									</c:when>
									<c:otherwise>
										<a href="${cp }/admin/memberList?pageNum=${i}&keyword=${keyword}">
										<span>${i }</span></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>	
                    </div>
			
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
   .pagination{
		display: inline-block;
   }
   .pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	}
	.pagination a.active {
		  background-color: #4CAF50;
		  color: white;
	}
	.pagination a:hover:not(.active) {background-color: #ddd;}
	.pagination a {
	  border-radius: 25px;
	}

	.pagination a.active {
	  border-radius: 25px;
	}
</style>       
