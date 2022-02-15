<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#myrateBox {
	display: none;
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
			<h1 class="h3 mb-0 text-gray-800">내가 쓴 강의평가</h1>
		</div>
		<div>
			<div>
				<div id="subListBox">
					<c:choose>
						<c:when test="${!empty list }">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>과목명</th>
													<th>교수명</th>
													<th>별점</th>
													<th>강의평</th>
													<th>작성일</th>
													<th>수정</th>
													<th>삭제</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>과목명</th>
													<th>교수명</th>
													<th>별점</th>
													<th>강의평</th>
													<th>작성일</th>
													<th>수정</th>
													<th>삭제</th>
												</tr>
											</tfoot>
											<tbody>
												<c:forEach var="vo" items="${list }">
													<tr>
														<td>${vo.s_name }</td>
														<td>${vo.s_prof }</td>
														<c:if test="${vo.sr_recommend==1 }"><td><span class="starRate">★</span></td></c:if>
														<c:if test="${vo.sr_recommend==2 }"><td><span class="starRate">★★</span></td></c:if>
														<c:if test="${vo.sr_recommend==3 }"><td><span class="starRate">★★★</span></td></c:if>
														<c:if test="${vo.sr_recommend==4 }"><td><span class="starRate">★★★★</span></td></c:if>
														<c:if test="${vo.sr_recommend==5 }"><td><span class="starRate">★★★★★</span></td></c:if>
														<td>${vo.sr_content }</td>
														<td>${vo.sr_regdate }</td>
														<td><a onclick="myrateUpdateForm(${vo.sr_num });">수정</a></td>
														<td><a onclick="myrateDelete(${vo.sr_num });">삭제</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<c:forEach var="i" begin="${pu.startPageNum }"
											end="${pu.endPageNum }">
											<c:choose>
												<c:when test="${i==param.pageNum }">
													<a
														href="${cp}/timetable/mysubjectrate?pageNum=${i}&m_num=${m_num}"><span
														style="color: blue">${i }</span></a>
												</c:when>
												<c:otherwise>
													<a
														href="${cp}/timetable/mysubjectrate?pageNum=${i}&m_num=${m_num}"><span
														style="color: gray">${i }</span></a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
									<div class="form-group" id="myrateBox">
											<label class="col-lg-2 control-label">별점</label>
											<div class="starRev">
												<span class="starR on" id="1">★</span> 
												<span class="starR" id="2">★</span> 
												<span class="starR" id="3">★</span> 
												<span class="starR" id="4">★</span>
												<span class="starR" id="5">★</span>
											</div>
											<form action="${cp}/timetable/myrateUpdate" method="post"
												id="myrateForm">
												<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
												<input type="hidden" name="sr_num" id="myrateSr_num">
												<input type="hidden" name="sr_recommend" id="myrateRecommend">
												<label class="col-lg-2 control-label">강의평</label>
												<div class="col-lg-8">
													<textarea class="form-control" rows="5"
														name="sr_content" style="resize: none"></textarea>
												</div>
												<div class="col-lg-offset-2 col-lg-10">
													<button type="submit" class="btn btn-primary">수정</button>
													<button type="reset" class="btn btn-primary" id="myrateCancle">취소</button>
												</div>
											</form>
										</div>
										<span id="myrateresult"></span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">작성하신 강의평이 없습니다.</h6>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

				</div>
				<div id="rateListBox"></div>
			</div>
		</div>
		<!-- ////작업공간끝//// -->


		<script type="text/javascript">
	
		/* 수정하기 버튼클릭시 강의평가폼 보이기 */
		function myrateUpdateForm(sr_num) {
			$("#myrateBox").css("display","block");
			$("#myrateSr_num").val(sr_num);
		}

		/* 별 클릭시 별css변하고 점수값 value에 등록 */
		$('.starRev span').click(function(){
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			/* return false; */
			$("#myrateRecommend").val(parseInt($(this).prop("id")));
		});

		/* 취소 버튼클릭시 강의평가폼 안보이기 */
		$("#myrateCancle").click(function(){
			$("#myrateBox").css("display","none");
		});

		/* 수정 버튼클릭시 등록후 폼 안보이기 및 강의평가리스트 새로고침 */
		$("#myrateForm").submit(function(e) {
			e.preventDefault();
			let msg="";
			$.ajax({
				url:'${cp}/timetable/myrateUpdate',
				data:$("#myrateForm").serialize(),
				method:'POST',
				dataType:'json',
				success:function(data) {
					if(data.result==true) {
						$("#myrateBox").css("display","none");
						msg="강의평이 수정되었습니다.";
						location.reload();
					}else {
						msg="강의평 수정에 실패하였습니다.";
					}
					$("#myrateresult").html(msg);
				}
			});
		});
	
		function myrateDelete(sr_num) {
			$.ajax({
				url:'${cp}/timetable/myrateDelete',
				data:{"sr_num":sr_num},
	       		type: 'GET',
				dataType:'json',
				success:function(data) {
					if(data.result==true) {
						alert("삭제성공");
						location.reload();
					}else {
						alert("삭제실패");
					}
				}
			});
		}

		
	</script>
		<!-- 이건 지우지마세요 -->
	</div>
</div>
<!-- 이건 지우지마세요 -->
<%@ include file="/WEB-INF/views/footer.jsp"%>