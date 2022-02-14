<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 디데이 계산을 위한 import -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<!-- 회원관리 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>
<script>
	function bookMark(num) {
		var j_num=num;
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let json=JSON.parse(data);
				if(json.result==true) {
					alert("성공");
				}else {
					alert("실패");
				}
			}
		}
		xhr.open('get','${cp}/job/scrapInsert?j_num=' + j_num ,true);
		xhr.send();
	}
/*	$(function() {
		$("#scrap").click(function(num) {
			console.log(num);
			$.ajax({
				url:'${cp}/job/scrapInsert',
				data:num,
				method:'GET',
				dataType:'json',
				success:function(data){
					if(data.result==true) {
						alert("스크랩 성공");
					}else {
						alert("스크랩 성공");
					}
				}
			})			
		});
	};n

/*	$(function(){ 
	function bookMark() {
		 if (confirm("로그인 후 스크랩할 수 있습니다.") == true){    //확인
			 location.href='${cp}/login';
		 }else{   //취소
		     return false;
		 }
	}*/
</script>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">채용 공고</h1>
				<form method="post" action="${cp }/job/jobList"
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" name="keyword"
							class="form-control bg-white border-secondary small"
							placeholder="찾으시는 기업이 있나요?" aria-label="Search"
							value="${keyword }" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
							<a class="" href="{cp}/job/jobList" data-toggle="modal"
								data-target="#searchfilter"> 
								<i class="fa-solid fa-bars-staggered"></i>
								필터 검색
							</a>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }">
				</form>
			</div>
			<div class="modal fade" id="searchfilter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		        aria-hidden="true">
		        <div class="modal-dialog" role="document">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="exampleModalLabel">필터 검색</h5>
		                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true">×</span>
		                    </button>
		                </div>
		                <div class="modal-body">
		                	<h6>직무</h6>
		                	<fieldset style="width:400px">
								<c:forEach items="${fn:split('영업·영업관리|전략·기획|마케팅·광고·홍보|회계·재무|인사·노무|유통·물류|IT·SW|연구개발·설계|생산·생산관리|건축·인테리어|토목·환경|의료·보건|교육|미디어|디자인|기타','|') }"
											var="duty">
									<label><input type="checkbox" name="jd_duty" value="${duty }" >${duty }</label>
								</c:forEach><br>
							</fieldset>
		                </div>
		                <div class="modal-body">
		                	<h6>지역</h6>
		                	<fieldset style="width:400px">
								<c:forEach items="${fn:split('서울|경기|광주|대구|대전|부산|세종|울산|인천|강원|경남|경북|전남|전북|충남|충북|제주|해외|기타','|') }"
											var="zone">
									<label><input type="checkbox" name="jd_zone" value="${zone }" >${zone }</label>
								</c:forEach><br>
							</fieldset>
		                </div>
		                <div class="modal-body">
		                	<h6>경력</h6>
		                	<fieldset style="width:400px">
								<c:forEach items="${fn:split('신입|경력','|') }" var="career">
									<label><input type="checkbox" name="jd_duty" value="${career }" >${career }</label>
								</c:forEach><br>
							</fieldset>
		                </div>
		                <div class="modal-footer">
		                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
		                    <a class="btn btn-primary" href="jobList?jd_duty=${jd_duty }&jd_zone=${jd_zone}&jd_career=${jd_career}">적용하기</a>
		                </div>
		            </div>
		        </div>
		    </div>

		</div>
<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
			<c:forEach var="vo" items="${ list }">
			<!-- 첫번째 Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<!-- 채용공고 -->
			<!-- 	style=" cursor: pointer;" onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';"  -->
				<div class="card shadow mb-4"  >
					<div class="card-body"> <!-- body -->
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드본문 왼쪽 (정보) -->
								<div class="card-body">
									<h6 class="card-title"> 
										<!--  --> 
									</h6>
									<p class="card-text">
										
											<div class="row g-0" >
												<div class="col-md-8" style=" cursor: pointer;" onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';">
														<h5 style="font-weight: bold">${vo.j_company }</h5>
														<p>${vo.j_subject}</p> 
												</div>
												<div class="col-md-8">
														<!-- 현재날짜 -->
														<c:set var="today" value="<%=new java.util.Date()%>" />
														<c:set var="end" value="${vo.j_enddate}" />
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
														<p style=" cursor: pointer;" onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';">
																<c:if test="${endTime eq today }">
																	<span style="color:#4e73df;">D -DAY</span>
																</c:if>
																<c:if test="${today gt endTime }">
																	<span>마감</span>
																</c:if>
																<c:if test="${today lt endTime }">
																	<span style="color:#4e73df;">D ${endTime - today }</span>
																</c:if>
															<span id="viewCount"><i class="fa-solid fa-eye text-gray-400"></i>
																${vo.j_view}
															</span>
														</p>
														
														<!-- 비로그인 북마크 클릭 : alert(로그인후 스크랩 할 수 있습니다) -->
														<!-- 확인 누르면 로그인페이지, 취소누르면 그대로 -->
														<c:forEach var="bookMark" items="${myBookMarkList }">
															<c:choose>
																<c:when test="${bookMark.j_num eq vo.j_num}">
																	<!-- 북마크 -->
																	<a onclick="bookMark(${vo.j_num})"><i style="color:#4e73df;" class="fa-solid fa-bookmark"></i></a>
																</c:when>	
																<c:otherwise>
																	<!-- 평소 -->
																	<a onclick="bookMark(${vo.j_num})"><i class="fa-regular fa-bookmark"></i></a>
																</c:otherwise>
															</c:choose>
														</c:forEach>	
												</div>
											</div>
									</p>	
								</div>
							</div>
							<div class="col-md-4" style=" cursor: pointer;" onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';"> 
								<img src="${cp }/resources/upload/${vo.j_img }" 
									 class="img-fluid rounded-start" alt="..." style="max-width: 200px;">
							</div>
						</div>
					</div> <!-- body 끝 -->
					
				</div> <!-- 끝 -->
				

			</div> <!-- 첫번쨰 Content Column 끝 -->
			</c:forEach>


		</div> <!-- Content Row 끝 -->

		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝 -->
<!-- End of Main Content -->
			
<!-- End of Content Wrapper -->	


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
