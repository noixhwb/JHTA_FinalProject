<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	
	
	
	
	<div class="container">
		<div class="row">
			<!-- 반복문 -->
			<c:forEach var="vo" items="${list}" varStatus="status">
				<div class="col-lg-4">
				<a href="${pageContext.request.contextPath }/deal/dealdetail?t_num=${vo.t_num}">
					<img src="${pageContext.request.contextPath }/resources/goodsimg/${imglist.get(status.index).GI_FILENAME}" class="img-rounded"  width="300px" height="450px"><br> <span>${vo.t_title }</span><br>
					<span>${vo.t_price}</span><br><br>
				</a>
				</div>
			</c:forEach>
		</div>
		<div>
			<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pageNum }">
						<a href="${cp}/deal/deallist?pageNum=${i}&word=${word}"> <span
							style='color: blue'>${i }</span></a>
					</c:when>
					<c:otherwise>
						<a href="${cp}/deal/deallist?pageNum=${i}&word=${word}"> <span
							style='color: gray'>${i }</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>

		<div>
			<form action="${cp }/deal/deallist" method="get">
				<input type="text" name="word" value="${word}"> <input
					type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }"> <input type="submit" value=검색>
			</form>

		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>