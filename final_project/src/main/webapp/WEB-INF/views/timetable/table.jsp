<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
#table_container {
	margin-bottom: 300px;
}
#mytable {
	text-align: center;
}
#mytable th {
	background-color: #f2f2f2;
}
#mytable td {
	height: 55px;
	vertical-align: middle;
}
.tableTime {
	font-size: 13px;
}
#subList_wrapper {
	display: none;
	position: fixed;
	z-index: 999;
	width: 100%;
	height: 300px;
	bottom:0;
	background-color: white;
	height: 300px;
}
</style>

<!-- Main Content 이건 지우지 마세요-->
<div id="content">
	<div id="subList_wrapper">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>과목번호</th>
					<th>과목명</th>
					<th>교수명</th>
					<th>구분</th>
					<th>학점</th>
					<th>요일/시간</th>
					<th>강의실</th>
					<th>강의평</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.s_num }</td>
						<td>${vo.s_name }</td>
						<td>${vo.s_prof }</td>
						<td>${vo.s_category }</td>
						<td>${vo.s_score }점</td>
						<td>${vo.s_day }/${vo.s_starttime }~${vo.s_endtime }시</td>
						<td>${vo.s_class }</td>
						<td>${vo.s_score }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- Begin Page Content 이건 지우지마세요 -->
	<div class="container-fluid" id="table_container">
		<!-- Page Heading -->

		<div id="mytable_wrapper1">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">내 시간표</h1>
				<a href="javascript:subjectlist()"
					class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
					강의목록</a>
			</div>
			<div id="mytable_wrapper2">
				<table id="mytable" class="table table-bordered" width="100%">
					<tr>
						<th scope="col">시간</th>
						<th scope="col" class="col-2">월</th>
						<th scope="col" class="col-2">화</th>
						<th scope="col" class="col-2">수</th>
						<th scope="col" class="col-2">목</th>
						<th scope="col" class="col-2">금</th>
						<th scope="col">시간</th>
					</tr>
					<tr>
						<td class="tableTime">오전 9시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오전 9시</td>
					</tr>
					<tr>
						<td class="tableTime">오전 10시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오전 10시</td>
					</tr>
					<tr>
						<td class="tableTime">오전 11시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오전 11시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 12시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오후 12시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 1시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오후 1시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 2시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오후 2시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 3시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오후 3시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 4시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오후 4시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 5시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오후 5시</td>
					</tr>
					<tr>
						<td class="tableTime">오후 6시</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tableTime">오후 6시</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 이건 지우지마세요 -->
	</div>
</div>
<!-- 이건 지우지마세요 -->

<script type="text/javascript">
	function subjectlist() {
		$("#subList_wrapper").toggle();
	}
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>