<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Main Content 이건 지우지 마세요-->
<div id="content">
	<!-- Begin Page Content 이건 지우지마세요 -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">학점 계산기</h1>
			<div class="dropdown">
				<button type="button" class="btn btn-primary dropdown-toggle"
					 type="button" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					 시간표불러오기</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<c:forEach var="vo" items="${list }">
				    <li><a class="dropdown-item" onclick="tableLoad(${vo.tt_name });">${vo.tt_name }</a></li>
				    </c:forEach>
				  </ul>
			</div>
		</div>


		<div class="col-lg-8 offset-2">
			<div class="row">
				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-6 col-md-6 mb-4">
					<div class="card border-left-warning shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-primary text-uppercase mb-1">
										전체평점</div>
									<div class="h5 mb-0">
										<span id="avgScore" class="font-weight-bold text-gray-800">0.0</span>
										<span class="mb-0">/4.5</span>
									</div>
								</div>
								<div class="col-auto">
									<i class="fa-solid fa-calendar-check fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-6 col-md-6 mb-4">
					<div class="card border-left-info shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-success text-uppercase mb-1">
										취득학점</div>
									<div class="h5 mb-0">
										<span id="totalScore" class="font-weight-bold text-gray-800">0</span>
										<span class="mb-0">/150</span>
									</div>
								</div>
								<div class="col-auto">
									<i class="fa-solid fa-graduation-cap fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Dropdown Card Example -->
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary" id="DropdownTitle">수강정보 입력</h6>
					<select class="form-control col-sm-3" id="selTerm">
						<option value="1학년 1학기">1학년 1학기</option>
						<option value="1학년 2학기">1학년 2학기</option>
						<option value="2학년 1학기">2학년 1학기</option>
						<option value="2학년 2학기">2학년 2학기</option>
						<option value="3학년 1학기">3학년 1학기</option>
						<option value="3학년 2학기">3학년 2학기</option>
						<option value="4학년 1학기">4학년 1학기</option>
						<option value="5학년 2학기">4학년 2학기</option>
					</select>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>과목명</th>
									<th>학점</th>
									<th>성적</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
								<tr>
									<td><input name="subName" class="form-control" type="text"></td>
									<td><input name="scoreNum" class="form-control"
										type="number" value="0" min="0" max="3"></td>
									<td><select class="form-control" name="scoreABC">
											<option value="0.0" selected="selected">선택</option>
											<option value="4.5">A+</option>
											<option value="4.0">A</option>
											<option value="3.5">B+</option>
											<option value="3.0">B</option>
											<option value="2.5">C+</option>
											<option value="2.0">C</option>
											<option value="1.5">D+</option>
											<option value="1.0">D</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<button type="button" class="btn btn-primary" id="termSaveBtn">정보저장</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 이건 지우지마세요 -->
	</div>
</div>
<!-- 이건 지우지마세요 -->

<script type="text/javascript">
$('.dropdown-toggle').dropdown();
	var totalScore = "";
	var avgScore = "";
	var termName = $("#selTerm").val();
	/* function setCookie(cookie_name, value, days) {
		  var exdate = new Date();
		  exdate.setDate(exdate.getDate() + days);
		  var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
		  document.cookie = cookie_name + '=' + cookie_value;
		} */

	function calculate() {
		totalScore = 0;
		var lengthN = $("input[name='scoreNum']").length;
		for (let i = 0; i <= lengthN; i++) {
			if ($("input[name='scoreNum']").eq(i).val() == null) {
				totalScore += parseInt('0');
			} else {
				totalScore += parseInt($("input[name='scoreNum']").eq(i).val());
			}
		}
		total = 0;
		var lengthA = $("select[name='scoreABC']").length;
		for (let i = 0; i <= lengthA; i++) {
			if ($("select[name='scoreABC']").eq(i).val() == null
					|| $("input[name='scoreNum']").eq(i).val() == null) {
				total += parseInt('0');
			} else {
				total += parseInt($("input[name='scoreNum']").eq(i).val())
						* Number($("select[name='scoreABC']").eq(i).val());
			}
		}
		avgScore = (total / totalScore).toFixed(2);
		$("#avgScore").html(avgScore);
		$("#totalScore").html(totalScore);
	}

	$("input[name='scoreNum']").on("change", calculate);
	$("select[name='scoreABC']").on("change", calculate);

	/*학기 정보 시간표DB에 저장*/
	$("#termSaveBtn")
			.click(
					function() {
						var lengthS = $("input[name='subName']").length;
						for (let i = 0; i <= lengthS; i++) {
							if ($("input[name='subName']").eq(i).val() != null
									&& $("input[name='scoreNum']").eq(i).val() != null
									&& $("select[name='scoreABC']").eq(i).val() != null) {
								$.ajax({
									url : '${cp}/timetable/tableInsert2',
									data : {
										"tt_name" : termName,
										"s_name" : $("input[name='subName']")
												.eq(i).val(),
										"s_score" : parseInt($(
												"input[name='scoreNum']").eq(i)
												.val()),
										"m_score" : Number($(
												"select[name='scoreABC']")
												.eq(i).val())
									},
									method : 'GET',
									dataType : 'json'
								});
							}
						}
					});
	
	/* function tableLoad(tt_name) {
		$.ajax({
			url : '${cp}/timetable/tableDetailLoad',
			data : {"tt_name" : tt_name},
			method : 'GET',
			dataType : 'json'
		});
	} */
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>