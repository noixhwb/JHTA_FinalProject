<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="container-fluid">
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 장터관리 </h1>
			</div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light color-white">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- (1) Navbar 왼쪽 -->
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav" id="psul">
				<li class="nav-item"><a class="nav-link" href="#">판매</a></li>
				<li class="nav-item"><a class="nav-link" href="#">구매</a></li>
			</ul>
		</div>
		<!-- (1) Navbar 왼쪽 끝 -->


	</nav>

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
					<td class="align-middle"><a
						href="${ pageContext.request.contextPath}/deal/dealdetail?t_num=${dv.t_num}">${dv.t_title}</a></td>
					<td class="align-middle">${dv.t_processing }</td>
					<c:choose>
						<c:when test="${dv.t_processing eq '결제완료' }">
							<td class="align-middle"><button type="button"
									id="appendship" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#myModal"
									data-tnum=${dv.t_num }>배송정보등록</button></td>
						</c:when>
						<c:otherwise>
							<td class="align-middle"></td>
						</c:otherwise>
					</c:choose>
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
					<td class="align-middle"><a
						href="${ pageContext.request.contextPath}/deal/dealdetail?t_num=${pv.t_num}">${pv.t_title}</a></td>
					<td class="align-middle">${pv.t_processing }</td>
					<td class="align-middle"><a
						href="https://tracker.delivery/#/${pv.t_shipping }/${pv.t_invoice}"
						target="_blank">배송조회</a></td>
					<c:choose>
						<c:when test="${pv.t_processing eq '결제완료' }">
							<td class="align-middle"><a
								href="${pageContext.request.contextPath}/deal/refund?t_num=${pv.t_num}">환불요청</a></td>
						</c:when>
						<c:otherwise>
							<td class="align-middle"></td>
						</c:otherwise>
					</c:choose>

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

	$("#saveship").click(function() {
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
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
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
