<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> DAILY | GUIDANCE </title>

	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<link href="<%=request.getContextPath() %>/css/introduce/mainIntroduce.css" type="text/css" rel="stylesheet">
</head>
<body>

	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	
	
	<!-- 해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">이용 안내</span>
		</div>
	
		<div class="divPadding marginBottom30 text-center">
			<img alt="guidance" id="guidance1" src="../../image/guidance.png">
			<img alt="guidance" id="guidance2" src="../../image/guidance.jpg">
		</div>
	</div>

	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>