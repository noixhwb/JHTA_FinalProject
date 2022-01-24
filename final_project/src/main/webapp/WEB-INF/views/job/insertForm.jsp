<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	직무 <input type="text" id="j_duty" name="j_duty"><br>
	지역 <input type="text" id="j_region" name="j_region"><br>
	경력 <input type="text" id="j_career" name="j_career"><br>
	공고URL <input type="text" id="j_rul" name="j_rul"><br>
	기업사진 <input type="text" id="j_img" name="j_img"><br>
	첨부파일<br>
	<input type="file" name="file1"><br>
	<input type="submit" value="신청하기">
</form>
</body>
</html>