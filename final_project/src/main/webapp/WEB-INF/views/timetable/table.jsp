<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
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
</style>

<!-- Main Content 이건 지우지 마세요-->
<div id="content">
	<!-- Begin Page Content 이건 지우지마세요 -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">내 시간표</h1>
			<a href="javascript:subjectlist()"
				class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
				강의목록 보기</a>
		</div>
		<div>
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
		<!-- 이건 지우지마세요 -->
	</div>
</div>
<!-- 이건 지우지마세요 -->

<script type="text/javascript">
			
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>