<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<!-- Begin Page Content -->
<form method="post" action="${cp}/job/insert?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data">
		<div class="container-fluid">


<!-- Approach -->
			
			<!-- 2. 채용공고 만들기 카드 -->
			<div class="row">
				<div class="col-8 offset-2">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-dark"> 채용공고 정보 작성</h5>
				</div>
				
				<div class="card-body">
						
					<!-- (1) 공고제목, 기업명, 채용기간, 채용형태	 -->
					<div class="card mb-3">
						<div class="col-md-8">
							<div class="card-body">
								
								<h6 class="card-title font-weight-bold text-dark">기업명</h6>
								<p class="card-text">
									<input type="text" name="j_company" maxlength="30" autocomplete="off" class="text"><br>
									<!-- 기업리스트 API 써야할듯! -->
									<div>
									</div>
								</p>
								<h6 class="card-title font-weight-bold text-dark">공고 제목</h6>
								<p class="card-text">
									<!-- 공고제목 입력 -->
									<input type="text" name="j_subject" placeholder="" maxlength="30" autocomplete="off" class="text"><br>
								</p>
								<h6 class="card-title font-weight-bold text-dark">채용 기간</h6>
								<p class="card-text">
									<input type="date" name="j_startdate" autocomplete="off" class="text"> ~
									<input type="date" name="j_enddate" autocomplete="off" class="text">
								</p>
								<h6 class="card-title font-weight-bold text-dark">채용 형태</h6>
								<p class="card-text">
									<fieldset style="width:300px">
										<c:forEach items="${fn:split('신입|경력','|') }" var="career">
								    		<label><input type="checkbox" name="jc_career" value="${career }">${career }</label>
								    	</c:forEach>
							    	</fieldset>
								</p>
							</div>
						</div>
					</div> <!-- (1) 공고제목, 기업명, 채용기간, 채용형태 끝 -->
					
						
					<!-- (2) 모집 부문 선택  -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
							
								<h6 class="card-title font-weight-bold text-dark">모집 부문</h6>
								<p class="card-text">
									<fieldset style="width:400px">
										<c:forEach items="${fn:split('영업·영업관리|전략·기획|마케팅·광고·홍보|회계·재무|인사·노무|유통·물류|IT·SW|연구개발·설계|생산·생산관리|건축·인테리어|토목·환경|의료·보건|교육|미디어|디자인|기타','|') }"
													var="duty">
									    	<label><input type="checkbox" name="jd_duty" value="${duty }" >${duty }</label>
									    </c:forEach><br>
									    <input type="reset" value="초기화">
								    </fieldset>
								</p>
								
							</div>
						</div>
					</div> <!-- (2) 모집 부문 끝 -->
						
					<!-- (3) 근무지역 -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
								<h6 class="card-title font-weight-bold text-dark">근무 지역입니다</h6>
								<p class="card-text">
									<fieldset style="width:300px">
										<c:forEach items="${fn:split('서울|경기|광주|대구|대전|부산|세종|울산|인천|강원|경남|경북|전남|전북|충남|충북|제주|해외|기타','|') }"
													var="zone">
									    	<label><input type="checkbox" name="jz_zone" value="${zone }">${zone }</label>
									    </c:forEach><br>
									    <input type="reset" value="초기화">
								    </fieldset>
								</p>
									
							</div>
								
						</div>
					</div> <!-- (3) 근무지역 끝 -->
						
					<!-- (4) 이미지 업로드 -->
					<div class="card mb-3">
						<div class="col-md-8">
							<div class="card-body">
								<h6 class="card-title font-weight-bold text-dark">기업 이미지 업로드</h6>
								<p class="card-text">
									<input type="file" name="file1"> <br>
								</p>
								<h6 class="card-title font-weight-bold text-dark">공고 이미지 업로드</h6>
								<p class="card-text">
									<input type="file" name="file2"> <br>
								</p>
							</div>
						</div>
					</div> <!-- (4) 이미지 업로드 끝 -->
					
					<!-- (5) 공고 URL -->
					<div class="card mb-3">
						<div class="col-md-8">
							
							<div class="card-body">
								<h6 class="card-title font-weight-bold text-dark">공고 URL</h6>
								<p class="card-text">
									<input type="text" name="j_url">
								</p>
							</div>
						</div>
					</div> <!-- (3) 근무지역 끝 -->
					<input type="submit" value="신청하기">
				</div> <!-- 채용카드의 body 끝 -->
			</div> <!-- 2. 채용카드 끝 -->
		</div>
		</div>
	</div>
</form>
       
<%@ include file="/WEB-INF/views/footer.jsp" %>