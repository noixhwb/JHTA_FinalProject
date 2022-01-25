<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>채용공고 신청서</h1>
<form method="post" action="${cp}/job/insert" enctype="multipart/form-data">

	기업명 <input type="text" id="j_companny" name="j_companny"><br>
	공고명 <input type="text" id="j_subject" name="j_subject"><br>
	채용시작날짜 <input type="date" id="j_startdate" name="j_startdate"><br>
	채용마감날짜 <input type="date" id="j_enddate" name="j_enddate"><br>
	<p>직무<br>
		<c:forEach items="${fn:split('영업·영업관리|전략·기획|마케팅·광고·홍보|회계·재무|인사·노무|유통·물류|IT·SW|연구개발·설계|생산·생산관리|건축·인테리어|토목·환경|의료·보건|교육|미디어|디자인|기타','|') }"
					var="duty">
    		<label><input type="checkbox" id="j_duty" name="j_duty">${duty }</label><br>
    	</c:forEach>
    	<input type="reset" value="초기화">
    </p>
    <p>지역<br>
		<c:forEach items="${fn:split('서울|경기|광주|대구|대전|부산|세종|울산|인천|강원|경남|경북|전남|전북|충남|충북|제주|해외|기타','|') }"
					var="zone">
    		<label><input type="checkbox" id="j_zone" name="j_zone">${zone }</label><br>
    	</c:forEach>
    	<input type="reset" value="초기화">
    </p>
    <p>경력<br>
		<c:forEach items="${fn:split('신입|경력','|') }" var="career">
    		<label><input type="checkbox" id="j_career" name="j_career">${career }</label><br>
    	</c:forEach>
    	<input type="reset" value="초기화">
    </p>
	
	공고URL <input type="text" id="j_url" name="j_url"><br>
	기업이미지 첨부<br>
	<input type="file" name="file1"><br>
	공고이미지 첨부<br>
	<input type="file" name="file2"><br>
	<input type="submit" value="신청하기">
</form>
</body>
</html>