<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 디데이 계산을 위한 import -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 스크랩 페이지 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>
<script>
	function cancelMark(num) {
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
</script>
<style>
	#companylogo{
		cursor: pointer;
	    background-position: center center;
    	background-size: cover;
	}
</style>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">스크랩</h1>
			</div>
			
<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
			<c:forEach var="vo" items="${ list }">
			<!-- 첫번째 Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<!-- 채용공고 -->
				
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드제목 왼쪽 -->
								<h6 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ vo.j_company }</h6>
							</div>
							<div class="col-md-4"> <!-- 카드제목 오른쪽 -->
							</div>
						</div>
					</div>
					
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
																	<span style="color:#4e73df;">D -${endTime - today }</span>
																</c:if>
															<span id="viewCount"><i class="fa-solid fa-eye text-gray-400"></i>
																${vo.j_view}
															</span>
														</p>
														<a onclick="cancelMark(${vo.j_num})" ><i id="mark${vo.j_num }" style="color:#4e73df;" class="fa-solid fa-bookmark"></i></a>
												</div>
											</div>
										<p class="card-text">
											<small class="text-muted"></small>
										</p>
									</p>	
								</div>
							</div>
							<div class="col-md-4"> 
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
			
</div><!-- End of Content Wrapper -->	


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>

<div class="card-body">
							<!-- body -->
							<div class="row g-0">
								<div class="col-lg-12">
									<!-- 카드본문 왼쪽 (정보) -->
									<div class="card-body">
										<h6 class="card-title">
											<!--  -->
										</h6>

										<div>
											<div class="row g-0">
												<div class="col-md-8" style="cursor: pointer;"
													onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';">
													<p style="font-weight: bold; font-size: 16px; color: black;">${vo.j_company }</p>
													<p style="font-size: 16px;">${vo.j_subject}</p>
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
														<fmt:parseDate var="endPlanDate" value="${enddate }"
															pattern="yyyy-MM-dd" />

														<!-- 숫자로 변환 -->
														<fmt:parseNumber var="today"
															value="${today.time / (1000*60*60*24)}"
															integerOnly="true" />
														<fmt:parseNumber var="endTime"
															value="${endPlanDate.time / (1000*60*60*24)}"
															integerOnly="true" />
														<p style="cursor: pointer;"
															onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';">
															<c:if test="${endTime eq today }">
																<span style="color: #4e73df;">D -DAY</span>
															</c:if>
															<c:if test="${today gt endTime }">
																<span>마감</span>
															</c:if>
															<c:if test="${today lt endTime }">
																<span style="color: #4e73df;">D -${endTime - today }</span>
															</c:if>
															<span id="viewCount"><i
																class="fa-solid fa-eye text-gray-400"></i>
																${vo.j_view} </span>
														</p>

														<!-- 비로그인 북마크 클릭 : alert(로그인후 스크랩 할 수 있습니다) -->
														<!-- 확인 누르면 로그인페이지, 취소누르면 그대로 -->
														<c:set var="a" value="1" />
														<c:forEach var="bookMark" items="${myBookMarkList }">
															<c:choose>
																<c:when test="${bookMark.j_num eq vo.j_num}">
																	<!-- 북마크 -->
																	<c:set var="a" value="2" />
																	<a onclick="bookMark(${vo.j_num})"><i
																		id="mark${vo.j_num }" style="color: #4e73df;"
																		class="fa-solid fa-bookmark"></i></a>
																</c:when>
															</c:choose>
														</c:forEach>
														<c:if test="${a==1 }">
															<a onclick="bookMark(${vo.j_num})"><i
																id="mark${vo.j_num}" class="fa-regular fa-bookmark"></i></a>
														</c:if>
												</div>

												<div class="col-md-4" onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';"> 
													<img src="${cp }/resources/upload/${vo.j_img }" 
														 class="img-fluid rounded-start" alt="..." 
														 id="companylogo">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- body 끝 -->