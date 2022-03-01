<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
    
<style>

@font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.h1{

	font-family: 'SBAggroB';
}

</style>

	<!-- Topbar -->
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

		<h4 class="h1" style=" ">MYCAMPUS</h4>
 
		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">


			<div class="topbar-divider d-none d-sm-block"></div>
 			<sec:authorize access="isAnonymous()">
             <li class="nav-item active">
                <a class="nav-link" href="${cp}/login">
                    <i class="fa-solid fa-right-to-bracket"></i>
                    <span>로그인</span></a>
            </li>
            <li>
            <li class="nav-item active">
                <a class="nav-link" href="${cp}/join">
                    <i class="fa-solid fa-user-plus"></i>
                    <span>회원가입</span></a>
            </li>
            </li>
			</sec:authorize>
		
<sec:authorize access="isAuthenticated()">
			<!-- Nav Item - User Information -->
				
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span
					class="mr-2 d-none d-lg-inline text-gray-600 small"><sec:authentication property="principal.username"/>님 반갑습니다 ⬇ </span> 
			
			</a> <!-- Dropdown - User Information -->
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="${cp }/member/mymember"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내정보보기
					</a> 
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="{cp}/logout" data-toggle="modal"
						data-target="#logoutModal"> <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						로그아웃하기
					</a>
				</div></li>
</sec:authorize>
		</ul>

	</nav>
	
	<!-- 스크롤 -->		
<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

<!-- 로그아웃 -->
<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">로그아웃하시려면 '로그아웃' 버튼을 눌러주세요.</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<a class="btn btn-primary" href="${cp }/logout">로그아웃</a>
				</div>
			</div>
		</div>
	</div>