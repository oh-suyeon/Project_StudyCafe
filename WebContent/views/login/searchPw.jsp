<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>비밀번호찾기</title>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<link rel="stylesheet" href="/css/login/searchPw.css">
</head>
<body>
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	<div class="container">
	    <div class="h-100">
	        <div class="card">
	            <div class="card-header">
	            	<br>
	                <h3>비밀번호 찾기</h3>
	            </div>
	            <br>
	            <div class="card-body">
	            	<form class="form-horizontal" id="fm" action="<%=request.getContextPath() %>/selectIdEmail.do" method="post">
						 <div class="input-group form-group">
							<div class="input-group-prepend">
								<span>아이디</span>
							</div>
							<input type="text" class="form-control" placeholder="아이디를 입력하세요." id="userId" name="userId">
						</div>
						<br>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span>이메일</span>
							</div>
							<input type="email" class="form-control" placeholder="이메일을 입력하세요." id="userEmail" name="userEmail">
						</div>
						<br><br>
						<div class="form-group">
							<button type="submit" class="btn float-right searchPw_btn">비밀번호 찾기</button>
						</div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- footer -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>