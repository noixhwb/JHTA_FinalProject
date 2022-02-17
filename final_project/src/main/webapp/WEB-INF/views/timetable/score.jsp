<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Main Content 이건 지우지 마세요-->
<div id="content">
	<!-- Begin Page Content 이건 지우지마세요 -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">학점계산기</h1>
		</div>

		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-6">
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
											<span id="avgScore" class="font-weight-bold text-gray-800">0.0</span> <span
												class="mb-0">/4.5</span>
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-calendar fa-2x text-gray-300"></i>
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
											<span id="totalScore" class="font-weight-bold text-gray-800">0</span> <span
												class="mb-0">/150</span>
										</div>
									</div>
									<div class="col-auto">
										<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Area Chart -->
				<div class="col-xl-12 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-area">
								<canvas id="myAreaChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<!-- Dropdown Card Example -->
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary" id="DropdownTitle">수강정보입력</h6>
						<select id="selTerm">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
										<td><input name="subName" type="text"></td>
										<td><input name="scoreNum" type="number" value="0" min="0" max="3"></td>
										<td><select name="scoreABC">
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
		</div>

		<!-- 이건 지우지마세요 -->
	</div>
</div>
<!-- 이건 지우지마세요 -->

<script type="text/javascript">
var totalScore = "";
var avgScore= "";
var termName=$("#selTerm").val();
	$("input[name='scoreNum']").change(function() {
		totalScore = 0;
		var lengthN = $("input[name='scoreNum']").length;
		for(let i=0;i<=lengthN;i++) {
			if($("input[name='scoreNum']").eq(i).val()==null) {
				totalScore+=parseInt('0');
			}else {
				totalScore+= parseInt($("input[name='scoreNum']").eq(i).val());
			}
		}
		total = 0;
		var lengthA = $("select[name='scoreABC']").length;
		for(let i=0;i<=lengthA;i++) {
			if($("select[name='scoreABC']").eq(i).val()==null || $("input[name='scoreNum']").eq(i).val()==null) {
				total+=parseInt('0');
			}else {
				total+= parseInt($("input[name='scoreNum']").eq(i).val()) * Number($("select[name='scoreABC']").eq(i).val());
			}
		}
		avgScore=(total/totalScore).toFixed(2);
		$("#avgScore").html(avgScore);
		$("#totalScore").html(totalScore);
	});
	
	$("select[name='scoreABC']").change(function() {
		totalScore = 0;
		var lengthN = $("input[name='scoreNum']").length;
		for(let i=0;i<=lengthN;i++) {
			if($("input[name='scoreNum']").eq(i).val()==null) {
				totalScore+=parseInt('0');
			}else {
				totalScore+= parseInt($("input[name='scoreNum']").eq(i).val());
			}
		}
		total = 0;
		var lengthA = $("select[name='scoreABC']").length;
		for(let i=0;i<=lengthA;i++) {
			if($("select[name='scoreABC']").eq(i).val()==null || $("input[name='scoreNum']").eq(i).val()==null) {
				total+=parseInt('0');
			}else {
				total+= parseInt($("input[name='scoreNum']").eq(i).val()) * Number($("select[name='scoreABC']").eq(i).val());
			}
		}
		avgScore=(total/totalScore).toFixed(2);
		$("#avgScore").html(avgScore);
		$("#totalScore").html(totalScore);
	});
	
	$("#termSaveBtn").click(function() {
		var lengthS = $("input[name='subName']").length;
		for(let i=0;i<=lengthS;i++) {
			if($("input[name='subName']").eq(i).val()!=null &&
				$("input[name='scoreNum']").eq(i).val()!=null &&
				$("select[name='scoreABC']").eq(i).val()!=null ) {
				$.ajax({
					url:'${cp}/timetable/tableInsert2',
					data:{"tt_name":termName,
							"s_name":$("input[name='subName']").eq(i).val(),
							"s_score":parseInt($("input[name='scoreNum']").eq(i).val()),
							"m_score":Number($("select[name='scoreABC']").eq(i).val())},
					method:'GET',
					dataType:'json'
				});
			}
		}
	});
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>
<!-- Page level plugins -->
<script src="${cp}/resources/vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
<script src="${cp}/resources/js/demo/chart-area-demo.js"></script>