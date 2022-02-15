<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<!-- Main Content 이건 지우지 마세요-->
<div id="content">
	<!-- Begin Page Content 이건 지우지마세요 -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">학점계산기</h1>
			<a href="#"
				class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
				class="fas fa-download fa-sm text-white-50"></i> 시간표불러오기</a>
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
											<span class="font-weight-bold text-gray-800">4.3</span> <span
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
											<span class="font-weight-bold text-gray-800">120</span> <span
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
						<h6 class="m-0 font-weight-bold text-primary">Dropdown Card
							Example</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">학기선택:</div>
								<a class="dropdown-item" href="#">1학년 1학기</a> <a
									class="dropdown-item" href="#">1학년 2학기</a> <a
									class="dropdown-item" href="#">2학년 1학기</a> <a
									class="dropdown-item" href="#">2학년 2학기</a> <a
									class="dropdown-item" href="#">3학년 1학기</a> <a
									class="dropdown-item" href="#">3학년 2학기</a> <a
									class="dropdown-item" href="#">4학년 1학기</a> <a
									class="dropdown-item" href="#">4학년 2학기</a>
							</div>
						</div>
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
										<td><input type="text"></td>
										<td><input type="number" min="1" max="3"></td>
										<td><select>
												<option>A+</option>
												<option>A</option>
												<option>B+</option>
												<option>B</option>
												<option>C+</option>
												<option>C</option>
												<option>D+</option>
												<option>D</option>
												<option>F</option>
												<option>P</option>
												<option>NP</option>
										</select></td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="number" min="1" max="3"></td>
										<td><select>
												<option>A+</option>
												<option>A</option>
												<option>B+</option>
												<option>B</option>
												<option>C+</option>
												<option>C</option>
												<option>D+</option>
												<option>D</option>
												<option>F</option>
												<option>P</option>
												<option>NP</option>
										</select></td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="number" min="1" max="3"></td>
										<td><select>
												<option>A+</option>
												<option>A</option>
												<option>B+</option>
												<option>B</option>
												<option>C+</option>
												<option>C</option>
												<option>D+</option>
												<option>D</option>
												<option>F</option>
												<option>P</option>
												<option>NP</option>
										</select></td>
									</tr>
									<tr>
										<td><input type="text"></td>
										<td><input type="number" min="1" max="3"></td>
										<td><select>
												<option>A+</option>
												<option>A</option>
												<option>B+</option>
												<option>B</option>
												<option>C+</option>
												<option>C</option>
												<option>D+</option>
												<option>D</option>
												<option>F</option>
												<option>P</option>
												<option>NP</option>
										</select></td>
									</tr>
								</tbody>
							</table>
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
	
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>