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
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> MY 동아리 </h1>
			</div>
			 
<!-- Navi -->			 
			<ul class="nav nav-tabs justify-content-center">
			  <li class="nav-item">
			    <a class="nav-link" href="${ cp }/circle/MyCircleList">신청한 동아리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="${ cp }/circle/MyCircleLike">좋아요한 동아리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="${ cp }/circle/MyCircle">동아리 관리</a>
			  </li>
			</ul>

<!-- Approach -->
			<!-- 0. MY 동아리 카드 -->
			<div class="row">
				<div class="col-8 offset-2 mt-4 mb-5">
			<c:if test="${ not empty mylist }">
			<div class="card shadow mb-3">
				<div class="col-md-12">
					<div class="card-body">
						
						<c:forEach var="myvo" items="${ mylist }">
						<!-- 동아리정보 -->
						<img src="${ cp }/resources/images/circle/${ myvo.ci_logofile }" 
							 style="width:80px; height:80px;">
						<h5 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ myvo.ci_name } </h5>
						카테고리 : ${ myvo.ci_category }<br>
						모집인원 : ${ myvo.ci_person }<br>		
						<br> <hr width="100%" color="#C0C0C0" noshade /> <br> <!-- 구분선 -->
						${ myvo.ci_title } <br>
						${ myvo.ci_startdate }~${ myvo.ci_enddate } <br>
						${ myvo.ci_content }
						
						<br>
<!-- Button trigger modal -->
						<button class="btn btn-secondary" data-target="#circleInfoModal" data-toggle="modal">동아리 정보 수정하기</button>
<!-- 동아리 정보 수정하기 모달 -->
<!-- Modal -->
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
								   style="border:none;" 
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
					</ul>
				</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<a class="btn btn-primary" href="${ cp }/circle/MyCircleUpdate1">수정</a>
				</div>
			</div>
		</div>
	</div>

<!-- Button trigger modal -->
						<button class="btn btn-secondary" data-target="#circleBoardModal" data-toggle="modal">게시글 수정하기</button>
<!-- 게시글 정보 수정하기 모달 -->
<!-- Modal -->
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
								<input type="date" name="ci_startdate" autocomplete="off" class="date"><span>부터</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="date" name="ci_enddate" autocomplete="off" class="date"><span>까지</span>
							</p>
						</li>
						<li>
							<h6 class="card-title font-weight-bold text-dark">상세 내용</h6>
							<div id="memberInfo">
			                    <textarea class="form-control" id="ci_content" rows="5">
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
					<a class="btn btn-primary" href="${ cp }/circle/MyCircleUpdate2">수정</a>
				</div>
			</div>
		</div>
	</div>	            	
	
						</c:forEach>	
					</div> <!-- 0. MY  동아리 카드 body 끝 -->
				</div>
			</div><!-- 0. MY 동아리 카드 끝 -->
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