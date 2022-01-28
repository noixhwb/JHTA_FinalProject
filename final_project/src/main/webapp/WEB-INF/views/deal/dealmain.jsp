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
	<div class="container">
		<div class="row">
			<!-- 반복문 -->
			<c:forEach var="vo" items="${list}">
				<div class="col-lg-4">
					<img src="." class="img-rounded"><br> <span>${vo.t_name }</span><br>
					<span>${vo.t_price}</span>
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
			<form action="${cp }/deal/deallist" method="post">
				<input type="text" name="word" value="${word}"> <input
					type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }"> <input type="submit" value=검색>
			</form>

		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>