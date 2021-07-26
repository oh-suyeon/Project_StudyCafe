<%@page import="java.util.List"%>
<%@page import="daily.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>비밀번호 찾기 조회 결과</title>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<link rel="stylesheet" href="/css/login/searchId.css">
	<style type="text/css">
		.card-body span {
			font-size: 2rem;
			font-weight: bold;
			color: black;
		}
	</style>
</head>
<body>
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	<div class="container">
	    <div class="h-100">
	        <div class="card">
	        	<br><br><br>
	            <div class="card-body">
	            	<span style="color: #5882FA;">입력하신 정보와 일치하는 회원정보가 <br>존재하지 않습니다.</span>
	            </div> 
	        
		        <div class="card-footer">
		            <br><br>
					<div class="d-flex justify-content-center">
		            	<a href="<%=request.getContextPath() %>/searchId.do">아이디 찾기</a>
						<a href="<%=request.getContextPath() %>/selectIdEmail.do">비밀번호 다시 찾기</a> 
						<a href="<%=request.getContextPath() %>/login.do">로그인하기</a>
					</div>
				</div>
			</div>
	    </div>
	</div>
	<!-- footer -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>