<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!-- 내 동아리 관리 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column" style="margin-bottom: 200px;">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> MY 동아리 </h1>
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
		        	<a class="nav-link" href="${ cp }/circle/MyCircleList">신청한 동아리</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="${ cp }/circle/MyCircleLike">좋아요한 동아리</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link active" href="${ cp }/circle/MyCircle?name=ci_ok&keyword=1">동아리 관리</a>
		        </li>
     		</ul>
    	</div> <!-- (1) Navbar 왼쪽 끝 -->
    
    	<!-- (2) Navbar 오른쪽 -->
    	<ul class="nav navbar-nav justify-content-end">
    		<!-- 동아리 검색 -->
    		<li>
				<form action="${ cp }/circle/MyCircle"  
					  class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="hidden" name="name" value="ci_name">
						<input type="text" class="form-control bg-white border-secondary small"
							   placeholder="동아리 검색" aria-label="Search"
							   aria-describedby="basic-addon2"
							   name="keyword">
						<div class="input-group-append">
							<button class="btn btn-secondary" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form> <!-- 동아리 검색 끝 -->
        	</li>
      </ul> <!-- (2) Navbar 오른쪽 끝 -->
</nav> 


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
        			<a class="nav-link active" href="${ cp }/circle/MyCircle?name=ci_ok&keyword=1">게시한 동아리</a>
        		</li>
		        <li class="nav-item">
		        	<a class="nav-link" href="${ cp }/circle/MyCircle?name=ci_ok&keyword=0">게시요청한 동아리</a>
		        </li>
     		</ul>
    	</div> <!-- (1) Navbar 왼쪽 끝 -->
</nav>

<!-- Approach -->
			<!-- 0. MY 동아리 카드 -->
			<div class="row">
				<div class="col-6 offset-3 mt-4 mb-5">
			<c:if test="${ not empty mylist }">
			<c:forEach var="myvo" items="${ mylist }">
				
			<div class="card shadow mb-3">
					<c:choose>
					<c:when test="${ myvo.ci_ok eq 0 }">
						<div class="card-header py-3 bg-light" style=" color:orange;">
							<h6 class="m-0 font-weight-bold" style="display:inline;">게시요청 중</h6>
						</div>				
					</c:when>
					<c:when test="${ myvo.ci_ok eq 20 }">
						<div class="card-header py-3 bg-light" style="color: red;">
							<h6 class="m-0 font-weight-bold" style="display:inline;">승인 거절 - 부적절한 게시 의도</h6>
						</div>
					</c:when>
					<c:when test="${ myvo.ci_ok eq 30 }">
						<div class="card-header py-3 bg-light" style="color: red;">
							<h6 class="m-0 font-weight-bold" style="display:inline;">승인 거절 - 영리 목적의 게시요청</h6>
						</div>
					</c:when>
					</c:choose>
					<div class="card-body">
						<div class="row">
						<div class="col-6" style="margin: auto; text-align: center;">
							<!-- 동아리정보 -->
							<img src="${ cp }/resources/images/circle/${ myvo.ci_logofile }" 
								 style="width:80px; height:80px;">
							<h5 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ myvo.ci_name } </h5>
						</div>
						<div class="col-6" style="margin: auto; text-align: center;">
							카테고리 : ${ myvo.ci_category }<br>
							모집인원 : ${ myvo.ci_person }<br>		
						</div>
						</div>
						
						<c:if test="${ myvo.ci_ok eq 0 }">
						<div class="row">
						<div class="col-6 offset-4 mt-4">
<!-- 동아리 정보 수정하기 모달 -->
						<button class="btn btn-secondary" data-target="#circleInfoModal" data-toggle="modal">동아리 정보 수정하기</button>
<!-- Modal -->
<form action="${ cp }/circle/MyCircleUpdate1?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="circleInfoModal" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">동아리 정보</h5>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">
					<ul id="dot">
						<li style="text-align:center;">
							<img src="${ cp }/resources/images/circle/${ myvo.ci_logofile }" 
							 	 style="width:80px; height:80px;">
							<input type="text" name="ci_name"
								   style="border:none; width:100px;" 
								   value="${ myvo.ci_name }">
						</li>
						<li>
							<!-- ${ myvo.ci_category } -->
							<h6 class="card-title font-weight-bold text-dark">동아리 분야</h6>
							<p>
								<input type="radio" name="ci_category" value="학술">학술
								<input type="radio" name="ci_category" value="취업">취업
								<input type="radio" name="ci_category" value="봉사">봉사
								<input type="radio" name="ci_category" value="기타">기타
							</p>
						</li>
						<li>
							<!-- ${ myvo.ci_name } -->
							<h6 class="card-title font-weight-bold text-dark">동아리 규모</h6>
							<p class="card-text">
								<input type="radio" name="ci_person" value="10">10명 이하
								<input type="radio" name="ci_person" value="20">11명 ~ 20명 이하
								<input type="radio" name="ci_person" value="30">21명 ~ 30명 이하
							</p>
						</li>
						<br>
						<li>
							<h6 class="card-title font-weight-bold text-dark">동아리 이미지 업로드</h6>
							<p class="card-text">
								<input type="file" name="file1"> <br>
							</p>
						</li>
					</ul>
				</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<input type="submit" class="btn btn-primary" value="수정">
				</div>
			</div>
		</div>
	</div>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
						</div>
						</div>
						</c:if>
						
						<br> <hr width="100%" color="#C0C0C0" noshade /> <br> <!-- 구분선 -->
						
						<div class="row">
						<div class="col-9" style="margin: auto; text-align: center;">
							<h5><strong>${ myvo.ci_title }</strong></h5>
							${ myvo.ci_startdate }~${ myvo.ci_enddate } <br>
							<img src="${ cp }/resources/images/circle/${ myvo.ci_imgfile }" 
								 style="width:300px; margin-top:30px; margin-bottom:30px;"> <br>
							${ myvo.ci_content }

						</div>
						</div>
						
						<c:if test="${ myvo.ci_ok eq 0 }">
						<div class="row">
						<div class="col-6 offset-4 mt-5">
<!-- 게시글 정보 수정하기 모달 -->
						<button class="btn btn-secondary" data-target="#circleBoardModal" data-toggle="modal">게시글 수정하기</button>
<!-- Modal -->
<form action="${ cp }/circle/MyCircleUpdate2?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="circleBoardModal" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">게시글 정보</h5>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">
					<ul id="dot">
						<li>
							<h6 class="card-title font-weight-bold text-dark">글 제목</h6>
							<p>
								<input type="text" name="ci_title" 
									   value="${ myvo.ci_title }" 
									   style="border:none; width:100%"
								>
							</p>
						</li>
						<li>
							<h6 class="card-title font-weight-bold text-dark">모집 기간</h6>
							<p>
								<input type="date" name="ci_startdate" value="${ myvo.ci_startdate }" autocomplete="off" class="date"><span>부터</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="date" name="ci_enddate" value="${ myvo.ci_enddate }" autocomplete="off" class="date"><span>까지</span>
							</p>
						</li>
						<li>
							<h6 class="card-title font-weight-bold text-dark">상세 내용</h6>
							<div id="memberInfo">
			                    <textarea class="form-control" id="ci_content" name="ci_content" rows="5">
			                    	${ myvo.ci_content }
			                    </textarea>
			                </div>
						</li>
						<li>
							<h6 class="card-title font-weight-bold text-dark">상세 이미지 첨부</h6>
							<p class="card-text">
								<input type="file" name="file2"> <br>
							</p>
						</li>
					</ul>
				
				</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<input type="submit" class="btn btn-primary" value="수정">
				</div>
			</div>
		</div>
	</div>	
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>            	
						</div>
						</div>
						</c:if>
<!-- 신청한 학생 목록 보이기 -->
						</div> <!-- 0. MY  동아리 카드 body 끝 -->
						
						<c:if test="${ myvo.ci_ok eq 1 }">
							<div class="card-footer mt-5" style="text-align: center;">
								<input type="hidden" value="${ myvo.ci_num }" id="ci_num" name="ci_num">
								<input type="button" value="학생목록" id="btnList">
								<div id="here"></div>
							</div>
						</c:if>
						
					
						
					<c:if test="${ myvo.ci_ok eq 20 || myvo.ci_ok eq 30}">
						<div class="card-footer mt-5" style="text-align: center;">
						
<form action="${ cp }/circle/rejectCircleDB?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${ myvo.ci_num }" id="ci_num" name="ci_num">
	<input type="submit" class="btn btn-secondary" value="확인">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
						</div>

					</c:if>					
					
					
			</div>
			</c:forEach><!-- 0. MY 동아리 카드 끝 -->
			</c:if>
				</div>
			</div>
					

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




<!-- ---------------------------------------------------------------------------------------------------------------------- -->
	
<style>
	#dot {
		list-style:none;
		padding-left:5px;
   	}
</style>   
<script type="text/javascript">
//신청한 학생 목록 보여지기 버튼
$(function() {
	$("#btnList").click(function() {
		let ci_num = $(this).prev().val();
		$.ajax({
			url:'${cp}/circle/CircleStudentList',
			data:{"ci_num":ci_num},
			dataType:'json',
			success:function(list) {
				$(list).each(function(i, d) {
					let html = "<table class='table table-hover' style='text-align: center;'>";
					html += "<thead>";
					html += "<tr>";
					html += "<th>이름</th>";
					html += "<th>아이디</th>";
					html += "<th>닉네임</th>";
					html += "<th>학과</th>";
					html += "<th>핸드폰번호</th>";
					html += "<th>이메일</th>";
					html += "</tr>";
					html += "</thead>";
					html += "<tr>";
					html += "<td>"+d.m_name+"</td>";
					html += "<td>"+d.m_id+"</td>";
					html += "<td>"+d.m_nickname+"</td>";
					html += "<td>"+d.m_dept+"</td>";
					html += "<td>"+d.m_phone+"</td>";
					html += "<td>"+d.m_email+"</td>";
					html += "</tr>";
					html += "</table>";
					$("#here").append(html);
				});
			}
		});
	});
});

</script>
