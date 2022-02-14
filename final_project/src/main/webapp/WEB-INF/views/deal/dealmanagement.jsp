<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

		<h4>3조대학교 캠퍼스픽</h4>

		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">

			<div class="topbar-divider d-none d-sm-block"></div>

			<!-- Nav Item - User Information -->
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span
					class="mr-2 d-none d-lg-inline text-gray-600 small">홍길동님</span> <img
					class="img-profile rounded-circle"
					src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg">
			</a> <!-- Dropdown - User Information -->
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
					</a> <a class="dropdown-item" href="#"> <i
						class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 수정
					</a> <a class="dropdown-item" href="#"> <i
						class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 활동기록
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal"> <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						로그아웃
					</a>
				</div></li>
		</ul>
	</nav>

	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav" id="psul">
				<li class="nav-item"><a class="nav-link" href="#">판매</a></li>
				<li class="nav-item"><a class="nav-link" href="#">구매</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		
		<div>
		<label class="control-label">판매정보</label>
			<table class="table table-hover" id="dealtb">
				<!-- On rows -->
				<tr class="active">
					<th style="width: 55%">제목</th>
					<th style="width: 15%">거래단계</th>
					<th style="width: 15%">배송등록</th>
					<th style="width: 15%">삭제</th>
				</tr>

				<c:forEach var="deal" items="${dvo }">
					<tr class="info">
						<td class="align-middle">${deal.t_title}</td>
						<td class="align-middle">${deal.t_processing }</td>
						<td class="align-middle"><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">배송정보등록
</button></td>
						
						<td class="align-middle"><a href="https://tracker.delivery/#/kr.epost/1111111111111" target="_blank">aa</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div style="display:none">
		<label class="control-label">구매정보</label>
			<table class="table table-hover d-none" id="purchasetb" >
				<!-- On rows -->
				<tr class="active">
					<th style="width: 55%">제목</th>
					<th style="width: 15%">거래단계</th>
					<th style="width: 15%">배송조회</th>
					<th style="width: 15%">삭제</th>
				</tr>

				<c:forEach var="deal" items="${dvo }">
					<tr class="info">
						<td class="align-middle">${deal.t_title}</td>
						<td class="align-middle">${deal.t_processing }</td>
						<td class="align-middle"><a href="https://tracker.delivery/#/kr.epost/1111111111111" target="_blank">배송조회</a></td>
						<td class="align-middle">삭제</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>


<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>


	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<script type="text/javascript">
		$("#psul li a").click(function(){
			if($(this).text()=="구매"){
				$("#purchasetb").attr("class","table table-hover");
				$("#dealtb").attr("class","table table-hover d-none");
			}else{
				$("#purchasetb").attr("class","table table-hover d-none");
				$("#dealtb").attr("class","table table-hover");
			}
		});
	</script>
</body>
</html>