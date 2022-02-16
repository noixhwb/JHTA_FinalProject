<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%@ include file="/WEB-INF/views/header.jsp"%>
	<%@ include file="/WEB-INF/views/top.jsp"%>
	
	
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
