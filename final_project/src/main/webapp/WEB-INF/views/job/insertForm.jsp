<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
	/*		let checkedCnt=0;
			$("input[name='skill']").each(function() {
				if($(this).prop("chekced")){
					checkedCnt++;
				}
			}); */
			let checkedCnt=$("input:checked").length; // 체크된 요소 갯수 구하기
			if(checkedCnt<1){
				alert("보유기술은 1개 이상 선택하시오");
				return false;
			};
			
			// 첫번째방식
	/*		if(checkedCnt<1){
				alert("보유기술은 1개 이상 선택하시오");
				return false;
			} */
			e.preventDefault();
		});
	});
</script>
<h2>채용공고 신청서</h2>
<form method="post" action="${cp}/job/insert" enctype="multipart/form-data">

	기업명 <input type="text" name="j_company"><br>
	공고명 <input type="text" name="j_subject"><br>
	채용시작날짜 <input type="date" name="j_startdate"><br>
	채용마감날짜 <input type="date" name="j_enddate"><br>
	
	<fieldset style="width:300px">
		<legend>직무</legend>
			<c:forEach items="${fn:split('영업·영업관리|전략·기획|마케팅·광고·홍보|회계·재무|인사·노무|유통·물류|IT·SW|연구개발·설계|생산·생산관리|건축·인테리어|토목·환경|의료·보건|교육|미디어|디자인|기타','|') }"
						var="duty">
	    		<label><input type="checkbox" name="jd_duty">${duty }</label>
	    	</c:forEach>
	    	<input type="reset" value="초기화">
    </fieldset><br>
    
    <fieldset style="width:300px">
    	<legend>지역</legend>
			<c:forEach items="${fn:split('서울|경기|광주|대구|대전|부산|세종|울산|인천|강원|경남|경북|전남|전북|충남|충북|제주|해외|기타','|') }"
						var="zone">
	    		<label><input type="checkbox" name="jz_zone">${zone }</label>
	    	</c:forEach>
	    	<input type="reset" value="초기화">
    </fieldset><br>
    
    <fieldset style="width:300px">
    	<legend>경력</legend>
			<c:forEach items="${fn:split('신입|경력','|') }" var="career">
	    		<label><input type="checkbox" name="jc_career">${career }</label>
	    	</c:forEach>
	    	<input type="reset" value="초기화">
    </fieldset><br>
    
	공고URL <input type="text" name="j_url"><br>
	기업이미지 첨부
	<input type="file" name="file1"><br>
	공고이미지 첨부
	<input type="file" name="file2"><br>
	<input type="submit" value="신청하기">
</form>
       
<%@ include file="/WEB-INF/views/footer.jsp" %>