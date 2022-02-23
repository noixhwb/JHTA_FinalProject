<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp" %>



<div >
<h1>환영합니다!</h1>

<a href="${pageContext.request.contextPath }/login">로그인</a>
<a href="${pageContext.request.contextPath }/home">홈</a>

</div>






<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>