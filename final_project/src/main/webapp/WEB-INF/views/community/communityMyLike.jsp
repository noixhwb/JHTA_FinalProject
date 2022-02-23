<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 전체 동아리 목록 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
@font-face {
    font-family: 'GilbeotRainbow';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/GilbeotRainbow.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.h2{

	font-family: 'GilbeotRainbow';
}


</style>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<div id="content-wrapper" class="d-flex flex-column" style="height: 700px;">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> MY 커뮤니티 </h1>
			</div>
			
<!-- Navbar -->

<span class="h2">내가 게시한 커뮤니티 </span>
<br> <c:if test="${ mlist == null}">
						 
					<br> 	<div class="container">게시요청한 동아리 없음</div>
						
						</c:if>
						
						<c:if test= "${ mlist != null}" >
							
						<div class="container">

<!-- Approach -->
				
				 <div class="card shadow mb-3" >
				
					 <div class="card-header py-2">
						 <div class="row g-0"> 
							
							<img class="rounded-circle" src="${ cp }/resources/comm/${ mlist.cu_coverimg }" style="width:70px; height:70px;">
							<div style="font-size: 20px; font-weight: 700;">${ mlist.cu_name }  <br> <span style="font-size: 15px; font-weight: 200;"> ${ mlist.cu_intro }</span><br> ❤${ mlist.cu_recommend }	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 12px; font-weight: 200;"> ${ mlist.cu_category }	</span><br> <span style="font-size: 16px; font-weight: 200;">공지 >  ${ mlist.cu_notice }	</span> 	</div> 
						
				</div>  
						<br>  <a class="a1" href="${cp }/community/updateform?cu_num=${mlist.cu_num}"> 커뮤니티 소개글/공지사항 변경</a> &nbsp&nbsp
																				<!-- 	<button class="btn btn-secondary">커뮤니티 삭제</button>		 -->									
						<div>							
								</div> 												
					</div> 
				</div> <!-- n번 동아리 끝 --> 
			</div>
					<br>
									
<!-- Modal -->
<form action="${ cp }/community/update?${_csrf.parameterName }=${_csrf.token }" method="post" >
	<div class="modal fade" id="circleInfoModal" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">커뮤니티정보</h5>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">
					<ul id="dot">
						<li style="text-align:center;">
							<img src="${ cp }/resources/comm/${ mlist.cu_coverimg }" 
							 	 style="width:80px; height:80px;">
							<input type="text" name="cu_name"
								   style="border:none; font-size: 20px; font-weight: 700;" 
								   value="${ mlist.cu_name }">
						</li>
						<li>
							<!-- ${ myvo.ci_category } -->
							<h6 class="card-title font-weight-bold text-dark">커뮤니티 공지</h6>
							<input type="text" value="${ mlist.cu_notice }">
						</li>
						<li>
							<!-- ${ myvo.ci_name } -->
							<h6 class="card-title font-weight-bold text-dark">커뮤니티 소개글</h6>
								<input type="text" value="${ mlist.cu_intro }">
						</li>
						<li>
							
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
								
							
						
						
						
						</c:if>
						
						
						
						
					
						
				
				<!--  blist   게시글      clist   가입한 커뮤니티 리스트    mlist 내가 게시한 커뮤니티인지 아닌지-->				
			<span class="h2">내가쓴 게시글</span>
			<br>	<div>	
		
				
				</div>
				<div class="container">
			<table class="table table-hover">
				<thead>	
					<tr>
					
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>삭제</th>
			</tr>
			</thead>
			
						
						<c:forEach var="vo" items="${ blist }">
						
						<tr>
						
						<td>${vo.b_num}</td>
						<td><a href="${ cp }/board/boarddetail?b_num=${ vo.b_num }">${vo.b_title }</a></td>
						<td>${vo.b_regdate }</td>
						<td>${vo.b_recommend }</td>
						<td><a href="${cp }/community/removeBoard?b_num=${vo.b_num}">삭제</a></td>
						
						</tr>
					
						
						</c:forEach>
						
					
					
			</table>
				
	
						</div>
				
				
				
				
			<span class="h2">즐겨찾기한 커뮤니티</span>
			
			<br>
							
						<c:forEach var="vo" items="${ clist }">
				
				<!--  blist   게시글      clist   가입한 커뮤니티 리스트    mlist 내가 게시한 커뮤니티인지 아닌지-->				
			
			<div class="container">

<!-- Approach --><div class="table table-hover" style=" cursor: pointer;" onclick="location.href='${ cp }/community/communitydetail?cu_num=${ vo.cu_num }' ;">
				
				 <div class="card shadow mb-3" >
				
					 <div class="card-header py-2">
						 <div class="row g-0"> 
							
							<img class="rounded-circle" src="${ cp }/resources/comm/${ vo.cu_coverimg }" style="width:70px; height:70px;">
							<div style="font-size: 20px; font-weight: 700;">${ vo.cu_name }  <br> <span style="font-size: 15px; font-weight: 200;"> ${ vo.cu_intro }</span><br> ❤${ vo.cu_recommend }	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 12px; font-weight: 200;"> ${ vo.cu_category }	</span> 	</div> 
						 
				</div>  
																															
						<div>							
								</div> 												
					</div> 
				</div> <!-- n번 동아리 끝 --> 
			</div>
			
				</div>
				
				
				
			</c:forEach>
			
			
<!-- Approach -->
		


						
					
					



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
	
<style>
#dot{
   list-style:none;
   padding-left:5px;
   }
</style>       
