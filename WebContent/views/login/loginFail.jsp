<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인 실패</title>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<script type="text/javascript">
	
	//$(document).ready(function () {
		alert("로그인 실패하였습니다. 다시 로그인 해주세요.");
		
	//});
	</script>
</head>
<body>
	<%@ include file="login.jsp" %>
</body>
</html>