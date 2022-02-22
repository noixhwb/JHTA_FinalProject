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
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 동아리 목록 </h1>
			</div>
			
			
<!-- ---------------------------------------------------------------------------------- -->
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light color-white">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
	</button>
    	
    	<!-- (1) Navbar 왼쪽 -->
    	<div class="collapse navbar-collapse" id="navbarNavDropdown">
    		<ul class="navbar-nav">
        		<li class="nav-item">
        			<a class="nav-link active" href="${ cp }/circle/CircleList">전체</a>
        		</li>
		        <li class="nav-item">
		        	<a class="nav-link" href="${ cp }/circle/CircleList?category=ci_category&keyword=학술&name=ci_name&keywords=">학술</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="${ cp }/circle/CircleList?category=ci_category&keyword=취업&name=ci_name&keywords=">취업</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="${ cp }/circle/CircleList?category=ci_category&keyword=봉사&name=ci_name&keywords=">봉사</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="${ cp }/circle/CircleList?category=ci_category&keyword=기타&name=ci_name&keywords=">기타</a>
		      	</li>
     		</ul>
    	</div> <!-- (1) Navbar 왼쪽 끝 -->
    
    	<!-- (2) Navbar 오른쪽 -->
    	<ul class="nav navbar-nav justify-content-end">
    		<!-- 동아리 검색 -->
    		<li>
				<form action="${ cp }/circle/CircleList"  
					  class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="hidden" name="category" value="ci_category">
						<input type="hidden" name="keyword" value="${ keyword }">
						<input type="hidden" name="name" value="ci_name">
						<input type="text" class="form-control bg-white border-secondary small"
							   placeholder="동아리 검색" aria-label="Search"
							   aria-describedby="basic-addon2"
							   name="keywords">
						<div class="input-group-append">
							<button class="btn btn-secondary" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form> <!-- 동아리 검색 끝 -->
        	</li>
        	
        	<!-- 정렬 -->
        	<li class="nav-item dropdown ml-auto">
	            <!-- Nav Item - User Information -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
					   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="mr-2 d-none d-sm-inline text-gray-600 small"></span> 
						정렬
					</a> 
				<!-- Dropdown - User Information -->
					<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
						 aria-labelledby="userDropdown">
						<a class="dropdown-item" 
						   href="${ cp }/circle/CircleList?category=ci_category&keyword=${keyword }&name=ci_name&keywords=${keywords }&order=1"> 
							<i class="fa-solid fa-eye fas fa-sm fa-fw mr-2"></i>
							조회수순 
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" 
						   href="${ cp }/circle/CircleList?category=ci_category&keyword=${keyword }&name=ci_name&keywords=${keywords }&order=2">
							<i class="fa-solid fa-heart fas fa-sm fa-fw mr-2"></i>
							좋아요순
						</a>
					</div>
				</li>
       		</li> <!-- 정렬 끝 -->
      </ul> <!-- (2) Navbar 오른쪽 끝 -->
      
</nav>


<!-- ---------------------------------------------------------------------------------- -->

<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
			<c:forEach var="vo" items="${ catlist }">
			<!-- 첫번째 Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<!-- n번 동아리 -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드제목 왼쪽 -->
								<img src="${ cp }/resources/images/circle/${ vo.ci_logofile }" 
									 style="width:50px; height:50px;">
								&nbsp;&nbsp;&nbsp;
								<h6 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ vo.ci_name }</h6>
							</div>
							<div class="col-md-4"> <!-- 카드제목 오른쪽 -->
								<span class="badge badge-pill badge-secondary">${ vo.ci_category }</span>
								<span class="badge badge-pill badge-secondary">${ vo.ci_person }</span>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
<div id="row1" style="display:inline; float:center;">
							<button class="btn btn-danger" data-target="#removeCircleModal${ vo.ci_num }" data-toggle="modal">동아리 삭제</button>
<!-- Modal -->
<form action="${ cp }/circle/removeCircle?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="removeCircleModal${ vo.ci_num }" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title" id="exampleModalLabel"></h6>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">
					<input type="hidden" value="${ vo.ci_num }" id="ci_num" name="ci_num">
					<h5>해당 동아리를 삭제하시겠습니까? </h5>
				</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<input type="submit" class="btn btn-primary" value="삭제하기">
				</div>
			</div>
		</div>
	</div>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</div>

<div id="row2" style="display:inline; float:center;">
<%--
									<button class="btn btn-danger" onclick="remove(${vo.ci_num})" id="delete">삭제</button>
 --%>
									<button class="btn btn-warning" data-target="#removeBoardModal${ vo.ci_num }" data-toggle="modal">게시글 삭제</button>
<!-- Modal -->
<form action="${ cp }/circle/removeBoard?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="removeBoardModal${ vo.ci_num }" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title" id="exampleModalLabel"></h6>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">
					<input type="hidden" value="${ vo.ci_num }" id="ci_num" name="ci_num">
					<h5>해당 게시글을 삭제하시겠습니까? </h5>
				</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<input type="submit" class="btn btn-primary" value="삭제하기">
				</div>
			</div>
		</div>
	</div>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</div>
								</sec:authorize>
							</div>
							<input type="hidden" value="${ vo.ci_category }" id="catvalue">
						</div>
					</div>
					<div class="card-body"> <!-- n번 동아리 body -->
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드본문 왼쪽 (정보) -->
								<div class="card-body">
									<h6 class="card-title"> 
										<a href="${ cp }/circle/CircleDetail?ci_num=${ vo.ci_num }">									
										${ vo.ci_title }</a> 
									</h6>
									<p class="card-text">
										
										<div class="row g-0">
											<div class="col-md-6">
												<ul id="dot">
													<!-- <li>모집기간 : ${ vo.ci_startdate } ~ ${ vo.ci_enddate }</li>  -->
													<li>
														<!-- 디데이 -->
														<!-- 현재날짜 -->
														<c:set var="today" value="<%=new java.util.Date()%>" />
														<c:set var="end" value="${vo.ci_enddate}" />
														<!-- Date format 'yyyy/MM/dd' -->
														<c:set var="date">
															<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
														</c:set>
														<c:set var="enddate">
															<fmt:formatDate value="${end}" pattern="yyyy-MM-dd" />
														</c:set>
															
														<!-- String >> Date 형 변환 -->
														<fmt:parseDate var="endPlanDate" value="${enddate}" pattern="yyyy-MM-dd" />
																														
														<!-- 숫자로 변환 -->
														<fmt:parseNumber var="today" value="${today.time / (1000*60*60*24)}" integerOnly="true" />
														<fmt:parseNumber var="endTime" value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true"/>
														<c:choose>
															<c:when test="${ (endTime-today) == 0 }">
																<span style="color: red;">D-DAY</span>
															</c:when>
															<c:when test="${ (endTime-today) < 0 }">
																<span style="color: dimgrey;">모집기간종료</span>
															</c:when>
															<c:otherwise>
																<span style="color: steelblue;">D-${endTime - today}</span>
															</c:otherwise>
														</c:choose>
													</li>
													<li>
														<c:choose>
															<c:when test="${ (endTime-today) < 0 }">
															</c:when>
															<%-- 인원마감될때
															<c:when test="${ }">
																모집마감
															</c:when>
															 --%>
															<c:otherwise>
																모집중
															</c:otherwise>
														</c:choose>
													</li> <!-- 2번 -->
												</ul>
											</div>
											<div class="col-md-6">
												<ul id="dot">
													<li>
														<i class="fa-solid fa-eye" style="color: cornflowerblue;"></i>
														${ vo.ci_view }
													</li> <!-- 3번 -->
													<li>
														<i class="fa-solid fa-heart" style="color: palevioletred;"></i>
														${ vo.ci_recommend }
													</li> <!-- 4번 -->
												</ul>
											</div>
										</div>
											
									</p>
								</div>
							</div>
							<div class="col-md-4"> <!-- 카드본문 오른쪽 (포스터) -->
								<img src="${ cp }/resources/images/circle/${ vo.ci_imgfile }" 
									 class="img-fluid rounded-start" alt="..." style="width:150px;">
							</div>
						</div>
					</div> <!-- n번 동아리 body 끝 -->
					
				</div> <!-- n번 동아리 끝 -->
				

			</div> <!-- 첫번쨰 Content Column 끝 -->
			</c:forEach>


<!-- 검색 -->
<!-- 
	<div>
		<form action="${ cp }/circle/CircleList">
			<select name="category">
				<option value="ci_category" <c:if test="${ category=='ci_category' }">selected</c:if>>학술</option>
			</select>
			<input type="text" name="keyword" value="${ keyword }">
			<input type="submit" value="검색!!">
		</form>
	</div>
 -->	
	
	
		</div> <!-- Content Row 끝 -->

		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->

<!-- 글목록번호 -->
	<div>
		<c:forEach var="i" begin="${ pu.startPageNum }" end="${ pu.endPageNum }">
			<c:choose>
				<c:when test="${ i == param.pageNum }">
					<a href="${ cp }/circle/CircleList?pageNum=${i}&category=${category}&keyword=${keyword}"><span style="color:blue">${ i }</span></a>
				</c:when>
				<c:otherwise>
					<a href="${ cp }/circle/CircleList?pageNum=${i}&category=${category}&keyword=${keyword}"><span style="color:gray">${ i }</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	
	
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
</script>     


