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
			<table class="table table-hover" id="dealtb">
				<!-- On rows -->
				<tr class="active">
					<th style="width: 55%">제목</th>
					<th style="width: 15%">거래단계</th>
					<th style="width: 15%">배송등록</th>
					<th style="width: 15%">환불승인</th>
				</tr>

				<c:forEach var="dv" items="${dvo }">
					<tr class="info">
						<td class="align-middle">${dv.t_title}</td>
						<td class="align-middle">${dv.t_processing }</td>
						<td class="align-middle"><button type="button"
								class="btn btn-primary btn-sm" data-toggle="modal"
								data-target="#myModal" data-tnum=${dv.t_num }>배송정보등록</button></td>

						<td class="align-middle"></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div>
			<table class="table table-hover d-none" id="purchasetb">
				<!-- On rows -->
				<tr class="active">
					<th style="width: 55%">제목</th>
					<th style="width: 15%">거래단계</th>
					<th style="width: 15%">배송조회</th>
					<th style="width: 15%">환불요청</th>
				</tr>

				<c:forEach var="pv" items="${pvo }">
					<tr class="info">
						<td class="align-middle">${pv.t_title}</td>
						<td class="align-middle">${pv.t_processing }</td>
						<td class="align-middle"><a
							href="https://tracker.delivery/#/${pv.t_shipping }/${pv.t_invoice}"	target="_blank">배송조회</a></td>
						<td class="align-middle">환불요청</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>


	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-body">
					<div class="dropdown">
						<button class="btn btn-default dropdown-toggle" type="button"
							id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
							택배사선택</button>
						<ul class="dropdown-menu" role="menu" id="menu1"
							aria-labelledby="dropdownMenu1">
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">천일택배</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">CJ대한통운</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">CU편의점택배</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">대신택배</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">우체국택배</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">한진택배</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">일양로지스</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">경동택배</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">로젠택배</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">롯데택배</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">GSPostbox택배</a></li>
						</ul>
						<input type="text" class="form-control" id="shipping_num"
							placeholder="송장번호을 입력하세요">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="closeship">닫기</button>
					<button type="button" class="btn btn-primary" id="saveship">저장</button>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<script type="text/javascript">
		var t_num = "";
		var t_shipping = "";

		$('#myModal').on('show.bs.modal', function(event) {
			t_num = $(event.relatedTarget).data('tnum');
		});

		$("#menu1 li").on("click", function() {
			$("#dropdownMenu1").text($(this).text());
			t_shipping = $(this).text();
		})

		$("#saveship").on("click", function() {
			$("#dropdownMenu1").text("");
		})

		$("#saveship").click(
				function() {
					alert(t_shipping);
					$.ajax({
						url : "${pageContext.request.contextPath}/deal/ship",
						type : 'POST',
						data : {
							"t_shipping" : t_shipping,
							"t_invoice" : $("#shipping_num").val(),
							"t_num" : t_num
						},
						dataType : "json",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function() {

						}
					})
					$('#myModal').modal("hide");
				})

		$("#psul li a").click(function() {
			if ($(this).text() == "구매") {
				$("#purchasetb").attr("class", "table table-hover");
				$("#dealtb").attr("class", "table table-hover d-none");
			} else {
				$("#purchasetb").attr("class", "table table-hover d-none");
				$("#dealtb").attr("class", "table table-hover");
			}
		});
	</script>
</body>
</html>