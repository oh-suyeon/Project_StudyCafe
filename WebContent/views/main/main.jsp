<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% // 로그인 세션 확인
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DAILY | MAIN</title>
	
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<link href="<%=request.getContextPath() %>/css/main/main2.css" type="text/css" rel="stylesheet">

</head>
<body>

	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	
	<!-- 해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" role="listbox">
		      <div class="item active" style="background-color: silver;">
		        <img src="../../image/cafeMain1231.png" class="img-responsive" alt="Image" style="width: 1200px;">
		      </div>
		
		      <div class="item" >
		        <img src="../../image/interior1231.png" class="img-responsive"  alt="Image" style="width: 1200px;">
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</div>
	</div>

	<div class="container divPadding alignCenter">
		<div class="smallIcon">
			<a href="<%=request.getContextPath()%>/views/introduce/mainIntroduceGuidance.jsp">
				<img src="../../image/information.png"
				class="img-responsive" alt="Image">
			</a>
			<p>이용 안내</p>
		</div>
		<div class="smallIcon">
			<a href="<%=request.getContextPath()%>/searchCafelist.do">
				<img src="../../image/search.png"
				class="img-responsive" alt="Image">
			</a>
			<p>지점 찾기 예약</p>
		</div>
		<div class="smallIcon">
			<a href="<%=request.getContextPath()%>/gsRecruitList.do">
				<img src="../../image/group.png"
				class="img-responsive" alt="Image">
			</a>
			<p>그룹 스터디 모집</p>
		</div>
	</div>

	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>