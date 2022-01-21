<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>result.jsp</title>
</head>
<body>
	<c:set var="cp" value="${ pageContext.request.contextPath }"/>
	<h1>응답결과</h1>
	<c:choose>
		<c:when test="${ result == 'success' }">
			<h2>성공적으로 응답!</h2>
		</c:when>
		<c:otherwise>
			<h2>응답 실패..</h2>
		</c:otherwise>
	</c:choose>
	<a href="${ cp }/">홈으로 돌아가기</a> <br>
	<a href="${ cp }/list">글목록 보기</a>
</body>
</html>