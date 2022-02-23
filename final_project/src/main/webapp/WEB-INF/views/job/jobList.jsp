<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 디데이 계산을 위한 import -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<!-- 채용공고 리스트 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>
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
						location.reload();
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
<style>
	#companylogo{
		cursor: pointer;
	    background-position: center center;
		background-size: cover;
	}
	#showDuty{ display: inline-block;
		margin-right: 4px;
		padding: 0 8px;
		line-height: 20px;
		border-radius: 10px;
		color: #737373;
		font-size: 12px;
		background-color: #f2f2f2;
    }
    #showPopular{
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
    	background-color: #EAEAEA; font-size: 12px; color:black;
    }
</style>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">
		<div class="row">
				<!-- 카드 비율 설정 col / offset -->
				<div class="col-9 offset-1">
<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">채용 공고</h1>
				<form method="post" action="${cp }/job/jobList"
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" name="keyword" value="${keyword }"
							class="form-control bg-white border-secondary small"
							placeholder="찾으시는 기업이 있나요?" aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">
									<i class="fas fa-search fa-sm"></i>
							</button>
							<!-- 필터 검색 
							<a class="" href="{cp}/job/jobList" data-toggle="modal"
								data-target="#searchfilter"> 
								<i class="fa-solid fa-bars-staggered"></i>
								필터 검색
							</a> -->
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				</form>
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
							<div class="col-md-10"> <!-- 카드제목 왼쪽 -->
								<h6 class="m-0 font-weight-bold text-dark" style="display:inline;">
									<!-- 인기공고 -->
									<c:set var="v" value="1"/>
									<c:forEach var="PL" items="${popularList }">
										<c:choose>
											<c:when test="${PL.j_num eq vo.j_num }">
												<c:set var="v" value="2"/>
												<c:forEach var="dutyList" items="${dutyList }">
														<c:if test="${dutyList.j_num eq vo.j_num}" >
															<span id="showPopular">인기</span>
															<span id="showDuty">${dutyList.jd_duty }</span>
														</c:if>	
												</c:forEach>
											</c:when>
										</c:choose>
									</c:forEach>
									<!-- NOT 인기공고 -->
									<c:if test="${v==1 }">
										<c:forEach var="dutyList" items="${dutyList }">
											<c:if test="${dutyList.j_num eq vo.j_num}" >
												<span id="showDuty">${dutyList.jd_duty }</span>
											</c:if>	
										</c:forEach>
									</c:if>		
								</h6>
							</div>
							<div class="col-md-2"> <!--Admin 로그인상태시 삭제버튼--> <!-- 카드제목 오른쪽 -->
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<button class="btn btn-primary" onclick="remove(${vo.j_num})" id="delete">삭제</button>
								</sec:authorize>
							</div>
						</div>
						
					</div>
					
					<div class="card-body"><!-- body -->
						<div class="row g-0">
							<div class="col-lg-12"><!-- 카드본문 왼쪽 (정보) -->
								<div class="card-body">
									<h6 class="card-title">
										<!--  -->
									</h6>
									
										<div class="row g-0">
											<div class="col-sm-8">
												<div style="cursor: pointer;"
													onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';">
												<p style="font-weight: bold; font-size: 16px; color: black;">${vo.j_company }</p>
												<p style="font-size: 16px;">${vo.j_subject}</p>
												</div>
											<div class="col-xs" >
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
													<span id="viewCount"><i class="fa-solid fa-eye text-gray-400"></i>
														${vo.j_view} </span>
												</p>
											</div>
												<c:set var="a" value="1" />
												<!-- 북마크 O -->
												<c:forEach var="bookMark" items="${myBookMarkList }">
													<c:choose>
														<c:when test="${bookMark.j_num eq vo.j_num}">
															<c:set var="a" value="2" />
															<a onclick="bookMark(${vo.j_num})">
															<i id="mark${vo.j_num }" style="color: #4e73df;"
																class="fa-solid fa-bookmark"></i></a>
														</c:when>
													</c:choose>
												</c:forEach>
												<!-- 북마크 X -->
												<c:if test="${a==1 }">
													<a onclick="bookMark(${vo.j_num})">
													<i id="mark${vo.j_num}" class="fa-regular fa-bookmark"></i></a>
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
						<!-- body 끝 -->
				</div> <!-- 끝 -->

			</div> <!-- 첫번쨰 Content Column 끝 -->
			</c:forEach>
			<!-- 페이징 -->										
           	<div class="pagination">
           		<c:choose>
           			<c:when test="${pageNum==1 }">
           				<a href="#" onclick="return false;">&laquo;</a>		
           			</c:when>
           			<c:otherwise>
           				<a href="${cp }/job/jobList?pageNum=${pageNum-1}&keyword=${keyword}">&laquo;</a>
           			</c:otherwise>
           		</c:choose>
           		
           		<c:choose>
           			<c:when test="${pageNum==1 }">
           				<a href="${cp }/job/jobList?pageNum=&keyword=${keyword}" class="first"><span>1</span></a>		
           			</c:when>
           			<c:otherwise>
           				<a href="${cp }/job/jobList?pageNum=&keyword=${keyword}"><span>1</span></a>
           			</c:otherwise>
           		</c:choose>
                		
				<c:forEach var="i" begin="${pu.startPageNum+1 }" end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${i==param.pageNum }">
							<a href="${cp }/job/jobList?pageNum=${i}&keyword=${keyword}" class="active"><span>${i }</span></a>
						</c:when>
						<c:otherwise>
							<a href="${cp }/job/jobList?pageNum=${i}&keyword=${keyword}"><span>${i }</span></a>
						</c:otherwise>
						</c:choose>
				</c:forEach>
			
				<c:choose>
           			<c:when test="${pageNum==endPageNum }">
           				<a href="#" onclick="return false;">&laquo;</a>		
           			</c:when>
           			<c:otherwise>
           				<a href="${cp }/job/jobList?pageNum=${pageNum+1}&keyword=${keyword}">&raquo;</a>
           			</c:otherwise>
           		</c:choose>
			</div>		

		</div> <!-- Content Row 끝 -->
		
		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝 -->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	
<style>
	.pagination{
		display: inline-block;
		margin:0 auto;
   }
   .pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	}
	.pagination a.first, a.active {
		  background-color: #4e73df;
		  color: white;
	}
	.pagination a:hover:not(.active, .first) {background-color: #ddd;}
	.pagination a {
	  border-radius: 25px;
	}

	.pagination a.active {
	  border-radius: 25px;
	}
</style>	
<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
