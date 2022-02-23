<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 디데이 계산을 위한 import -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<style>
	.companyimg{width:200px; height: 200px; display:inline-block; }
	#companyTopInfo {
		margin-top: 50px;
	}
	#infoimg, #companyimg{
		margin: 0 auto;
	    max-width: 100%;
	    height: auto;
	}
	#showDday{
    	float: left;
	    margin-right: 4px;
	    padding: 0 8px;
	    line-height: 20px;
	    border-radius: 10px;
	    color: #fff;
	    font-size: 12px;
	    font-weight: bold;
	    background-color: #1dcdff;
	}
	#delete{
    	background-color: #F15F5F; font-size: 12px;
    }
</style>
<script>
	// 북마크 on/off
	function bookMark(num) {
		var j_num=num;
		var test1 = document.getElementById("mark"+j_num);
		if(test1.style.color == ''){
			let xhr=new XMLHttpRequest();
			test1.style.removeProperty("color");
			test1.style.cssText='color:#4e73df';
			test1.className = 'fa-solid fa-bookmark';
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let data=xhr.responseText;
					let json=JSON.parse(data);
					if(json.result==true) {
						alert("스크랩 추가성공");
					}else {
						alert("실패");
					}
				}
			}
			xhr.open('get','${cp}/job/scrapInsert?j_num=' + j_num ,true);
			xhr.send();
		}else{
			let xhr=new XMLHttpRequest();
			test1.style.removeProperty("color");
			test1.className = 'fa-regular fa-bookmark';
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let data=xhr.responseText;
					let json=JSON.parse(data);
					if(json.result==true) {
						alert("스크랩 취소성공");
					}else {
						alert("실패");
					}
				}
			}
			xhr.open('get','${cp}/job/scrapDelete?j_num=' + j_num ,true);
			xhr.send();
		}
	}
	// 관리자 삭제버튼
	function remove(j_num) {
		if (confirm("삭제하시겠습니까?") == true){    //확인
			$.ajax({
				url:'${cp}/job/remove?j_num=' + j_num,
				dataType:'json', 
				success:function(data){ 
					if(data.result==true) {
						alert("삭제 완료");
						location.href="${cp}/job/jobList";
					}else {
						alert("에러지롱");
						location.reload();
					}
				}
			});
		 }else{   //취소
		     return false;
		 }
	};
</script>
<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->
		<div class="row">
				<div class="col-6 offset-3">
<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- 1. 상단부분 -->
			<div class="card shadow mb-4">
				<div class="card-body">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="${cp }/resources/upload/${jv.j_img }" class="companyimg">
						</div>
						<div class="col-md-8" id="companyTopInfo">
							<p style="font-size: 18px; font-weight: bold; color:#292929;">${jv.j_company }</p>
							<h6 style="color:#4c4c4c;">${jv.j_subject }</h6>
							<span id="viewCount"><i class="fa-solid fa-eye text-gray-400"></i> ${jv.j_view} 
							</span>	
						</div>
					</div>	
				</div>
			</div> <!-- 1.  카드 끝 -->
		
<!-- Approach -->

			<div class="card shadow mb-4">
				
				<div class="card-body">
						
					<!-- (1) 공고 상세정보	 -->
					<div class="card mb-3">
						<div class="col-md-12">
							<div class="card-body">
							
								<h6 class="card-title font-weight-bold text-dark">접수 기간
								</h6>
								<div class="section">
									<!-- 현재날짜 -->
									<c:set var="today" value="<%=new java.util.Date()%>" />
									<c:set var="end" value="${jv.j_enddate}" />
									<!-- Date format 'yyyy/MM/dd' -->
									<c:set var="date">
									<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
									</c:set>
									<c:set var="enddate">
										<fmt:formatDate value="${end}" pattern="yyyy-MM-dd" />
									</c:set>
									
									<!-- String >> Date 형 변환 -->
									<fmt:parseDate var="endPlanDate" value="${enddate }" pattern="yyyy-MM-dd" />
																									
									<!-- 숫자로 변환 -->
									<fmt:parseNumber var="today" value="${today.time / (1000*60*60*24)}" integerOnly="true" />
									<fmt:parseNumber var="endTime" value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true"/>
									<c:if test="${endTime eq today }">
										<span id="showDday">D -DAY</span>
									</c:if>
									<c:if test="${today gt endTime }">
										<span>마감</span>
									</c:if>
									<c:if test="${today lt endTime }">
										<span id="showDday">D -${endTime - today }</span>
									</c:if>
									<p class="indent">${jv.j_startdate } ~ ${jv.j_enddate }</p>
								</div>	
								<div class="section">
									<h6 class="card-title font-weight-bold text-dark">채용 형태</h6>
										<p class="indent">${cv.jc_career }</p>
									<h6 class="card-title font-weight-bold text-dark">모집 부문</h6>
										<p class="indent">${dv.jd_duty }</p>
									<h6 class="card-title font-weight-bold text-dark">근무 지역</h6>
										<p class="indent">${zv.jz_zone }</p>
								</div>
							</div>
						</div>
					</div> <!-- (1) 공고제목, 기업명, 채용기간, 채용형태 끝 -->
					
						
					<!-- (2) 공고이미지 선택  -->
					<div class="card mb-3">
						<div class="card-body" >
							<img src="${cp }/resources/upload/${jv.j_infoimg }" id="infoimg">
						</div>
					</div> <!-- (2) 공고이미지 끝 -->
						
					<!-- 다른 채용 공고 
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">다른 채용 공고</h6>
						</div>
						<div class="card-body">
							<div class="card mb-3" style="max-width: 540px;">
								<div class="row g-0">
									<div class="col-md-4">
										<img
											src="${cp}/resources/img/undraw_profile.svg"
											class="img-fluid rounded-start" alt="..."
											style="max-width: 50px;">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">영화모임1</h5>
											<p class="card-text">푸쉬왜안됨!!?????</p>
										</div>
									</div>
								</div>
							</div>
							<div class="card mb-3" style="max-width: 540px;">
								<div class="row g-0">
									<div class="col-md-4">
										<img
											src="${cp}/resources/img/undraw_profile.svg"
											class="img-fluid rounded-start" alt="..."
											style="max-width: 50px;">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">영화모임</h5>
											<p class="card-text">영화 좋아하시는분</p>
										</div>
									</div>
								</div>
							</div>
							<div class="card mb-3" style="max-width: 540px;">
								<div class="row g-0">
									<div class="col-md-4">
										<img
											src="${cp}/resources/img/undraw_profile.svg"
											class="img-fluid rounded-start" alt="..."
											style="max-width: 50px;">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">영화모임</h5>
											<p class="card-text">영화 좋아하시는분</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>	-->
					
						
					<!-- (3) 기타 기능 -->
					<div class="card mb-3">
						<div class="col-md-8">
							<div class="card-body">
								<div class="bottombar">
									<a href="${jv.j_url }"><i class="fa-regular fa-window-restore"></i>
										<span>채용사이트 바로가기</span>
									</a>
									<c:set var="a" value="1"/>
									<c:forEach var="bookMark" items="${myBookMarkList }">
										<c:choose>
											<c:when test="${bookMark.j_num eq jv.j_num}" >
												<!-- 북마크 -->
												<c:set var="a" value="2"/>
												<a onclick="bookMark(${jv.j_num})" ><i id="mark${jv.j_num }" style="color:#4e73df;" class="fa-solid fa-bookmark"></i>
												<span>스크랩</span></a>
											</c:when>	
										</c:choose>
									</c:forEach>
									<c:if test="${a==1 }">
										<a href="#" onclick="bookMark(${jv.j_num})"><i id="mark${jv.j_num}" class="fa-regular fa-bookmark"></i>
										<span>스크랩</span>
										</a>
									</c:if>
									
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<button class="btn btn-primary" onclick="remove(${jv.j_num})" id="delete">삭제</button>
									</sec:authorize>
								</div>
							</div>
						</div>
					</div> <!-- (3) 기타기능 끝 -->
						
				</div> <!-- 채용카드의 body 끝 -->
			</div> <!-- 2. 채용카드 끝 -->
		</div>
	</div>
</div>	
<!-- 다른채용공고 
<div class="more">
	<h2>다른 채용공고</h2>
	<a href="">
		<span class="dday"></span>
		<span class="view">${jv.j_view }</span>
	</a>
</div>
-->

		</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>