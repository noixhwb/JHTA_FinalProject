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
		<!-- pvo구매자 정보 svo판매자 정보 dvo상품정보 imglist이미지 정보 -->
	</nav>
	<div class="container">
		<label class="control-label">제품정보</label>
		<div>
			<table class="table table-hover" id="dealtb">
				<!-- On rows -->
				<tr class="active">
					<th style="width: 25%">상품이미지</th>
					<th style="width: 30%">상품명</th>
					<th style="width: 15%">판매자</th>
					<th style="width: 15%">배송비</th>
					<th style="width: 15%">상품금액</th>
				</tr>
				<tr class="info">
					<td class="align-middle">
						<div class="media">
							<img class="align-self-center mr-3"
								src="${pageContext.request.contextPath }/resources/goodsimg/${imglist.get(0).GI_FILENAME}"
								width="125px" width="125px">
						</div>
					</td>
					<td class="align-middle">${dvo.t_name }</td>
					<td class="align-middle">${svo.m_nickname }</td>
					<td class="align-middle"><div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" id="bs_button" aria-expanded="false">선택</button>
							<ul class="dropdown-menu" role="menu" id="bs_list">
								<li><a href="#">착불</a></li>
								<li><a href="#">선불</a></li>
							</ul>
						</div></td>
					<td class="align-middle">${dvo.t_price}원</td>
				</tr>
			</table>
		</div>
		<hr style="border: dashed 1px #D5D5D5;">
		<label class="control-label">배송지 정보</label>
		<div class="checkbox float-right">
			<label> <input type="checkbox" id="addinfo"> 주문자와 일치
			</label>
		</div>
		<div>
			
				<div class="form-group">
					<label for="name">수령인</label> <input type="text"
						class="form-control" id="name" name="pi_name"
						placeholder="받으시는 분의 이름을 입력하세요">
				</div>
				<div class="form-group">
					<label for="phone">연락처</label> <input type="text"
						class="form-control" id="phone" name="pi_phone"
						placeholder="연락처을 입력하세요">
				</div>
				<div class="form-group">
					<label for="addr">주소</label> <input type="text"
						class="form-control" id="addr" name="pi_address"
						placeholder="주소을 입력하세요">
				</div>
				<div class="form-group">
					<label for="request">요청사항</label>
					<textarea class="form-control" rows="5" name="request"
						id="request1" style="resize: none" placeholder="요청사항을 입력하세요"></textarea>
				</div>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				
				<input type="hidden" value="${dvo.t_num }" name="t_num"> <input
					type="hidden" value="${pvo.m_num }" name="m_num"> <input
					type="hidden" value="" name="dfee" id="dfee">
				<button type="button" id="kakaoapi" class="btn btn-primary btn-lg ">즉시결제</button>
				
			
			
		</div>

	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<script type="text/javascript">
		$(function() {
			//주문자와 일치
			$("#addinfo").on("click", function() {
				var checked = $("#addinfo").is(':checked');
				if (checked) {
					$("#name").val("${pvo.m_name }");
					$("#addr").val("${pvo.m_address }");
					$("#phone").val("${pvo.m_phone }");
				} else {
					$("#name").val("");
					$("#addr").val("");
					$("#phone").val("");
				}
			})
			//배송비 선택
			$("#bs_list li").on("click", function() {
				$("#bs_button").html($(this).text());
				$("#dfee").val($(this).text());
			})
			
			$("#kakaoapi").on("click", function() {
					if ($("#bs_button").html() == "선택") {
						alert("배송비 지불 방법을 선택해주세요");
						$('#bs_button').focus();
						return false;
					}

					if ($("#name").val() == "") {
						alert("수령인을 입력해주세요");
						$('#name').focus();
						return false;
					}

					if ($("#phone").val() == "") {
						alert("연락처을 입력해주세요");
						$('#phone').focus();
						return false;
					}

					if ($("#addr").val() == "") {
						alert("주소을 입력해주세요");
						$('#addr').focus();
						return false;
					}
					
				$.ajax({
					url : "${pageContext.request.contextPath}/deal/purchase1",
					type : 'POST',
					dataType : "json",

					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(data) {
						
						$.ajax({
							url : "${pageContext.request.contextPath}/deal/regist",
							type : 'POST',
							dataType : "json",
							data:{pi_address:$("#addr").val(),pi_phone:$('#phone').val(),pi_name:$("#name").val(),request1:$("#request1").text()},
							beforeSend : function(xhr) {
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							}
						})
						
						location.href= data.next_redirect_pc_url;
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			})

		})
	</script>
</body>
</html>