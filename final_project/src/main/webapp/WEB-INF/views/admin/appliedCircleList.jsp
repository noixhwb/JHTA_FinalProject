<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!-- 회원관리 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
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
				<h1 class="h3 mb-0 text-gray-800"> 게시요청 페이지 </h1>
			</div>
<!-- Navi -->	
		 
			<ul class="nav nav-tabs justify-content-center  mb-10">
				<li class="nav-item">
					<a class="nav-link" href="${ cp }/admin/appliedCommuList">커뮤니티 게시요청</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="${ cp }/admin/appliedCircleList">동아리 게시요청</a>
				</li>
			</ul>
<!-- ------------------------------------------------------------ -->	

<!-- Approach -->
			<!-- 동아리 상세정보 카드 -->
			<div class="row">
				<div class="col-6 offset-3">
			<div class="card shadow mb-4 mt-4">

				<div class="card-body">
				<table class="table table-hover" style="text-align: center;">
					<thead>
					<tr>
						<th scope="col">번호</th>
				    	<th scope="col">동아리</th>
				    	<th scope="col">요청자</th>
				    	<th scope="col">승인여부</th> <!-- approve, reject -->
				    </tr>
					</thead>
					<c:forEach var="vo" items="${ appliedcirclelist }">
					<tr>
						<th scope="row" class="align-middle">${ vo.ci_num }</th>
						<td class="align-middle">
							<button class="btn btn-white" data-target="#circleInfoModal${vo.ci_num }" data-toggle="modal">${ vo.ci_name }</button>
<!-- Modal -->
<div class="modal fade" id="circleInfoModal${ vo.ci_num }" tabindex="-1" role="dialog"
	 aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">동아리 게시 정보</h5>
				<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			
			<div class="modal-body">
				<ul id="dot">
					<!-- 동아리 정보 -->
					<li style="text-align:center;">
						<img src="${ cp }/resources/images/circle/${ vo.ci_logofile }" 
						 	 style="width:80px; height:80px;"
						 	 id="imgsize">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="ci_name"
							   style="border:none; width:50px;" 
							   value="${ vo.ci_name }"
							   readonly="readonly">
					</li>
				</ul>
				<div class="row">
					<div class="col-8 offset-2">
					<table class="table" style="width:300px;">
						<tr>
							<th>동아리 분야</th>
							<td>${ vo.ci_category }</td>
						</tr>
						<tr>
							<th>동아리 규모</th>
							<td>${ vo.ci_person }</td>
						</tr>
						<tr>
							<th>동아리 분야</th>
							<td>${ vo.ci_category }</td>
						</tr>
					</table>
					</div>
				</div>
				
				<hr>
				
				<div class="row">
					<div class="col-8 offset-1">
					<table style="width:400px;">
						<tr>
							<th>글 제목</th>
							<td>${ vo.ci_title }</td>
						</tr>
						<tr>
							<th>모집 기간</th>
							<td>${ vo.ci_startdate } ~ ${ vo.ci_enddate }</td>
						</tr>
						<tr>
							<th>상세 내용</th>
							<td>${ vo.ci_content }</td>
						</tr>
						<tr>
							<th>첨부 이미지</th>
							<td>
								<img src="${ cp }/resources/images/circle/${ vo.ci_imgfile }" 
							 	 style="width:200px;"
							 	 id="imgsize">
							</td>
						</tr>
					</table>
					</div>
				</div>
			</div>
				
		</div>
	</div>
</div>
<!-- End Modal -->
						</td>
						<td class="align-middle">
						<button class="btn btn-white" data-target="#userInfoModal${vo.ci_num }" data-toggle="modal">${ vo.m_id }</button>
<!-- Modal -->
<div class="modal fade" id="userInfoModal${ vo.ci_num }" tabindex="-1" role="dialog"
	 aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">회원 정보</h5>
				<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			
			<div class="modal-body">
				<div class="row">
					<div class="col-8 offset-2">
					<table class="table" style="width:300px;">
						<tr>
							<th>이름</th>
							<td>${ vo.m_name }</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>${ vo.m_nickname }</td>
						</tr>
						<tr>
							<th>학과</th>
							<td>${ vo.m_dept }</td>
						</tr>
						<tr>
							<th>핸드폰번호</th>
							<td>${ vo.m_phone}</td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<td>${ vo.m_email }</td>
						</tr>
					</table>
					</div>
				</div>
			</div>
				
		</div>
	</div>
</div>
						</td>
						<td>
<div class="row">
	<div class="col-sm-4 offset-sm-1">
							<button class="btn btn-primary" data-target="#approveModal" data-toggle="modal">승인</button>
<!-- Modal -->
<form action="${ cp }/admin/confirmCircle?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="approveModal" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title" id="exampleModalLabel">게시요청 확인</h6>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">
					<input type="hidden" value="${ vo.ci_num }" id="ci_num" name="ci_num">
					<h5>해당 동아리를 승인하시겠습니까? </h5>
				</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<input type="submit" class="btn btn-primary" value="승인하기">
				</div>
			</div>
		</div>
	</div>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
	</div>
	<div class="col-sm-4 offset-sm-1">
							<button class="btn btn-danger" data-target="#rejectModal" data-toggle="modal">거절</button>
<!-- Modal -->
<form action="${ cp }/admin/rejectCircle?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="rejectModal" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title" id="exampleModalLabel">게시요청 확인</h6>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">
					<input type="hidden" value="${ vo.ci_num }" id="ci_num" name="ci_num">
					<h5>해당 동아리를 거절하시겠습니까? </h5>
					<small style="color: red;">사유를 선택해주세요</small> 
						 <div style="margin-top:15px;">
							<input type="radio" name="ci_ok" value="20">부적절한 게시 의도
							<input type="radio" name="ci_ok" value="30">영리 목적의 게시요청
						 </div>
				</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<input type="submit" class="btn btn-primary" value="거절하기">
				</div>
			</div>
		</div>
	</div>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">

</form>
	</div>
</div>
						</td>
					</tr>
					</c:forEach>
				</table>
				</div>
				
			</div>
				</div>
			</div>

		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝 -->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	
<!-- @@@@@@ 페이징처리 @@@@@@-->


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->


<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<script>
$(function() {
		$("#approve").click(function() {
			var ci_num = $("#ci_num").val();
			alert("동번호"+ci_num);
			$.ajax({
				url:'${cp}/admin/confirmCircle/'+ci_num,
				data:{"ci_num":ci_num},
				dataType:'json', 
				success:function(data){ 
					if(data.result==true) {
						alert(ci_num);
						alert("승인완료!");
					}else {
						alert("에러지롱");
					}
				}
			});
		});
	});
	
	function reject(j_num) {
		$.ajax({
			url:'${cp}/admin/rejectCircle?ci_num=' + ci_num, 
			dataType:'json', 
			success:function(data){ 
				if(data.result==true) {
					alert("거절완료!");
				}else {
					alert("에러지롱");
				}
			}
		});
	};
</script>
<style>
#dot{
   list-style:none;
   padding-left:5px;
   }
#imgsize{
		cursor: pointer;
	    background-position: center center;
		background-size: cover;
	}
</style>       


