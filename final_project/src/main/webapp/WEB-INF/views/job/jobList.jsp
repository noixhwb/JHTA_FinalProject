<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ include file="/WEB-INF/views/header.jsp" %>

<table border="1" width="1000px">
	<tr>
		<th>공고번호</th>
		<th>회사명</th>
		<th>공고제목</th>
		<th>채용시작일</th>
		<th>채용마감일</th>
		<th>조회수</th>
		<th>삭제</th>
		<th>수정</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.j_num }</td>
			<td>${vo.j_company }</td>
			<td><a href="${cp}/job/detail?j_num=${vo.j_num}">${vo.j_subject }</a></td>
			<td>${vo.j_startdate}</td>
			<td>${vo.j_enddate }</td>
			<td>${vo.j_view }</td>
			<td><a href="${cp }/job/delete?j_num=${vo.j_num }">삭제</a></td>
			<td><a href="${cp }/job/update?j_num=${vo.j_num }">수정</a></td>
		</tr>
	</c:forEach>
</table>	
 
<%@ include file="/WEB-INF/views/footer.jsp" %>