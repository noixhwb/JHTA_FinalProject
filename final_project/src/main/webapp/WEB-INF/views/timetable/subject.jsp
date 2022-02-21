<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#myrateBox {
	display: none;
	position: fixed;
	z-index: 999;
	left: 500px;
	bottom: 100px;
	background-color: white;
}

.starR {
	font-size: 20px;
	cursor: pointer;
	color: #c8c8c8;
}

.starR.on {
	color: blue;
}

.starRate {
	font-size: 20px;
	color: #c8c8c8;
	color: blue;
}
</style>
<!-- Main Content 이건 지우지 마세요-->
<div id="content">


	<!-- Begin Page Content 이건 지우지마세요 -->
	<div class="container-fluid">

		<!-- ////작업공간//// -->
		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">강의평가</h1>
			<form action="${cp}/timetable/subjectList" method="get"
				class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }">
				<div class="input-group">
					<input type="text" name="keyword"
						class="form-control bg-white border-secondary small"
						placeholder="과목명, 교수명으로 검색" aria-label="Search"
						aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="submit">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
			</form>
			<a href="${cp}/timetable/mysubjectrate?m_num=${m_num}"
				class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
				내가 쓴 강의평가</a>
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
										<table class="table table-bordered" width="100%"
											cellspacing="0">
											<thead>
												<tr>
													<th>과목번호</th>
													<th>과목명</th>
													<th>교수명</th>
													<th>구분</th>
													<th>학점</th>
													<th>강의평점</th>
													<th>강의평가보기</th>
													<th>강의평가하기</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>과목번호</th>
													<th>과목명</th>
													<th>교수명</th>
													<th>구분</th>
													<th>학점</th>
													<th>강의평점</th>
													<th>강의평가보기</th>
													<th>강의평가하기</th>
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
														<c:choose>
															<c:when test="${vo.sr_recommend==0 }">
																<td>강의평가 없음</td>
															</c:when>
															<c:otherwise>
																<td>${vo.sr_recommend }</td>
															</c:otherwise>
														</c:choose>
														<td><button class="btn btn-primary"
																onclick="rateList(${vo.s_num});">강의평가보기</button></td>
														<td><button class="btn btn-primary"
																onclick="myrateForm(${vo.s_num});">강의평가하기</button></td>
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
										<div class="card col-md-4 shadow mb-4" id="myrateBox">
											<div class="card-header">
												<h6 class="m-0 font-weight-bold text-primary">강의평 작성하기</h6>
											</div>
											<div class="card-body">
												<label class="col-lg-2 control-label">별점</label>
												<div class="starRev">
													<span class="starR on" id="1">★</span> <span class="starR"
														id="2">★</span> <span class="starR" id="3">★</span> <span
														class="starR" id="4">★</span> <span class="starR" id="5">★</span>
												</div>
												<form action="${cp}/timetable/myrateInsert" method="post"
													id="myrateForm">
													<input type="hidden" name="${_csrf.parameterName }"
														value="${_csrf.token }"> <input type="hidden"
														name="s_num" id="myrateS_num"> <input
														type="hidden" name="m_num" value="${m_num}"
														id="myrateM_num"> <input type="hidden"
														name="sr_recommend" id="myrateRecommend"> <label
														class="col-lg-2 control-label">강의평</label>
													<div class="col-lg-8">
														<textarea class="form-control" rows="3" name="sr_content"
															style="resize: none"></textarea>
													</div>
													<div class="col-lg-offset-2 col-lg-10">
														<button type="submit" class="btn btn-primary">등록</button>
														<button type="reset" class="btn btn-primary"
															id="myrateCancle">취소</button>
													</div>
												</form>
											</div>
										</div>
										<span id="myrateresult"></span>
										<div>
											<div id="rateListBox"></div>
											<div id="rateListPageBox"></div>
										</div>
									</div>
								</div>
							</div>

						</c:when>
						<c:otherwise>
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">"${keyword}"에
										대한 검색결과가 없습니다.</h6>
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

	/* 강의평가보기 버튼클릭시 강의평가리스트 출력 */
	function rateList(s_num,pageNum) {
		$.ajax({
			url:'${cp}/timetable/rateList',
			data:{"pageNum":pageNum,"s_num":s_num},
       		type: 'GET',
			dataType:'json',
			success:function(data) {
				let html="";
				if(data.list!=false) {
					html +="<table class='table table-bordered' id='dataTable2' width='100%' cellspacing='0'>";
					html += "<thead><tr><th>별점</th><th>강의평</th><th>작성일</th></tr></thead>";
					html += "<tfoot><tr><th>별점</th><th>강의평</th><th>작성일</th></tr></tfoot>";
					html += "<tbody>";
					$(data.list).each(function(i,vo) {
						let m_num=vo.m_num;
						let sr_content=vo.sr_content;
						let sr_regdate=vo.sr_regdate;
						let sr_recommend=vo.sr_recommend;
						switch (sr_recommend) {
						case 1:
							html += "<tr><td><span class='starRate'>★</span></td>";
							break;
						case 2:
							html += "<tr><td><span class='starRate'>★★</span></td>";
							break;
						case 3:
							html += "<tr><td><span class='starRate'>★★★</span></td>";
							break;
						case 4:
							html += "<tr><td><span class='starRate'>★★★★</span></td>";
							break;
						case 5:
							html += "<tr><td><span class='starRate'>★★★★★</span></td>";
							break;
						}
						html += "<td>" + sr_content +"</td>";
						html += "<td>" + sr_regdate +"</td></tr>";
					});
					html += "</tbody></table>";
					$("#rateListBox").html(html);
					
					let startPage=data.pu.startPageNum;
					let endPage=data.pu.endPageNum;
					let pageCount=data.pu.pageCount;
					let pageHTML="";
					if(startPage>5) {
						pageHTML +="<a href='javascript:rateList("+ s_num +","+ (startPage-1) + ")'>이전</a>";
					}
					for(let j=startPage; j<=endPage; j++){
						if(j==pageNum){
							pageHTML +="<a href='javascript:rateList("+ s_num +","+ j + ")'><span style='color:blue'>"+ j +" </span></a>";
						}else{
							pageHTML +="<a href='javascript:rateList("+ s_num +","+ j + ")'><span style='color:gray'>"+ j +" </span></a>";
						}
					}
					if(endPage<pageCount) {
						pageHTML +="<a href='javascript:rateList("+ s_num +","+  (endPage+1) + ")'>다음</a>";
					}
					$("#rateListPageBox").html(pageHTML);
				}else {
					html +="작성된 강의평이 없습니다. 강의평을 작성해주세요.";
					$("#rateListBox").html(html);
				}
			}
		});
	}

	/* 강의평가하기 버튼클릭시 강의평가폼 보이기 */
	function myrateForm(s_num) {
		$("#myrateBox").css("display","block");
		$("#myrateS_num").val(s_num);
		$("#myrateRecommend").val(1);
	}

	/* 별 클릭시 별css변하고 점수값 value에 등록 */
	$('.starRev span').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		$("#myrateRecommend").val(parseInt($(this).prop("id")));
	});

	/* 강의평가취소 버튼클릭시 강의평가폼 안보이기 */
	$("#myrateCancle").click(function(){
		$("#myrateBox").css("display","none");
	});

	/* 강의평가등록 버튼클릭시 등록후 폼 안보이기 및 강의평가리스트 새로고침 */
	$("#myrateForm").submit(function(e) {
		e.preventDefault();
		let msg="";
		$.ajax({
			url:'${cp}/timetable/myrateInsert',
			data:$("#myrateForm").serialize(),
			method:'POST',
			dataType:'json',
			success:function(data) {
				if(data.result==true) {
					$("#myrateBox").css("display","none");
					msg="강의평이 등록되었습니다.";
					rateList($("#myrateS_num").val());
				}else {
					msg="강의평 등록에 실패하였습니다.";
				}
				$("#myrateresult").html(msg);
			}
		});
	});

		
</script>
		<!-- 이건 지우지마세요 -->
	</div>
</div>
<!-- 이건 지우지마세요 -->
<%@ include file="/WEB-INF/views/footer.jsp"%>