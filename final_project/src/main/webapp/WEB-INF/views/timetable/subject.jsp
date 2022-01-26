<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Main Content 이건 지우지 마세요-->
<div id="content">

	<!-- ///////상단바부분 시작 필요없으면 지워도됨/////// -->
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

		<!-- Sidebar Toggle (Topbar) -->
		<button id="sidebarToggleTop"
			class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>

		<!-- ///////상단바에서 검색부분/////// -->
		<form action="${cp}/timetable/subjectList" method="get"
			class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group">
				<input type="text" name="keyword"
					class="form-control bg-light border-0 small"
					placeholder="과목명 혹은 교수명으로 검색하세요" aria-label="Search"
					aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="submit">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">

			<!-- ///////상단바에서 프로필부분-승한님 수정부분/////// -->
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span
					class="mr-2 d-none d-lg-inline text-gray-600 small">홍길동님</span> <img
					class="img-profile rounded-circle"
					src="${cp}/resources/img/undraw_profile.svg">
			</a> <!-- Dropdown - User Information -->
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
					</a> <a class="dropdown-item" href="#"> <i
						class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 수정
					</a> <a class="dropdown-item" href="#"> <i
						class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 활동기록
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal"> <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						로그아웃
					</a>
				</div></li>

		</ul>

	</nav>
	<!-- ///////상단바부분 끝 필요없으면 여기까지 지우면됨/////// -->

	<!-- Begin Page Content 이건 지우지마세요 -->
	<div class="container-fluid">

		<!-- ////작업공간//// -->
		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">강의평가</h1>
			<a href="${cp}/timetable/mysubjectrate?m_num=1"
				class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
				내가 쓴 강의평가 </a> <a href="${cp}/timetable/mysubjectrate?m_num=1"
				class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
				내가 찜한 강의 </a>
		</div>
		<div>
			<div>
				<div id="subListBox">
					<c:choose>
						<c:when test="${!empty list }">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">"${keyword}"에
										대한 검색결과</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive" id="timetableBox">
										<table class="table table-bordered"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>과목번호</th>
													<th>과목명</th>
													<th>교수명</th>
													<th>구분</th>
													<th>학점</th>
													<th>강의평가보기</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>과목번호</th>
													<th>과목명</th>
													<th>교수명</th>
													<th>구분</th>
													<th>학점</th>
													<th>강의평가보기</th>
												</tr>
											</tfoot>
											<tbody>
												<c:forEach var="vo" items="${list }">
													<tr>
														<td>${vo.s_num }</td>
														<td>${vo.s_name }</td>
														<td>${vo.s_prof }</td>
														<td>${vo.s_category }</td>
														<td>${vo.s_score }</td>
														<td><a onclick="rateClick(${vo.s_num });">강의평가</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div>
											<c:forEach var="i" begin="${pu.startPageNum }"
												end="${pu.endPageNum }">
												<c:choose>
													<c:when test="${i==param.pageNum }">
														<a
															href="${cp}/timetable/subjectList?pageNum=${i}&keyword=${keyword}"><span
															style="color: blue">${i }</span></a>
													</c:when>
													<c:otherwise>
														<a
															href="${cp}/timetable/subjectList?pageNum=${i}&keyword=${keyword}"><span
															style="color: gray">${i }</span></a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>
										<div id="rateListBox"></div>
									</div>
								</div>
							</div>

						</c:when>
						<c:otherwise>
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">"${keyword}"에
										대한 검색결과 없습니다.</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>과목번호</th>
													<th>과목명</th>
													<th>교수명</th>
													<th>구분</th>
													<th>학점</th>
													<th>강의평가보기</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

				</div>
				
			</div>
		</div>
		<!-- ////작업공간끝//// -->


		<script type="text/javascript">
	
	
		function rateClick(s_num) {
				$.ajax({
					url:'${cp}/timetable/rateList',
					data:{"s_num":s_num},
            		type: 'GET',
					dataType:'json',
					success:function(data) {
						let html="<table class='table table-bordered' id='dataTable2' width='100%' cellspacing='0'>";
						html += "<thead><tr><th>별점</th><th>강의평</th><th>작성일</th></tr></thead>";
						html += "<tfoot><tr><th>별점</th><th>강의평</th><th>작성일</th></tr></tfoot>";
						html += "<tbody>";
						$(data.list).each(function(i,vo) {
							let m_num=vo.m_num;
							let sr_content=vo.sr_content;
							let sr_regdate=vo.sr_regdate;
							let sr_recommend=vo.sr_recommend;
							html += "<tr><td>" + sr_recommend +"</td>";
							html += "<td>" + sr_content +"</td>";
							html += "<td>" + sr_regdate +"</td></tr>";
						});
						html += "</tbody></table>";
						$("#rateListBox").html(html);
					}
				});
		}
						
		
		
			
					
					
				
			
		
						
						
		/* let startPage=data.startPageNum;
		let endPage=data.endPageNum;
		let pageCount=data.pageCount;
		let pageHTML="";
		if(startPage>5) {
			pageHTML +="<a href='javascript:list("+ (startPage-1) + ")'>[이전]</a>";
		}
		for(let i=startPage;i<=endPage;i++){
			if(i==pageNum){
				pageHTML +="<a href='javascript:list("+ i + ")'><span style='color:blue'>["+ i +"]</span></a>";
			}else{
				pageHTML +="<a href='javascript:list("+ i + ")'><span style='color:gray'>["+ i +"]</span></a>";
			}
		}
		if(endPage<pageCount) {
			pageHTML +="<a href='javascript:list("+ (endPage+1) + ")'>[다음]</a>";
		}
		$("#page").html(pageHTML); 
		}
		});
		});*/

		
	</script>
		<!-- 이건 지우지마세요 -->
	</div>
</div>
<!-- 이건 지우지마세요 -->
<%@ include file="/WEB-INF/views/footer.jsp"%>