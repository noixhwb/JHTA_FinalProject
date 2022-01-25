<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<c:choose>
	<c:when test="${result=='success' }">
		<h1>게시요청 성공!</h1>
	</c:when>
	<c:otherwise>
		<h1>게시요청 실패!</h1>
	</c:otherwise>
</c:choose>
<a href="${pageContext.request.contextPath }/home">홈</a>
        
<%@ include file="/WEB-INF/views/footer.jsp" %>