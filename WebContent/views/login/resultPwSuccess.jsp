<%@page import="java.util.List"%>
<%@page import="daily.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO userVO = (UserVO)request.getAttribute("userVO");
	String userEmail = userVO.getUserEmail();
	String userId = userVO.getUserId();
%>    
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
	            	<span style="color: #5882FA;"><%=userEmail%></span>
	            </div> 
	        
		        <div class="card-footer">
		            <br><br>
					<div class="d-flex justify-content-center">
						<a href="<%=request.getContextPath() %>/updatePw.do?userId=<%=userId%>&userEmail=<%=userEmail%>">메일로 임시 비밀번호 받기</a>
					</div>
				</div>
			</div>
	    </div>
	</div>
	<!-- footer -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>