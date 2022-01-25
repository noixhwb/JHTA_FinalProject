<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Topbar Search -->
		<form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
		</form>
 				
</head>
<body>
${vo.j_num }
${vo.j_company }
${vo.j_startdate }
${vo.j_enddate }
${vo.j_duty }
${vo.j_region }
${vo.j_career }
${vo.j_view }
${vo.j_url }
${vo.j_img }

</body>
</html>