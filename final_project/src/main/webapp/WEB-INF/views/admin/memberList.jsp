<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Page level plugins -->
<script src="${ pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<!-- Page level custom scripts -->
<script src="${ pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>
   
<!-- 회원관리 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 회원 목록 및 관리 </h1>
				<!-- 권한/이름? 검색 -->	
			</div>
			
			<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>회원번호</th>
                                            <th>회원 아이디</th>
                                            <th>이름</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>계정 권한</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>회원번호</th>
                                            <th>회원 아이디</th>
                                            <th>이름</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>계정 권한</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="vo" items="${ mList }">
                                    	<tr>
                                            <td>${vo.m_num }</td>
                                            <td>${vo.m_id }</td>
                                            <td>${vo.m_name }</td>
                                            <td>${vo.m_phone }</td>
                                            <td>${vo.m_email }</td>
                                            <td>${vo.m_enabled }</td>
                                        </tr>
                                    </c:forEach>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                            <td>$170,750</td>
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            <td>66</td>
                                            <td>2009/01/12</td>
                                            <td>$86,000</td>
                                        </tr>
                                        <tr>
                                            <td>Cedric Kelly</td>
                                            <td>Senior Javascript Developer</td>
                                            <td>Edinburgh</td>
                                            <td>22</td>
                                            <td>2012/03/29</td>
                                            <td>$433,060</td>
                                        </tr>
                                        <tr>
                                            <td>Airi Satou</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>33</td>
                                            <td>2008/11/28</td>
                                            <td>$162,700</td>
                                        </tr>
                                        <tr>
                                            <td>Jennifer Chang</td>
                                            <td>Regional Director</td>
                                            <td>Singapore</td>
                                            <td>28</td>
                                            <td>2010/11/14</td>
                                            <td>$357,650</td>
                                        </tr>
                                        <tr>
                                            <td>Brenden Wagner</td>
                                            <td>Software Engineer</td>
                                            <td>San Francisco</td>
                                            <td>28</td>
                                            <td>2011/06/07</td>
                                            <td>$206,850</td>
                                        </tr>
                                        <tr>
                                            <td>Fiona Green</td>
                                            <td>Chief Operating Officer (COO)</td>
                                            <td>San Francisco</td>
                                            <td>48</td>
                                            <td>2010/03/11</td>
                                            <td>$850,000</td>
                                        </tr>
                                        <tr>
                                            <td>Brielle Williamson</td>
                                            <td>Integration Specialist</td>
                                            <td>New York</td>
                                            <td>61</td>
                                            <td>2012/12/02</td>
                                            <td>$372,000</td>
                                        </tr>
                                        <tr>
                                            <td>Herrod Chandler</td>
                                            <td>Sales Assistant</td>
                                            <td>San Francisco</td>
                                            <td>59</td>
                                            <td>2012/08/06</td>
                                            <td>$137,500</td>
                                        </tr>
                                       </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div> 
<!-- Content Row -->
			<div class="row">

<!-- Content Column -->
			<c:forEach var="vo" items="${ mList }">
			<!-- 첫번째 Content Column -->
			<div class="col-lg-6 mb-4">

<!-- Approach -->
				<!-- 동아리 -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드제목 왼쪽 -->
								<h6 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ vo.m_num }</h6>
							</div>
							<div class="col-md-4"> <!-- 카드제목 오른쪽 -->
							</div>
						</div>
					</div>
					
					<div class="card-body"> <!-- body -->
						<div class="row g-0">
							<div class="col-md-8"> <!-- 카드본문 왼쪽 (정보) -->
								<div class="card-body">
									<h6 class="card-title"> 
										<!--  --> 
									</h6>
									<p class="card-text">
										
											<div class="row g-0">
												<div class="col-md-6">
													<ul id="dot">
														<li>회원번호 : ${vo.m_num }</li> <!-- 1번 -->
														<li>아이디 : ${vo.m_id }</li> <!-- 2번 --><br>
														<a href="${ cp }/member/mymember?m_num=${ vo.m_num }">
														회원정보보기</a>
													</ul>
												</div>
												<div class="col-md-6">
													<ul id="dot">
														<li>연락처 : ${vo.m_phone }</li> <!-- 3번 -->
														<li>계정권한 : ${vo.m_enabled }</li> <!-- 4번 -->
													</ul>
												</div>
											</div>
									</p>
								</div>
							</div>
							<div class="col-md-4"> <!-- 카드본문 오른쪽 (포스터) -->
								<img src="${ cp }/resources/images/circle/${ vo.m_profile }" 
									 class="img-fluid rounded-start" alt="..." style="max-width: 150px;">
							</div>
						</div>
					</div> <!-- body 끝 -->
					
				</div> <!-- 끝 -->
				

			</div> <!-- 첫번쨰 Content Column 끝 -->
			</c:forEach>


		</div> <!-- Content Row 끝 -->

		</div> <!-- container-fluid (Main Content의 메인부분) 끝 -->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝 -->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<style>
#dot{
   list-style:none;
   padding-left:5px;
   }
</style>       
